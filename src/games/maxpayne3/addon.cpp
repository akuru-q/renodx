/*
 * Copyright (C) 2024 Musa Haji
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64
#define NOMINMAX
#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>
#include <random>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/date.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0x57F6AAB4),  // Bloom

    // Tone Mapping
    CustomShaderEntry(0xA631D7F8),  // ToneMap - Main Menu
    CustomShaderEntry(0x10EE0B20),  // ToneMap - Primary in gameplay
    CustomShaderEntry(0x4F343009),  // ToneMap - Bullet Time Flash
    // done in batch
    CustomShaderEntry(0x01F5E795),
    CustomShaderEntry(0x03A86F66),
    CustomShaderEntry(0x0933B817),
    CustomShaderEntry(0x0C569FD2),
    CustomShaderEntry(0x0D3AF9C7),
    CustomShaderEntry(0x114F4F53),
    CustomShaderEntry(0x117628FE),
    CustomShaderEntry(0x14AEA21C),
    CustomShaderEntry(0x15B7734B),
    CustomShaderEntry(0x15E1CBDD),
    CustomShaderEntry(0x16CFDCB8),
    CustomShaderEntry(0x17A1A6D3),
    CustomShaderEntry(0x19F74577),
    CustomShaderEntry(0x1AC127A1),
    CustomShaderEntry(0x1E050193),
    CustomShaderEntry(0x1E2ADE00),
    CustomShaderEntry(0x1EA3AFF3),
    CustomShaderEntry(0x1FC015A1),
    CustomShaderEntry(0x23B18BD8),
    CustomShaderEntry(0x25E34175),
    CustomShaderEntry(0x2C22239B),
    CustomShaderEntry(0x2D1B343D),
    CustomShaderEntry(0x3037741F),
    CustomShaderEntry(0x32FA784C),
    CustomShaderEntry(0x3615A753),
    CustomShaderEntry(0x3C11574E),
    CustomShaderEntry(0x3E1C4800),
    CustomShaderEntry(0x4E20C085),
    CustomShaderEntry(0x5164E9B0),
    CustomShaderEntry(0x51E829A0),
    CustomShaderEntry(0x5591404A),
    CustomShaderEntry(0x572E9E14),
    CustomShaderEntry(0x57D8BE2F),
    CustomShaderEntry(0x59F2397F),
    CustomShaderEntry(0x5A714D9A),
    CustomShaderEntry(0x5BDCF58B),
    CustomShaderEntry(0x5D6CE5AA),
    CustomShaderEntry(0x5DC18676),
    CustomShaderEntry(0x5F7F2CF0),
    CustomShaderEntry(0x5FEA60BA),
    CustomShaderEntry(0x62FBFD42),
    CustomShaderEntry(0x6577C52F),
    CustomShaderEntry(0x669480A7),
    CustomShaderEntry(0x69865D5B),
    CustomShaderEntry(0x69A7604F),
    CustomShaderEntry(0x6DCED770),
    CustomShaderEntry(0x6F56C009),
    CustomShaderEntry(0x76CE7813),
    CustomShaderEntry(0x7A442117),
    CustomShaderEntry(0x7CB0B3AA),
    CustomShaderEntry(0x7FAFDA2A),
    CustomShaderEntry(0x80A70632),
    CustomShaderEntry(0x88668588),
    CustomShaderEntry(0x8DE915B0),
    CustomShaderEntry(0x8EE688FF),
    CustomShaderEntry(0x90A1640C),
    CustomShaderEntry(0x96C78726),
    CustomShaderEntry(0x982D2E83),
    CustomShaderEntry(0x985D8946),
    CustomShaderEntry(0x988E0440),
    CustomShaderEntry(0x9A761B73),
    CustomShaderEntry(0x9ADA439F),
    CustomShaderEntry(0x9D18D405),
    CustomShaderEntry(0x9F31A4DD),
    CustomShaderEntry(0xA20B8702),
    CustomShaderEntry(0xA237779F),
    CustomShaderEntry(0xA5CFC1D9),
    CustomShaderEntry(0xB133932C),
    CustomShaderEntry(0xB1A5D3BC),
    CustomShaderEntry(0xB2AB7C39),
    CustomShaderEntry(0xB3E0329B),
    CustomShaderEntry(0xB481AC95),
    CustomShaderEntry(0xB802E7CF),
    CustomShaderEntry(0xC016166E),
    CustomShaderEntry(0xC0603F3A),
    CustomShaderEntry(0xC1CD0E29),
    CustomShaderEntry(0xC35017A0),
    CustomShaderEntry(0xC51143A4),
    CustomShaderEntry(0xC92236C8),
    CustomShaderEntry(0xCCD10E2A),
    CustomShaderEntry(0xCD48C081),
    CustomShaderEntry(0xCD5272DD),
    CustomShaderEntry(0xD20F4621),
    CustomShaderEntry(0xD29EAC60),
    CustomShaderEntry(0xD5EC60BF),
    CustomShaderEntry(0xD7538577),
    CustomShaderEntry(0xDB7B34F8),
    CustomShaderEntry(0xDCCD53B8),
    CustomShaderEntry(0xE36C9160),
    CustomShaderEntry(0xE4322A68),
    CustomShaderEntry(0xE5A49BBB),
    CustomShaderEntry(0xE9E20657),
    CustomShaderEntry(0xEA3CC1E3),
    CustomShaderEntry(0xEA3F39A4),
    CustomShaderEntry(0xECCE1541),
    CustomShaderEntry(0xF20EF8A7),
    CustomShaderEntry(0xF225B2E1),
    CustomShaderEntry(0xF803A073),
    CustomShaderEntry(0xF895DAFE),
    CustomShaderEntry(0xFC2389A4),
    CustomShaderEntry(0xFE7B20B4),
    CustomShaderEntry(0xFF318C23),

    // Anti-Aliasing
    CustomShaderEntry(0x3FA8CBC3),  // FXAA - High
    CustomShaderEntry(0xFBC327C8),  // FXAA - Very High

    // Drawn directly onto swapchain
    CustomShaderEntry(0xCB1874B7),  // PostFX
    CustomShaderEntry(0xB7822C98),  // PostFX - MSAA 4x
    CustomShaderEntry(0xCC0D7856),  // PostFX - MSAA 8x
    CustomShaderEntry(0xC3EDCD63),  // PostFX - Scanlines - MSAA Off
    CustomShaderEntry(0x5770A95E),  // PostFX - Scanlines - MSAA 2x
    CustomShaderEntry(0x30842A90),  // PostFX - Scanlines - MSAA 4x
    CustomShaderEntry(0x1F296E17),  // PostFX - Scanlines - MSAA 8x
    CustomShaderEntry(0x17ECFF74),  // PostFX
    CustomShaderEntry(0xD3F808EC),  // PostFX

    CustomShaderEntry(0x32629E1B),  // FMV

    // CustomShaderEntry(0x6E78E24F),  // UI - Alpha
    // CustomShaderEntry(0x671C1B51),  // UI - Text

};

ShaderInjectData shader_injection;

float current_settings_mode = 0;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
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
        .default_value = 3.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "None", "Exponential Rolloff", "Frostbite"},
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &RENODX_PEAK_WHITE_NITS,
        .default_value = 1000.f,
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
    new renodx::utils::settings::Setting{
        .key = "GammaCorrection",
        .binding = &RENODX_GAMMA_CORRECTION,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a display EOTF.",
        .labels = {"Off", "2.2", "BT.1886"},
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueCorrection",
        .binding = &RENODX_TONE_MAP_HUE_CORRECTION,
        .default_value = 60.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Hue retention strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 2; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &RENODX_TONE_MAP_EXPOSURE,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &RENODX_TONE_MAP_HIGHLIGHTS,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &RENODX_TONE_MAP_SHADOWS,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &RENODX_TONE_MAP_CONTRAST,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE == 3; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &RENODX_TONE_MAP_BLOWOUT,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1; },
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
        .key = "FxFilmGrain",
        .binding = &CUSTOM_FILM_GRAIN_STRENGTH,
        .default_value = 0.f,
        .label = "Film Grain",
        .section = "Effects",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Options",
        .group = "button-line-0",
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
        .label = "HDR Look",
        .section = "Options",
        .group = "button-line-0",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            if (setting->key == "ColorGradeContrast") {
              renodx::utils::settings::UpdateSetting(setting->key, 55.f);
            } else if (setting->key == "ColorGradeHighlightSaturation") {
              renodx::utils::settings::UpdateSetting(setting->key, 75.f);
            } else if (setting->key == "FxFilmGrain") {
              renodx::utils::settings::UpdateSetting(setting->key, 50.f);
            } else {
              renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
            }
          }
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
          renodx::utils::platform::LaunchURL("https://github.com/", "clshortfuse/renodx");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Musa's Ko-Fi",
        .section = "Links",
        .group = "button-line-1",
        .tint = 0xFF5A16,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://ko-fi.com/", "musaqh");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
        .section = "About",
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("GammaCorrection", 0);
  renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 0);
  renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 50.f);
  renodx::utils::settings::UpdateSetting("FxBloom", 100.f);
  renodx::utils::settings::UpdateSetting("FxFilmGrain", 0.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  auto white_level = 203.f;
  if (!peak.has_value()) {
    peak = 1000.f;
  }
  settings[2]->default_value = peak.value();  // Peak Nits

  float computed_diffuse = std::clamp(roundf(powf(10.f, 0.03460730900256f + (0.757737096673107f * log10f(peak.value())))), 100.f, 203.f);
  settings[3]->default_value = computed_diffuse;  // Game Nits
  settings[4]->default_value = computed_diffuse;  // UI Nits
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
  static std::mt19937 random_generator(std::chrono::system_clock::now().time_since_epoch().count());
  static auto random_range = static_cast<float>(std::mt19937::max() - std::mt19937::min());
  CUSTOM_RANDOM = static_cast<float>(random_generator() + std::mt19937::min()) / random_range;
}

bool initialized = false;

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Max Payne 3";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      if (!initialized) {
        renodx::mods::shader::force_pipeline_cloning = true;
        renodx::mods::shader::expected_constant_buffer_index = 13;

        renodx::mods::swapchain::expected_constant_buffer_index = 13;
        renodx::mods::swapchain::use_resource_cloning = true;
        renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader_dx11;
        renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader_dx11;
        renodx::mods::swapchain::swapchain_proxy_revert_state = true;
        initialized = true;
      }

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
      });

      // Artifacts in some shadows with r8g8b8a8_typeless upgrades
      // renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //     .old_format = reshade::api::format::r8g8b8a8_typeless,
      //     .new_format = reshade::api::format::r16g16b16a16_float,
      //     .index = 6,  // Results in artifacts otherwise
      // });

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r11g11b10_float,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,  // Results in black screen otherwise
      });

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);  // Peak nits / diffuse white
      reshade::register_event<reshade::addon_event::present>(OnPresent);               // Grain

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);  // Peak nits / diffuse white
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);               // Grain
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
