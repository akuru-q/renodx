#ifndef SRC_SONICUNLEASHEDRECOMP_SHARED_H_
#define SRC_SONICUNLEASHEDRECOMP_SHARED_H_

#define RENODX_PEAK_WHITE_NITS               shader_injection.peak_white_nits
#define RENODX_GRAPHICS_WHITE_NITS           shader_injection.graphics_white_nits
#define RENODX_DIFFUSE_WHITE_NITS            RENODX_GRAPHICS_WHITE_NITS
#define RENODX_TONE_MAP_TYPE                 shader_injection.tone_map_type
#define RENODX_RENO_DRT_TONE_MAP_METHOD      renodx::tonemap::renodrt::config::tone_map_method::REINHARD
#define RENODX_RENO_DRT_WHITE_CLIP           16.f - (CUSTOM_TONE_MAP_SHOULDER_START * 16.f)
#define RENODX_TONE_MAP_EXPOSURE             shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS           shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS              shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST             shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION           shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT              shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                shader_injection.tone_map_flare
#define RENODX_TONE_MAP_HUE_CORRECTION       shader_injection.tone_map_hue_correction
#define RENODX_TONE_MAP_HUE_SHIFT            shader_injection.tone_map_hue_shift
#define RENODX_TONE_MAP_HUE_SHIFT_METHOD     HUE_SHIFT_METHOD_SDR_MODIFIED
#define RENODX_TONE_MAP_HUE_SHIFT_MODIFIER   0.5f
#define RENODX_TONE_MAP_WORKING_COLOR_SPACE  renodx::color::convert::COLOR_SPACE_BT709 //shader_injection.tone_map_working_color_space
#define RENODX_TONE_MAP_HUE_PROCESSOR        shader_injection.tone_map_hue_processor
#define RENODX_TONE_MAP_PER_CHANNEL          shader_injection.tone_map_per_channel
#define RENODX_GAMMA_CORRECTION              shader_injection.gamma_correction
//#define CUSTOM_TONE_MAP_CONFIGURATION        shader_injection.custom_tone_map_configuration
//#define CUSTOM_HDR_VIDEOS                    shader_injection.custom_hdr_videos
//#define CUSTOM_HDR_VIDEOS_PEAK_NITS          shader_injection.custom_hdr_videos_peak_nits
#define CUSTOM_TONE_MAP_SHOULDER_START       shader_injection.custom_tone_map_shoulder_start

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  //float diffuse_white_nits;
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
  float tone_map_hue_correction;
  float tone_map_hue_shift;
  float tone_map_working_color_space;
  float tone_map_hue_processor;
  float tone_map_per_channel;
  float gamma_correction;
  //float custom_hdr_videos;
  //float custom_hdr_videos_peak_nits;
  float custom_tone_map_shoulder_start;
};

#ifndef __cplusplus
cbuffer injectedBuffer : register(b13, space50) {
  ShaderInjectData shader_injection : packoffset(c0);
}

#include "../../shaders/renodx.hlsl"

#endif

#endif  // SRC_SONICUNLEASHEDRECOMP_SHARED_H_
