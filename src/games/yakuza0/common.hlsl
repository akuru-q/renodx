#include "./shared.h"

static float3 g_untonemapped;

void ProcessUntonemapped(inout float3 untonemapped) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return;

  untonemapped = renodx::color::srgb::DecodeSafe(untonemapped);

  g_untonemapped = untonemapped;

  untonemapped = renodx::tonemap::renodrt::NeutralSDR(untonemapped);

  untonemapped = renodx::color::srgb::EncodeSafe(untonemapped);
}

float3 InvRenoDRT(float3 color) {
  float y = renodx::color::y::from::BT709(color);
  float untonemapped_y = renodx::tonemap::inverse::Reinhard(y);
  float3 untonemapped = color * renodx::math::DivideSafe(untonemapped_y, y, 0);
  renodx::tonemap::renodrt::Config hdr_video_config = renodx::tonemap::renodrt::config::Create();

  float scaled_peak = max(min(RENODX_PEAK_WHITE_NITS / 2.f, 500.f), 300.f);

  float peak = scaled_peak / RENODX_DIFFUSE_WHITE_NITS;
  
  hdr_video_config.nits_peak = peak * 100.f;
  hdr_video_config.mid_gray_value = 0.18f;
  hdr_video_config.mid_gray_nits = 18.f;
  hdr_video_config.exposure = 1.0f;
  hdr_video_config.contrast = 1.0f;
  hdr_video_config.saturation = 1.1f;
  hdr_video_config.highlights = 1.0f;
  hdr_video_config.shadows = 1.0f;

  hdr_video_config.blowout = -0.01f;
  hdr_video_config.dechroma = 0;
  hdr_video_config.flare = 0;

  hdr_video_config.tone_map_method = renodx::tonemap::renodrt::config::tone_map_method::REINHARD;
  hdr_video_config.hue_correction_type = renodx::tonemap::renodrt::config::hue_correction_type::CUSTOM;
  hdr_video_config.hue_correction_source = color;
  hdr_video_config.per_channel = false;
  hdr_video_config.working_color_space = 2u;
  hdr_video_config.clamp_peak = 2u;
  hdr_video_config.clamp_color_space = -1.f;

  return renodx::tonemap::renodrt::BT709(untonemapped, hdr_video_config);
}

float3 ExponentialRollOffByLum(float3 color, float output_luminance_max, float highlights_shoulder_start = 0.f) {
  const float source_luminance = renodx::color::y::from::BT709(color);

  [branch]
  if (source_luminance > 0.0f) {
    const float compressed_luminance = renodx::tonemap::ExponentialRollOff(source_luminance, highlights_shoulder_start, output_luminance_max);
    color *= compressed_luminance / source_luminance;
  }

  return color;
}

float3 ApplyExponentialRollOff(float3 color) {
  const float paperWhite = RENODX_DIFFUSE_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;

  const float peakWhite = RENODX_PEAK_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;

  // const float highlightsShoulderStart = paperWhite;
  const float highlightsShoulderStart = 1.f;

  [branch]
  if (RENODX_TONE_MAP_PER_CHANNEL == 0.f) {
    return ExponentialRollOffByLum(color * paperWhite, peakWhite, highlightsShoulderStart) / paperWhite;
  } else {
    return renodx::tonemap::ExponentialRollOff(color * paperWhite, highlightsShoulderStart, peakWhite) / paperWhite;
  }
}

float4 ApplyToneMapScaling(float4 o0) {
  float3 color = renodx::color::srgb::DecodeSafe(o0.rgb);

  [branch]
  if (RENODX_TONE_MAP_TYPE == 6.f) {
    renodx::draw::Config draw_config = renodx::draw::BuildConfig();
    draw_config.peak_white_nits = 10000.f;
    draw_config.tone_map_type = 3.f;
    // draw_config.tone_map_hue_correction = 0.f;
    // draw_config.tone_map_hue_shift = 0.f;
    draw_config.tone_map_per_channel = 0.f;

    color = renodx::draw::ToneMapPass(g_untonemapped, color, draw_config);

    color = ApplyExponentialRollOff(color);
  } else if (RENODX_TONE_MAP_TYPE == 3.f) {
    color = renodx::draw::ToneMapPass(g_untonemapped, color);
  } else {
    color = saturate(color);
  }

  return float4(renodx::draw::RenderIntermediatePass(color), 1.f);
}
