/*
 * Copyright (C) 2023 Musa Haji
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/date.hpp"
#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0xDEAFF53A),  // Bloom
    CustomShaderEntry(0xD7E646E3),  // Tonemap

    CustomShaderEntry(0x2F04633E),  // Video
};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "toneMapType",
        .binding = &RENODX_TONE_MAP_TYPE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .can_reset = false,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "None", "ACES", "RenoDRT"},
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapPeakNits",
        .binding = &RENODX_PEAK_WHITE_NITS,
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
        .binding = &RENODX_DIFFUSE_WHITE_NITS,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapUINits",
        .binding = &RENODX_GRAPHICS_WHITE_NITS,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapGammaCorrection",
        .binding = &RENODX_GAMMA_CORRECTION,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a 2.2 EOTF",
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueCorrection",
        .binding = &RENODX_TONE_MAP_HUE_CORRECTION,
        .default_value = 75.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates Vanilla hue shifts.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapScaling",
        .binding = &RENODX_TONE_MAP_PER_CHANNEL,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Scaling",
        .section = "Tone Mapping",
        .tooltip = "Luminance scales colors consistently while per-channel saturates and blows out sooner",
        .labels = {"Luminance", "Per Channel"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeExposure",
        .binding = &RENODX_TONE_MAP_EXPOSURE,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 10.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },

    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeHighlights",
        .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeShadows",
        .binding = &RENODX_TONE_MAP_SHADOWS,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeContrast",
        .binding = &RENODX_TONE_MAP_CONTRAST,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeSaturation",
        .binding = &RENODX_TONE_MAP_SATURATION,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 3.f; },
        .parse = [](float value) { return (value * -0.02f) + 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &RENODX_TONE_MAP_BLOWOUT,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3.f; },
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeFlare",
        .binding = &RENODX_TONE_MAP_FLARE,
        .default_value = 50.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3.f; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeRestorationMethod",
        .binding = &RENODX_TONE_MAP_RESTORATION_METHOD,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Grading Application",
        .section = "Color Grading",
        .tooltip = "Chooses method to apply grading for HDR.",
        .labels = {"Luminance", "Per Channel", "Perceptual"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeLUTStrength",
        .binding = &CUSTOM_LUT_STRENGTH,
        .default_value = 100.f,
        .label = "LUT Strength",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxBloom",
        .binding = &CUSTOM_BLOOM,
        .default_value = 100.f,
        .label = "Bloom",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxGrainStrength",
        .binding = &CUSTOM_GRAIN_STRENGTH,
        .default_value = 50.f,
        .label = "Grain Strength",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Color Grading Templates",
        .group = "Templates",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Recommended Settings",
        .section = "Color Grading Templates",
        .group = "Templates",
        .tooltip = "Less black crush and by luminance tonemapper for less hue shifting",
        .on_change = []() {
          renodx::utils::settings::UpdateSetting("toneMapType", 3.f);
          renodx::utils::settings::UpdateSetting("toneMapGameNits", 203.f);
          renodx::utils::settings::UpdateSetting("toneMapUINits", 203.f);
          renodx::utils::settings::UpdateSetting("toneMapGammaCorrection", 1.f);
          renodx::utils::settings::UpdateSetting("toneMapHueCorrection", 75.f);
          renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.f);
          renodx::utils::settings::UpdateSetting("colorGradeHighlights", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeShadows", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeContrast", 31.f);
          renodx::utils::settings::UpdateSetting("colorGradeSaturation", 60.f);
          renodx::utils::settings::UpdateSetting("ColorGradeRestorationMethod", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeLUTStrength", 100.f);
          renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 45.f);
          renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeFlare", 75.f);
          renodx::utils::settings::UpdateSetting("FxBloom", 50.f);
          renodx::utils::settings::UpdateSetting("FxGrainStrength", 50.f);
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Discord",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://discord.gg/", "5WZXDpmbpP");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "More Mods",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x2B3137,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://github.com/", "clshortfuse/renodx/wiki/Mods");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0x2B3137,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://github.com/", "clshortfuse/renodx/");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Musa's Ko-Fi",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0xFF5A16,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://ko-fi.com/", "musaqh/");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
        .section = "About",
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("toneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("toneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGammaCorrection", 0.f);
  renodx::utils::settings::UpdateSetting("toneMapHueCorrection", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("colorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeBlowout", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeLUTStrength", 100.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 100.f);
  renodx::utils::settings::UpdateSetting("FxGrainStrength", 0.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[1]->default_value = peak.value();
    settings[1]->can_reset = true;
  }
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Elite Dangerous";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::force_pipeline_cloning = true;

      // swapchain proxy
      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::expected_constant_buffer_index = 13;
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;

      // film grain
      renodx::utils::random::binds.push_back(&shader_injection.custom_random);

#if 1  // NOLINT main textures
      for (auto index : {3, 4}) {
        renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
            .old_format = reshade::api::format::r8g8b8a8_typeless,
            .new_format = reshade::api::format::r16g16b16a16_float,
            .index = index,
        });
      }
#endif

#if 0  
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
        //   .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });
#endif
#if 0  // NOLINT Seemingly unused (they might be used for copies of the scene buffer used as UI background)
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_unorm_srgb,
          .new_format = reshade::api::format::r16g16b16a16_float,
      });
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
      });
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
      });
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm_srgb,
          .new_format = reshade::api::format::r16g16b16a16_float,
      });
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r11g11b10_float,
          .new_format = reshade::api::format::r16g16b16a16_float,
      });
#endif

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::utils::random::Use(fdw_reason);

  return TRUE;
}
