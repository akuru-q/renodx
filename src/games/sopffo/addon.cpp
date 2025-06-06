/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {                                   

bool hdr_enabled = false;

#define ShaderOnDrawCallback(__crc32__, callback)               {__crc32__, {.crc32 = __crc32__, .on_draw = callback}}

// DX11 Only
#define UpgradeRTVReplaceShader(value)       \
  {                                          \
      value,                                 \
      {                                      \
          .crc32 = value,                    \
          .code = __##value,                 \
          .on_draw = [](auto* cmd_list) {                                                             \
            auto rtvs = renodx::utils::swapchain::GetRenderTargets(cmd_list);                         \
            bool changed = false;                                                                     \
            for (auto rtv : rtvs) {                                                                   \
              changed = renodx::mods::swapchain::ActivateCloneHotSwap(cmd_list->get_device(), rtv);   \
            }                                                                                         \
            if (changed) {                                                                            \
              renodx::mods::swapchain::FlushDescriptors(cmd_list);                                    \
              renodx::mods::swapchain::RewriteRenderTargets(cmd_list, rtvs.size(), rtvs.data(), {0}); \
            }                                                                                         \
            return true; }, \
      },                                     \
  }

#define UpgradeRTVShader(value)              \
  {                                          \
      value,                                 \
      {                                      \
          .crc32 = value,                    \
          .on_draw = [](auto* cmd_list) {                                                           \
            auto rtvs = renodx::utils::swapchain::GetRenderTargets(cmd_list);                       \
            bool changed = false;                                                                   \
            for (auto rtv : rtvs) {                                                                 \
              changed = renodx::mods::swapchain::ActivateCloneHotSwap(cmd_list->get_device(), rtv); \
            }                                                                                       \
            if (changed) {                                                                          \
              renodx::mods::swapchain::FlushDescriptors(cmd_list);                                  \
              renodx::mods::swapchain::RewriteRenderTargets(cmd_list, rtvs.size(), rtvs.data(), {0});      \
            }                                                                                       \
            return true; }, \
      },                                     \
  }


renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0x88EB22C4), // lutsample, beginning fight, tutorial
    CustomShaderEntry(0xDE0167BA), // lutsample, dramatic lut
    CustomShaderEntry(0xAEE14B47), // sdr output
    ShaderOnDrawCallback(0x1C876972, [](reshade::api::command_list* cmd_list) {
        hdr_enabled = true; // HDR output shader
        return false; // skip draw (black screen with scRGB reno swapchain otherwise)
    }),
    //ShaderOnDrawCallback(0xAEE14B47, [](reshade::api::command_list* cmd_list) {
    //    hdr_enabled = false; // SDR output shader
    //    return false; // skip draw (black screen with scRGB reno swapchain otherwise)
    //}),
    BypassShaderEntry(0x654F1275), // weird shader
};

ShaderInjectData shader_injection;

const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

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
        .labels = {"Vanilla", "RenoDRT"},
        .parse = [](float value) { return value * 3.f; },
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
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueProcessor",
        .binding = &RENODX_TONE_MAP_HUE_PROCESSOR,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Hue Processor",
        .section = "Tone Mapping",
        .tooltip = "Selects hue processor",
        .labels = {"OKLab", "ICtCp"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    //new renodx::utils::settings::Setting{
    //    .key = "ToneMapHueShift",
    //    .binding = &RENODX_TONE_MAP_HUE_SHIFT,
    //    .default_value = 0.f,
    //    .label = "Hue Shift",
    //    .section = "Tone Mapping",
    //    .tooltip = "Hue-shift emulation strength.",
    //    .min = 0.f,
    //    .max = 100.f,
    //    .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
    //    .parse = [](float value) { return value * 0.01f; },
    //    .is_visible = []() { return settings[0]->GetValue() >= 1; },
    //},
    new renodx::utils::settings::Setting{
        .key = "ToneMapWorkingColorSpace",
        .binding = &RENODX_TONE_MAP_WORKING_COLOR_SPACE,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Working Color Space",
        .section = "Tone Mapping",
        .labels = {"BT709", "BT2020", "AP1"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    },
    //new renodx::utils::settings::Setting{
    //    .key = "ToneMapHueCorrection",
    //    .binding = &RENODX_TONE_MAP_HUE_CORRECTION,
    //    .default_value = 0.f,
    //    .label = "Hue Correction",
    //    .section = "Tone Mapping",
    //    .tooltip = "Hue retention strength.",
    //    .min = 0.f,
    //    .max = 100.f,
    //    .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
    //    .parse = [](float value) { return value * 0.01f; },
    //    .is_visible = []() { return settings[0]->GetValue() >= 2; },
    //},
    new renodx::utils::settings::Setting{
        .key = "GammaCorrection",
        .binding = &RENODX_GAMMA_CORRECTION,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a display EOTF.",
        .labels = {"Off", "2.2", "BT.1886"},
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapScaling",
        .binding = &RENODX_TONE_MAP_PER_CHANNEL,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Scaling",
        .section = "Tone Mapping",
        .tooltip = "Luminance scales colors consistently while per-channel saturates and blows out sooner",
        .labels = {"Luminance", "Per Channel"},
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
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
        .default_value = 50.f,
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
        .is_enabled = []() { return RENODX_TONE_MAP_TYPE >= 1; },
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
    //new renodx::utils::settings::Setting{
    //    .key = "FxHDRVideos",
    //    .binding = &CUSTOM_HDR_VIDEOS,
    //    .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //    .default_value = 1.f,
    //    .label = "HDR Videos",
    //    .section = "Effects",
    //    .labels = {"Off", "On"},
    //},
    //new renodx::utils::settings::Setting{
    //    .key = "FxHDRVideosPeakNits",
    //    .binding = &CUSTOM_HDR_VIDEOS_PEAK_NITS,
    //    .default_value = 400.f,
    //    .label = "HDR Videos Peak Brightness",
    //    .section = "Effects",
    //    .tooltip = "Sets the value of peak white for HDR Videos in nits",
    //    .min = 48.f,
    //    .max = 1000.f,
    //    .is_enabled = []() { return CUSTOM_HDR_VIDEOS != 0; }
    //},
    //new renodx::utils::settings::Setting{
    //    .key = "FxBloom",
    //    .binding = &CUSTOM_BLOOM,
    //    .default_value = 50.f,
    //    .label = "Bloom",
    //    .section = "Effects",
    //    .max = 100.f,
    //    .parse = [](float value) { return value * 0.02f; },
    //},
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Look",
        .section = "Presets",
        .group = "button-line-1",
        .tint = 0xb5b2b1,
        .on_change = []() {
            renodx::utils::settings::UpdateSetting("ToneMapType", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 0.f);
            renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
            renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
            renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeShadows", 63.f);
            renodx::utils::settings::UpdateSetting("ColorGradeContrast", 60.f);
            renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 50.f);
            renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 60.f);
            renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 0.f);
            renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
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
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "HDR Look",
    //     .section = "Options",
    //     .group = "button-line-1",
    //     .on_change = []() {
    //       for (auto setting : settings) {
    //         if (setting->key.empty()) continue;
    //         if (!setting->can_reset) continue;
    //         if (setting->key == "ColorGradeSaturation" || setting->key == "ColorGradeContrast" || setting->key == "ColorGradeBlowout") {
    //           renodx::utils::settings::UpdateSetting(setting->key, 80.f);
    //         } else {
    //           renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
    //         }
    //       }
    //     },
    // },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "In-game HDR has to be turned OFF!",
        .section = "Instructions",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Game mod by akuru, RenoDX Framework by ShortFuse",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Den Discord",
        .section = "About",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch(("https://discord.gg/XUhv") + std::string("tR54yc"));
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Get more RenoDX mods!",
        .section = "About",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::Launch("https://github.com/clshortfuse/renodx/wiki/Mods");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "ShortFuse's Ko-Fi",
        .section = "About",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::Launch("https://ko-fi.com/shortfuse");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Den's Ko-Fi",
        .section = "About",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          renodx::utils::platform::Launch("https://ko-fi.com/hdrden");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This build was compiled on " + build_date + " at " + build_time + ".",
        .section = "About",
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("ToneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("ToneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("ToneMapUINits", 203.f);
  // renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
  // renodx::utils::settings::UpdateSetting("ToneMapHueShift", 1.f);
  // renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 1.f);
  // renodx::utils::settings::UpdateSetting("ToneMapHueCorrection", 1.f);
  renodx::utils::settings::UpdateSetting("GammaCorrection", 0.f);
  // renodx::utils::settings::UpdateSetting("ToneMapScaling", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeShadows", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeContrast", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 1.f);
  // renodx::utils::settings::UpdateSetting("ColorGradeFlare", 1.f);
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[2]->default_value = peak.value();
    settings[2]->can_reset = true;
  }
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX - Stranger of Paradise: Final Fantasy Origin";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      //renodx::mods::shader::on_init_pipeline_layout = [](reshade::api::device* device, auto, auto) {
      //  return device->get_api() == reshade::api::device_api::d3d12;
      //};

      //renodx::mods::swapchain::SetUseHDR10(true);

      renodx::mods::swapchain::force_borderless = false;     // needed for stability
      renodx::mods::swapchain::prevent_full_screen = false;  // needed for stability

      //renodx::mods::shader::expected_constant_buffer_space = 50;
      //renodx::mods::shader::expected_constant_buffer_index = 13;
      //renodx::mods::shader::allow_multiple_push_constants = true;
      //renodx::mods::shader::force_pipeline_cloning = true;

      //renodx::mods::swapchain::expected_constant_buffer_index = 13;
      //renodx::mods::swapchain::expected_constant_buffer_space = 50;

      //renodx::mods::swapchain::use_resource_cloning = true; 
      //renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      //renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      //renodx::mods::swapchain::swapchain_proxy_revert_state = true;

      // RG11B10_float
      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //  .old_format = reshade::api::format::r11g11b10_float,
      //  .new_format = reshade::api::format::r32g32b32a32_float,
      //  //.ignore_size = true,
      //  .use_resource_view_cloning = true,
      //  //.use_resource_view_hot_swap = true,
      //  .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //  .view_upgrades = {
      //    {{reshade::api::resource_usage::shader_resource,
      //    reshade::api::format::r11g11b10_float},
      //    reshade::api::format::r32g32b32a32_float},
      //    {{reshade::api::resource_usage::unordered_access,
      //    reshade::api::format::r11g11b10_float},
      //    reshade::api::format::r32g32b32a32_float},
      //    {{reshade::api::resource_usage::render_target,
      //    reshade::api::format::r11g11b10_float},
      //    reshade::api::format::r32g32b32a32_float},
      //  }});

      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::r11g11b10_float,
      //    .new_format = reshade::api::format::r16g16b16a16_float,
      //    .use_resource_view_cloning = true,
      //    .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //    //.usage_include = reshade::api::resource_usage::render_target
      //    //                 | reshade::api::resource_usage::copy_dest,
      //});

      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::r11g11b10_float,
      //    .new_format = reshade::api::format::r16g16b16a16_float,
      //    .dimensions = {1920,1080},
      //    //.use_resource_view_cloning = true,
      //    //.aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //    //.usage_include = reshade::api::resource_usage::render_target
      //    //                 | reshade::api::resource_usage::copy_dest,
      //});

      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::r10g10b10a2_unorm,
      //    .new_format = reshade::api::format::r16g16b16a16_float,
      //    //.use_resource_view_cloning = true,
      //    .use_resource_view_cloning = true,
      //    .use_resource_view_hot_swap = true,
      //    //.aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //    //.usage_include = reshade::api::resource_usage::render_target
      //    //                 | reshade::api::resource_usage::copy_dest,
      //});

      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::r11g11b10_float,
      //    .new_format = reshade::api::format::r32g32b32a32_float,
      //    .use_resource_view_cloning = true,
      //    //.use_resource_view_hot_swap = true,
      //    .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //    //.usage_include = reshade::api::resource_usage::render_target
      //    //                 | reshade::api::resource_usage::copy_dest,
      //});

      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::r16g16b16a16_typeless,
      //    .new_format = reshade::api::format::r16g16b16a16_float,
      //    .ignore_size = true,
      //    .use_resource_view_cloning = true,
      //    //.aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //    //.usage_include = reshade::api::resource_usage::render_target
      //    //                 | reshade::api::resource_usage::copy_dest,
      //});
//
      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::r16g16b16a16_unorm,
      //    .new_format = reshade::api::format::r16g16b16a16_float,
      //    .ignore_size = true,
      //    .use_resource_view_cloning = true,
      //    //.aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      //});

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r16g16b16a16_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });

      // output sdr shader
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm_srgb,
          .new_format = reshade::api::format::r16g16b16a16_float,
          //.use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });

      // output sdr shader
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          //.use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

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