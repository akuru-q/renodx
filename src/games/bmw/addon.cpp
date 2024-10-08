/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <embed/0x97F4075A.h>  // tonemapper (sharpen > 0, vignette active)
#include <embed/0xF64BD119.h>  // tonemapper (sharpen > 0, vignette disabled)
#include <embed/0xD4C3492D.h>  // tonemapper (sharpen = 0, vignette active)
#include <embed/0x9FBC9441.h>  // tonemapper (sharpen = 0, vignette disabled)

#include <embed/0x681FFC73.h>  // tonemapper ch 4 (sharpen > 0, vignette active)
#include <embed/0x9312D584.h>  // tonemapper ch 4 (sharpen > 0, vignette disabled) 
#include <embed/0x20EA889F.h>  // tonemapper ch 4 (sharpen = 0, vignette active)
#include <embed/0x582AE183.h>  // tonemapper ch 4 (sharpen = 0, vignette disabled) 

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {
    // mod requires UE HDR, works with OutputDevice 3/4

    CustomShaderEntry(0x97F4075A),   // tonemapper (sharpen > 0, vignette active)
    CustomShaderEntry(0xF64BD119), // tonemapper (sharpen > 0, vignette disabled) 
    CustomShaderEntry(0xD4C3492D), // tonemapper (sharpen = 0, vignette active)
    CustomShaderEntry(0x9FBC9441), // tonemapper (sharpen = 0, vignette disabled) 

    CustomShaderEntry(0x681FFC73), // tonemapper ch 4 (sharpen > 0, vignette active)
    CustomShaderEntry(0x9312D584), // tonemapper ch 4 (sharpen > 0, vignette disabled) 
    CustomShaderEntry(0x20EA889F), // tonemapper ch 4 (sharpen = 0, vignette active)
    CustomShaderEntry(0x582AE183), // tonemapper ch 4 (sharpen = 0, vignette disabled) 
};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "toneMapType",
        .binding = &shader_injection.toneMapType,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = false,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "None", "ACES", "RenoDX"},
        //.labels = {"None", "DICE", "ACES", "RenoDX"},
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapPeakNits",
        .binding = &shader_injection.toneMapPeakNits,
        .default_value = 1000.f,
        .can_reset = false,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 48.f,
        .max = 4000.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapGameNits",
        .binding = &shader_injection.toneMapGameNits,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100%% white in nits",
        .min = 48.f,
        .max = 500.f,
    },
    //new renodx::utils::settings::Setting{
    //    .key = "toneMapUINits",
    //    .binding = &shader_injection.toneMapUINits,
    //    .default_value = 203.f,
    //    .label = "UI Brightness",
    //    .section = "Tone Mapping",
    //    .tooltip = "Sets the brightness of UI and HUD elements in nits",
    //    .min = 48.f,
    //    .max = 500.f,
    //},
    new renodx::utils::settings::Setting{
        .key = "toneMapGammaCorrection",
        .binding = &shader_injection.toneMapGammaCorrection,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1,
        .can_reset = false,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a 2.2 EOTF (use with HDR or sRGB)",
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueCorrection",
        .binding = &shader_injection.toneMapHueCorrection,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .can_reset = false,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Applies hue shift emulation before tonemapping",
        .labels = {"None", "Reinhard", "ACES BT709", "ACES AP1"},
    },
    //new renodx::utils::settings::Setting{
    //    .key = "toneMapHueCorrection",
    //    .binding = &shader_injection.toneMapVanillaHueCorrection,
    //    .default_value = 50.f,
    //    .label = "Vanilla Hue Correction",
    //    .section = "Tone Mapping",
    //    .tooltip = "Emulates hue shifting from the vanilla tonemapper",
    //    .max = 100.f,
    //    .parse = [](float value) { return value * 0.01f; },
    //},
    new renodx::utils::settings::Setting{
        .key = "blend",
        .binding = &shader_injection.blend,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1,
        .can_reset = false,
        .label = "Blend SDR/HDR",
        .section = "Tone Mapping",
        .tooltip = "Enable/Disable Blend",
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeExposure",
        .binding = &shader_injection.colorGradeExposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 10.f,
        .format = "%.2f",
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeHighlights",
        .binding = &shader_injection.colorGradeHighlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeShadows",
        .binding = &shader_injection.colorGradeShadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeContrast",
        .binding = &shader_injection.colorGradeContrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeSaturation",
        .binding = &shader_injection.colorGradeSaturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    //new renodx::utils::settings::Setting{
    //    .key = "colorGradeBlowout",
    //    .binding = &shader_injection.colorGradeBlowout,
    //    .default_value = 70.f,
    //    .label = "Blowout",
    //    .section = "Color Grading",
    //    .tooltip = "Controls highlight desaturation due to overexposure.",
    //    .max = 100.f,
    //    //.is_enabled = []() { return shader_injection.toneMapType == 3; },  // Dont enable unless RenoDRT is selected
    //    .parse = [](float value) { return value * 0.01f; },
    //},
    //new renodx::utils::settings::Setting{
    //    .key = "colorGradeLUTStrength",
    //    .binding = &shader_injection.colorGradeLUTStrength,
    //    .default_value = 100.f,
    //    .label = "LUT Strength",
    //    .section = "Color Grading",
    //    .max = 100.f,
    //    .is_enabled = []() { return shader_injection.toneMapType != 0; },
    //    .parse = [](float value) { return value * 0.01f; },
    //},
    //new renodx::utils::settings::Setting{
    //    .key = "debugVanillaMidGrey",
    //    .binding = &shader_injection.debugVanillaMidGrey,
    //    .default_value = 10.f,
    //    .label = "Vanilla Mid Grey",
    //    .section = "Color Grading",
    //    .max = 100.f,
    //    .parse = [](float value) { return value * 0.01f; },
    //},
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Discord",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          system("start https://discord.gg/5WZXDpmbpP");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-1",
        .on_change = []() {
          system("start https://github.com/clshortfuse/renodx");
        },
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("toneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("toneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGameNits", 203.f);
  //renodx::utils::settings::UpdateSetting("toneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGammaCorrection", 0);
  renodx::utils::settings::UpdateSetting("toneMapHueCorrection", 0.f);
  //renodx::utils::settings::UpdateSetting("toneMapVanillaHueCorrection", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("colorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeSaturation", 50.f);
  //renodx::utils::settings::UpdateSetting("colorGradeBlowout", 50.f);
  renodx::utils::settings::UpdateSetting("blend", 0);
  //renodx::utils::settings::UpdateSetting("toneMapHueCorrection", 50.f);
  //renodx::utils::settings::UpdateSetting("colorGradeLUTStrength", 0.f);
}

}  // namespace

// NOLINTBEGIN(readability-identifier-naming)

extern "C" __declspec(dllexport) const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) const char* DESCRIPTION = "RenoDX Lite for Black Myth Wukong";

// NOLINTEND(readability-identifier-naming)

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      renodx::mods::shader::expected_constant_buffer_index = 2;

      renodx::mods::shader::force_pipeline_cloning = false;  // So the mod works with the toolkit

      //renodx::mods::swapchain::force_borderless = false;     // needed for stability
      //renodx::mods::swapchain::prevent_full_screen = false;  // needed for stability

      //renodx::mods::swapchain::SetUseHDR10(true); // OutputDevice 3 is HDR10

      //renodx::mods::swapchain::upgrade_resource_views = false;

      // Game doesn't need any upgrades!

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);

  //renodx::mods::swapchain::Use(fdw_reason); // doesn't need swapchain upgrade

  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
