/*
 * Copyright (C) 2025 Carlos Lopez
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
#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = {
  new renodx::utils::settings::Setting{
      .key = "SettingsMode",
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 0.f,
      .can_reset = false,
      .label = "Settings Mode",
      .labels = {"Simple", "Intermediate", "Advanced"},
      .is_global = true,
  },
  new renodx::utils::settings::Setting{
      .key = "ToneMapType",
      .binding = &RENODX_TONE_MAP_TYPE,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 1.f,
      .can_reset = true,
      .label = "Tone Mapper",
      .section = "Tone Mapping",
      .tooltip = "Sets the tone mapper type",
      .labels = {"Vanilla", "ACES", "RenoDRT"},
      .parse = [](float value) { return value == 0.f ? 0.f : value + 1.f; },
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
  },
  new renodx::utils::settings::Setting{
      .key = "ToneMapPeakNits",
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
      .key = "ToneMapGameNits",
      .binding = &RENODX_DIFFUSE_WHITE_NITS,
      .default_value = 203.f,
      .label = "Game Brightness",
      .section = "Tone Mapping",
      .tooltip = "Sets the value of 100% white in nits",
      .min = 48.f,
      .max = 500.f,
  },
  new renodx::utils::settings::Setting{
      .key = "ToneMapUINits",
      .binding = &RENODX_GRAPHICS_WHITE_NITS,
      .default_value = 203.f,
      .label = "UI Brightness",
      .section = "Tone Mapping",
      .tooltip = "Sets the brightness of UI and HUD elements in nits",
      .min = 48.f,
      .max = 500.f,
  },
  //new renodx::utils::settings::Setting{
  //    .key = "ToneMapHueProcessor",
  //    .binding = &RENODX_TONE_MAP_HUE_PROCESSOR,
  //    .value_type = renodx::utils::settings::SettingValueType::INTEGER,
  //    .default_value = 0.f,
  //    .label = "Hue Processor",
  //    .section = "Tone Mapping",
  //    .tooltip = "Selects hue processor",
  //    .labels = {"OKLab", "ICtCp"},
  //    .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
  //    .is_visible = []() { return settings[0]->GetValue() >= 2; },
  //},
  new renodx::utils::settings::Setting{
      .key = "ToneMapHueShift",
      .binding = &RENODX_TONE_MAP_HUE_SHIFT,
      .default_value = 75.f,
      .label = "Hue Shift",
      .section = "Tone Mapping",
      .tooltip = "Hue-shift emulation strength.",
      .min = 0.f,
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
      .parse = [](float value) { return value * 0.01f; },
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
  },
  //new renodx::utils::settings::Setting{
  //    .key = "ToneMapWorkingColorSpace",
  //    .binding = &RENODX_TONE_MAP_WORKING_COLOR_SPACE,
  //    .value_type = renodx::utils::settings::SettingValueType::INTEGER,
  //    .default_value = 0.f,
  //    .label = "Working Color Space",
  //    .section = "Tone Mapping",
  //    .labels = {"BT709", "BT2020", "AP1"},
  //    .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
  //    .is_visible = []() { return settings[0]->GetValue() >= 2; },
  //},
  new renodx::utils::settings::Setting{
      .key = "ToneMapHueCorrection",
      .binding = &RENODX_TONE_MAP_HUE_CORRECTION,
      .default_value = 100.f,
      .label = "Hue Correction",
      .section = "Tone Mapping",
      .tooltip = "Hue retention strength.",
      .min = 0.f,
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
      .parse = [](float value) { return value * 0.01f; },
      .is_visible = []() { return settings[0]->GetValue() >= 2; },
  },
  new renodx::utils::settings::Setting{
      .key = "GammaCorrection",
      .binding = &RENODX_GAMMA_CORRECTION,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 1.f,
      .label = "Gamma Correction",
      .section = "Tone Mapping",
      .tooltip = "Emulates a display EOTF.",
      .labels = {"Off (sRGB)", "2.2", "BT.1886"},
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
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
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
      .is_visible = []() { return settings[0]->GetValue() >= 2; },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeExposure",
      .binding = &RENODX_TONE_MAP_EXPOSURE,
      .default_value = 1.f,
      .label = "Exposure",
      .section = "Color Grading",
      .max = 2.f,
      .format = "%.2f",
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeHighlights",
      .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
      .default_value = 50.f,
      .label = "Highlights",
      .section = "Color Grading",
      .max = 100.f,
      .parse = [](float value) { return value * 0.02f; },
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeShadows",
      .binding = &RENODX_TONE_MAP_SHADOWS,
      .default_value = 50.f,
      .label = "Shadows",
      .section = "Color Grading",
      .max = 100.f,
      .parse = [](float value) { return value * 0.02f; },
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeContrast",
      .binding = &RENODX_TONE_MAP_CONTRAST,
      .default_value = 50.f,
      .label = "Contrast",
      .section = "Color Grading",
      .max = 100.f,
      .parse = [](float value) { return value * 0.02f; },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeSaturation",
      .binding = &RENODX_TONE_MAP_SATURATION,
      .default_value = 45.f,
      .label = "Saturation",
      .section = "Color Grading",
      .max = 100.f,
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
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
      .parse = [](float value) { return value * 0.02f; },
      .is_visible = []() { return settings[0]->GetValue() >= 1; },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeBlowout",
      .binding = &RENODX_TONE_MAP_BLOWOUT,
      .default_value = 0.f,
      .label = "Blowout",
      .section = "Color Grading",
      .tooltip = "Controls highlight desaturation due to overexposure.",
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
      .parse = [](float value) { return max(value * 0.01f, 0.000001f); },
  },
  new renodx::utils::settings::Setting{
      .key = "ColorGradeFlare",
      .binding = &RENODX_TONE_MAP_FLARE,
      .default_value = 0.f,
      .label = "Flare",
      .section = "Color Grading",
      .tooltip = "Flare/Glare Compensation",
      .max = 100.f,
      .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
      .parse = [](float value) { return value * 0.01f; },
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "RenoDRT Preset 1",
      .section = "Presets",
      .group = "button-line-1",
      .tint = 0xb5b2b1,
      .on_change = []() {
        renodx::utils::settings::UpdateSetting("ToneMapType", 2.f);
        //renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
        //renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
        renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 100.f);
        renodx::utils::settings::UpdateSetting("ToneMapHueShift", 75.f);
        renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
        renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeContrast", 80.f);
        renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 80.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation",50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 82.f);
        renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
        //renodx::utils::settings::UpdateSetting("ToneMapConfiguration", 1.f);
      }
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "RenoDRT Preset 2",
      .section = "Presets",
      .group = "button-line-1",
      .tint = 0xb5b2b1,
      .on_change = []() {
        renodx::utils::settings::UpdateSetting("ToneMapType", 2.f);
        //renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
        //renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
        renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 100.f);
        renodx::utils::settings::UpdateSetting("ToneMapHueShift", 75.f);
        renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapScaling", 1.f);
        renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 45.f);
        renodx::utils::settings::UpdateSetting("ColorGradeShadows", 45.f);
        renodx::utils::settings::UpdateSetting("ColorGradeContrast", 75.f);
        renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 60.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 78.f);
        renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
        //renodx::utils::settings::UpdateSetting("ToneMapConfiguration", 1.f);
      }
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
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Leave the in-game gamma slider at its default value of 50!",
      .section = "Instructions",
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Game mod by akuru, RenoDX Framework by ShortFuse. Special thanks to Voosh for their code!",
      .section = "About",
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
      .label = "More RenoDX mods",
      .section = "Links",
      .group = "button-line-1",
      .on_change = []() {
        renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx/wiki/Mods");
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
      .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
      .section = "About",
  },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapUINits", 203.f},
      {"ToneMapGammaCorrection", 0.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
  });
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  settings[2]->can_reset = true;
  if (peak.has_value()) {
    settings[2]->default_value = roundf(peak.value());
  } else {
    settings[2]->default_value = 1000.f;
  }

  //settings[3]->default_value = fmin(renodx::utils::swapchain::ComputeReferenceWhite(settings[2]->default_value), 203.f);

  fired_on_init_swapchain = true;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Shadow Gambit: The Cursed Crew";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      renodx::mods::swapchain::swapchain_proxy_revert_state = true;

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
