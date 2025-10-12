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

ShaderInjectData shader_injection;

bool AddToCgCount(reshade::api::command_list* cmd_list) {
  shader_injection.custom_cg_count += 1.f;
  return true;
}

renodx::mods::shader::CustomShaders custom_shaders = {
  CustomShaderEntry(0x27B872F2), // final
  CustomShaderEntry(0x6370B56D), // movie

  // cg permutations
  CustomShaderEntryCallback(0x058BF000, &AddToCgCount),
  CustomShaderEntryCallback(0x05B43BDB, &AddToCgCount),
  CustomShaderEntryCallback(0x0C595E87, &AddToCgCount),
  CustomShaderEntryCallback(0x0D3202D5, &AddToCgCount),
  CustomShaderEntryCallback(0x1C1CAB76, &AddToCgCount),
  CustomShaderEntryCallback(0x38FD9EBD, &AddToCgCount),
  CustomShaderEntryCallback(0x42D32094, &AddToCgCount),
  CustomShaderEntryCallback(0x43863885, &AddToCgCount),
  CustomShaderEntryCallback(0x48B3F6AE, &AddToCgCount),
  CustomShaderEntryCallback(0x4A134172, &AddToCgCount),
  CustomShaderEntryCallback(0x4BBB3C60, &AddToCgCount),
  CustomShaderEntryCallback(0x4CB0D887, &AddToCgCount),
  CustomShaderEntryCallback(0x4E764ED8, &AddToCgCount),			
  CustomShaderEntryCallback(0x527D626B, &AddToCgCount),
  CustomShaderEntryCallback(0x55FDC030, &AddToCgCount),
  CustomShaderEntryCallback(0x5AC3F7CD, &AddToCgCount),
  CustomShaderEntryCallback(0x5EE2913B, &AddToCgCount),
  CustomShaderEntryCallback(0x613EADB8, &AddToCgCount),
  CustomShaderEntryCallback(0x64FFC5C7, &AddToCgCount),
  CustomShaderEntryCallback(0x6BE6F0AC, &AddToCgCount),
  CustomShaderEntryCallback(0x6D4B8F91, &AddToCgCount),
  CustomShaderEntryCallback(0x7D90228C, &AddToCgCount),
  CustomShaderEntryCallback(0x81F6BDCB, &AddToCgCount),
  CustomShaderEntryCallback(0x8B3613BE, &AddToCgCount),
  CustomShaderEntryCallback(0x9B9DE740, &AddToCgCount),
  CustomShaderEntryCallback(0x9D6EF05E, &AddToCgCount),
  CustomShaderEntryCallback(0x9F274920, &AddToCgCount),
  CustomShaderEntryCallback(0xA540C9FD, &AddToCgCount),
  CustomShaderEntryCallback(0xB182D89E, &AddToCgCount),
  CustomShaderEntryCallback(0xB6AFEDAA, &AddToCgCount),
  CustomShaderEntryCallback(0xC416F8B5, &AddToCgCount),
  CustomShaderEntryCallback(0xCF7D978E, &AddToCgCount),
  CustomShaderEntryCallback(0xD0DB8FFB, &AddToCgCount),
  CustomShaderEntryCallback(0xD1E67953, &AddToCgCount),
  CustomShaderEntryCallback(0xD3D23323, &AddToCgCount),
  CustomShaderEntryCallback(0xEA23BEA5, &AddToCgCount),
  CustomShaderEntryCallback(0xEAFA598D, &AddToCgCount),
  CustomShaderEntryCallback(0xED23E647, &AddToCgCount),
  CustomShaderEntryCallback(0xF22A8AF9, &AddToCgCount),
  CustomShaderEntryCallback(0xF4418B04, &AddToCgCount),
  CustomShaderEntryCallback(0xF6463657, &AddToCgCount),
  CustomShaderEntryCallback(0xFA1FD927, &AddToCgCount),
  CustomShaderEntryCallback(0xFD1A82FE, &AddToCgCount),
};

renodx::utils::settings::Settings settings = renodx::templates::settings::JoinSettings(
{renodx::templates::settings::CreateDefaultSettings({
  {"ToneMapType", {.binding = &shader_injection.tone_map_type, .default_value = 2.f, .labels = {"Vanilla", "RenoDRT", "Exponential Rolloff"}}},
  {"ToneMapPeakNits",  {.binding = &shader_injection.peak_white_nits}},
  {"ToneMapGameNits",  {.binding = &shader_injection.diffuse_white_nits}},
  {"ToneMapUINits", {.binding =  &shader_injection.graphics_white_nits}},
  {"ToneMapGammaCorrection", {.binding =  &shader_injection.gamma_correction}},
  {"ToneMapHueCorrection", {.binding =  &shader_injection.tone_map_hue_correction}},
  {"ToneMapHueShift", {.binding =  &shader_injection.tone_map_hue_shift}},
  {"ToneMapScaling", {.binding =  &shader_injection.tone_map_per_channel}}, 
  {"ColorGradeExposure",  {.binding = &shader_injection.tone_map_exposure}},
  {"ColorGradeHighlights",  {.binding = &shader_injection.tone_map_highlights}},
  {"ColorGradeShadows",  {.binding = &shader_injection.tone_map_shadows}},
  {"ColorGradeContrast",  {.binding = &shader_injection.tone_map_contrast}},
  {"ColorGradeSaturation",  {.binding = &shader_injection.tone_map_saturation}},
  {"ColorGradeHighlightSaturation", {.binding =  &shader_injection.tone_map_highlight_saturation}},
  {"ColorGradeBlowout", {.binding =  &shader_injection.tone_map_blowout}},
  {"ColorGradeFlare",  {.binding = &shader_injection.tone_map_flare}},
}),
{
  new renodx::utils::settings::Setting{
      .key = "FxHDRVideos",
      .binding = &shader_injection.custom_hdr_videos,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 1.f,
      .label = "HDR Videos",
      .section = "Effects",
      .labels = {"Off", "On"},
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "HDR Look",
      .section = "Presets",
      .group = "button-line-1",
      .tint = 0xb5b2b1,
      .on_change = []() {
        renodx::utils::settings::UpdateSetting("ToneMapType", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
        renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
        renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 55.f);
        renodx::utils::settings::UpdateSetting("ColorGradeShadows", 57.f);
        renodx::utils::settings::UpdateSetting("ColorGradeContrast", 60.f);
        renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 60.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 50.f);
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
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Game mod by akuru, RenoDX Framework by ShortFuse",
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
      .label = "More RenoDX mods",
      .section = "Links",
      .group = "button-line-1",
      .on_change = []() {
        renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx/wiki/Mods");
      },
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

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
  shader_injection.custom_cg_count = 0.f;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Yakuza 0";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      renodx::mods::shader::expected_constant_buffer_index = 11;
      renodx::mods::swapchain::expected_constant_buffer_index = 11;

      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      //renodx::mods::swapchain::swapchain_proxy_revert_state = true;

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float, 
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });
      
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });

      reshade::register_event<reshade::addon_event::present>(OnPresent);
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}