#include "./shared.h"

static float3 g_untonemapped;
static float3 g_tm_skipped;

float3 ApplyPerChannelBlowoutHueShift(float3 untonemapped) {
  if (RENODX_TONE_MAP_TYPE != 0 && RENODX_TONE_MAP_HUE_SHIFT > 0.f) {
    float calculated_peak = (0.01f * pow(100.f - (RENODX_TONE_MAP_HUE_SHIFT * 100.f), 2.f));

    //float3 graded_color = renodx::tonemap::HermiteSplinePerChannelRolloff(untonemapped, calculated_peak, 100.f);
    float3 graded_color = renodx::tonemap::ExponentialRollOff(untonemapped, 0.f,  calculated_peak);
    float3 color = renodx::color::correct::Chrominance(untonemapped, graded_color, 1.f, 0.f, 1u);
    color = renodx::color::correct::Hue(color, graded_color, RENODX_TONE_MAP_HUE_CORRECTION, 0u);
    return color;
  }
  return untonemapped;
}

float3 YakuzaTonemap(float3 color) {
  float3 color2, color3 = 0.f;

  color3 = color + color;
  color2 = color * float3(0.300000012, 0.300000012, 0.300000012) + float3(0.0500000007, 0.0500000007, 0.0500000007);
  color2 = color3 * color2 + float3(0.00400000019, 0.00400000019, 0.00400000019);
  color = color * float3(0.300000012, 0.300000012, 0.300000012) + float3(0.5, 0.5, 0.5);
  color = color3 * color + float3(0.0599999987, 0.0599999987, 0.0599999987);
  color = color2 / color;
  color = float3(-0.0666666701, -0.0666666701, -0.0666666701) + color;
  return saturate(float3(1.37906432, 1.37906432, 1.37906432) * color);
}

void MarkerFunction1(inout float3 color1, float cb_val1) {
  [branch] if (RENODX_TONE_MAP_TYPE == 0.f) return;

  g_tm_skipped = color1;

  float midgray_val = 0.18f;
  float3 midgray = float3(midgray_val, midgray_val, midgray_val);
  midgray = YakuzaTonemap(midgray);

  g_tm_skipped *= midgray / midgray_val;

  return;
}

void MarkerFunction2(inout float3 color) {
  [branch] if (RENODX_TONE_MAP_TYPE == 0.f) return;

  color = g_tm_skipped;

  return;
}

void TonemapSDR(inout float4 color) {
  [branch] if (RENODX_TONE_MAP_TYPE == 0.f) return;

  color = renodx::color::srgb::DecodeSafe(color);

  color.rgb = renodx::tonemap::renodrt::NeutralSDR(color.rgb);
  color.a = renodx::tonemap::ExponentialRollOff(color.a, 0, 1);

  color = renodx::color::srgb::EncodeSafe(color);

  return;
}

void TonemapSDR(inout float3 color) {
  [branch] if (RENODX_TONE_MAP_TYPE == 0.f) return;

  color = renodx::color::srgb::DecodeSafe(color);

  color.rgb = renodx::tonemap::renodrt::NeutralSDR(color.rgb);

  color = renodx::color::srgb::EncodeSafe(color);

  return;
}

void ScaleBloom(inout float4 color) {
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    color.rgb *= CUSTOM_BLOOM;
  }
}

void ProcessUntonemapped(inout float3 untonemapped) {
  [branch] if (RENODX_TONE_MAP_TYPE == 0.f) return;

  [branch]
  if (CUSTOM_CG_COUNT <= 1.f) {
    untonemapped = renodx::color::srgb::DecodeSafe(untonemapped);
  } else {
    untonemapped = renodx::draw::InvertIntermediatePass(untonemapped);
  }

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

float3 ApplyRenoTonemap(float3 color) {
  [branch]
  if (RENODX_TONE_MAP_TYPE == 6.f) {
    renodx::draw::Config draw_config = renodx::draw::BuildConfig();
    draw_config.peak_white_nits = 10000.f;
    draw_config.tone_map_type = 3.f;
    draw_config.tone_map_hue_correction = 0.f;
    draw_config.tone_map_hue_shift = 0.f;
    draw_config.tone_map_per_channel = 0.f;

    color = renodx::draw::ToneMapPass(g_untonemapped, color, draw_config);
    color = ApplyExponentialRollOff(color);
    color = ApplyPerChannelBlowoutHueShift(color);
  } else if (RENODX_TONE_MAP_TYPE == 3.f) {
    renodx::draw::Config draw_config = renodx::draw::BuildConfig();
    draw_config.tone_map_hue_correction = 0.f;
    draw_config.tone_map_hue_shift = 0.f;

    color = renodx::draw::ToneMapPass(g_untonemapped, color, draw_config);
    color = ApplyPerChannelBlowoutHueShift(color);
  } else {
    color = saturate(color);
  }
  return color;
}

float4 ApplyToneMapScaling(float4 o0) {
  float3 color = renodx::color::srgb::DecodeSafe(o0.rgb);

  [branch]
  if (CUSTOM_CG_COUNT > 1.f) {
    color = renodx::tonemap::UpgradeToneMap(g_untonemapped, renodx::tonemap::renodrt::NeutralSDR(g_untonemapped), color, 1.f);

    return float4(renodx::draw::RenderIntermediatePass(color), 1.f);
  }

  color = ApplyRenoTonemap(color);

  return float4(renodx::draw::RenderIntermediatePass(color), 1.f);
}

// Only applies tonemapping if no color grading shader is present (eg karaoke)
float3 ApplyToneMapScalingPreFxaa(float3 color) {
  [branch]
  if (CUSTOM_CG_COUNT == 0.f) {
    color = renodx::color::srgb::DecodeSafe(color);

    color = ApplyRenoTonemap(color);

    return renodx::draw::RenderIntermediatePass(color);
  }

  return color;
}