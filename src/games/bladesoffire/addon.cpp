/*
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/date.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = renodx::templates::settings::JoinSettings({renodx::templates::settings::CreateDefaultSettings({
                                                                                            {"ToneMapType", {.binding = &shader_injection.tone_map_type}},
                                                                                            {"ToneMapPeakNits", {.binding = &shader_injection.peak_white_nits}},
                                                                                            {"ToneMapGameNits", {.binding = &shader_injection.diffuse_white_nits}},
                                                                                            {"ToneMapUINits", {.binding = &shader_injection.graphics_white_nits}},
                                                                                            //{"ToneMapGammaCorrection", {.binding = &shader_injection.gamma_correction, .default_value = 0.f}},
                                                                                            {"ToneMapHueCorrection", {.binding = &shader_injection.tone_map_hue_correction, .default_value = 90.f, .tooltip = "Emulates vanilla SDR hue shifts."}},
                                                                                            {"ToneMapHueShift", {.binding = &shader_injection.tone_map_hue_shift, .default_value = 0.f, .label = "Chrominance Correction", .tooltip = "Emulates vanilla SDR chrominance/blowout."}},
                                                                                            {"ToneMapScaling", {.binding = &shader_injection.tone_map_per_channel, .default_value = 1.f}},
                                                                                            {"ColorGradeExposure", {.binding = &shader_injection.tone_map_exposure}},
                                                                                            {"ColorGradeHighlights", {.binding = &shader_injection.tone_map_highlights}},
                                                                                            {"ColorGradeShadows", {.binding = &shader_injection.tone_map_shadows}},
                                                                                            {"ColorGradeContrast", {.binding = &shader_injection.tone_map_contrast}},
                                                                                            {"ColorGradeSaturation", {.binding = &shader_injection.tone_map_saturation}},
                                                                                            {"ColorGradeHighlightSaturation", {.binding = &shader_injection.tone_map_highlight_saturation}},
                                                                                            {"ColorGradeBlowout", {.binding = &shader_injection.tone_map_blowout}},
                                                                                            {"ColorGradeFlare", {.binding = &shader_injection.tone_map_flare}},
                                                                                        }),
                                                                                        {
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .key = "CustomSharpening",
                                                                                                .binding = &shader_injection.custom_sharpening,
                                                                                                .default_value = 100.f,
                                                                                                .label = "Sharpening",
                                                                                                .section = "Effects",
                                                                                                .tooltip = "Controls the amount of sharpening, 100 is the game's default.",
                                                                                                .max = 100.f,
                                                                                                .parse = [](float value) { return value * 0.01f; },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "Reset All",
                                                                                                .section = "Presets",
                                                                                                .group = "button-line-1",
                                                                                                .on_change = []() {
                                                                                                  for (auto setting : settings) {
                                                                                                    if (setting->key.empty()) continue;
                                                                                                    if (!setting->can_reset) continue;
                                                                                                    renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
                                                                                                  }
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "RenoDX Discord",
                                                                                                .section = "Links",
                                                                                                .group = "button-line-1",
                                                                                                .tint = 0x5865F2,
                                                                                                .on_change = []() {
                                                                                                  renodx::utils::platform::LaunchURL("https://discord.gg/Ce9b", "QHQrSV");
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "HDR Den Discord",
                                                                                                .section = "Links",
                                                                                                .group = "button-line-1",
                                                                                                .tint = 0x5865F2,
                                                                                                .on_change = []() {
                                                                                                  renodx::utils::platform::LaunchURL("https://discord.gg/XUhv", "tR54yc");
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "Github",
                                                                                                .section = "Links",
                                                                                                .group = "button-line-1",
                                                                                                .on_change = []() {
                                                                                                  renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx");
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "Ritsu's Ko-Fi",
                                                                                                .section = "Links",
                                                                                                .group = "button-line-1",
                                                                                                .tint = 0xFF5F5F,
                                                                                                .on_change = []() {
                                                                                                  renodx::utils::platform::LaunchURL("https://ko-fi.com/ritsucecil");
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "ShortFuse's Ko-Fi",
                                                                                                .section = "Links",
                                                                                                .group = "button-line-1",
                                                                                                .tint = 0xFF5F5F,
                                                                                                .on_change = []() {
                                                                                                  renodx::utils::platform::LaunchURL("https://ko-fi.com/shortfuse");
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::BUTTON,
                                                                                                .label = "HDR Den's Ko-Fi",
                                                                                                .section = "Links",
                                                                                                .group = "button-line-1",
                                                                                                .tint = 0xFF5F5F,
                                                                                                .on_change = []() {
                                                                                                  renodx::utils::platform::LaunchURL("https://ko-fi.com/hdrden");
                                                                                                },
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::TEXT,
                                                                                                .label = "Game mod by Ritsu & akuru, RenoDX Framework by ShortFuse.",
                                                                                                .section = "About",
                                                                                            },
                                                                                            new renodx::utils::settings::Setting{
                                                                                                .value_type = renodx::utils::settings::SettingValueType::TEXT,
                                                                                                .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
                                                                                                .section = "About",
                                                                                            },
                                                                                        }});

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapUINits", 203.f},
      {"ToneMapGammaCorrection", 0.f},
      {"ToneMapHueCorrection", 0.f},
      {"ToneMapHueShift", 0.f},
      {"ToneMapScaling", 0.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
      {"CustomSharpening", 100.f},
  });
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[2]->default_value = roundf(peak.value());
  } else {
    settings[2]->default_value = 1000.f;
  }
  settings[2]->can_reset = true;

  settings[3]->default_value = fmin(renodx::utils::swapchain::ComputeReferenceWhite(settings[2]->default_value), 203.f);

  fired_on_init_swapchain = true;
}

bool initialized = false;

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Blades of Fire";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      renodx::mods::shader::on_create_pipeline_layout = [](auto, auto params) {
        if (params.size() >= 20) return false;

        return true;
      };

      if (!initialized) {
        renodx::mods::shader::force_pipeline_cloning = true;
        renodx::mods::shader::expected_constant_buffer_space = 50;
        renodx::mods::shader::expected_constant_buffer_index = 13;
        renodx::mods::shader::allow_multiple_push_constants = true;

        renodx::mods::swapchain::expected_constant_buffer_index = 13;
        renodx::mods::swapchain::expected_constant_buffer_space = 50;

        renodx::mods::swapchain::use_resource_cloning = true;
        renodx::mods::swapchain::SetUseHDR10();

        /* renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
            .old_format = reshade::api::format::r10g10b10a2_unorm,
            .new_format = reshade::api::format::r16g16b16a16_float,
            .dimensions = {.width = 32, .height = 32, .depth = 32},
            .resource_tag = 1.f,
        }); */

        initialized = true;
      }

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  // renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
