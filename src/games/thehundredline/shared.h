#ifndef SRC_THE_HUNDRED_LINE_SHARED_H_
#define SRC_THE_HUNDRED_LINE_SHARED_H_

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_blowout;
  float tone_map_flare;
  float custom_video_has_drawn;
  float custom_ui_has_drawn;
  float custom_lower_white;
};

#ifndef __cplusplus
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer shader_injection : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer shader_injection : register(b13) {
#endif
  ShaderInjectData shader_injection : packoffset(c0);
}

#define RENODX_TONE_MAP_TYPE                 shader_injection.tone_map_type
#define RENODX_PEAK_WHITE_NITS               shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS            shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS           shader_injection.graphics_white_nits
#define RENODX_TONE_MAP_EXPOSURE             shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS           shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS              shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST             shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION           shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT              shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                shader_injection.tone_map_flare
#define RENODX_TONE_MAP_HUE_SHIFT            0.9f
#define RENODX_GAMMA_CORRECTION              GAMMA_CORRECTION_NONE
#define RENODX_INTERMEDIATE_ENCODING         GAMMA_CORRECTION_GAMMA_2_2
#define RENODX_SWAP_CHAIN_GAMMA_CORRECTION   GAMMA_CORRECTION_GAMMA_2_2
#define RENODX_RENO_DRT_TONE_MAP_METHOD      renodx::tonemap::renodrt::config::tone_map_method::REINHARD
#define CUSTOM_VIDEO_HAS_DRAWN               shader_injection.custom_video_has_drawn
#define CUSTOM_UI_HAS_DRAWN                  shader_injection.custom_ui_has_drawn
#define CUSTOM_LOWER_WHITE_UI                shader_injection.custom_lower_white

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_THE_HUNDRED_LINE_SHARED_H_