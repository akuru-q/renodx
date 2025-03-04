#include "./shared.h"
#include "./DICE.hlsl"

float3 applyRenoDice(float3 color) {
  const float paperWhite = RENODX_DIFFUSE_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;
  const float peakWhite = RENODX_PEAK_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;
  const float highlightsShoulderStart = paperWhite;  // Don't tonemap the "SDR" range (in luminance), we want to keep it looking as it used to look in SDR
  return renodx::tonemap::dice::BT709(color.rgb * paperWhite, peakWhite, highlightsShoulderStart) / paperWhite;
}

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  float4 SV_Target = t0.Sample(s0, uv);

  if (RENODX_TONE_MAP_TYPE == 3.f) {
    SV_Target.rgb = renodx::draw::ToneMapPass(SV_Target.rgb);
  } else if (RENODX_TONE_MAP_TYPE == 6.f) {
    renodx::tonemap::Config config = renodx::tonemap::config::Create();
    config.exposure = RENODX_TONE_MAP_EXPOSURE;
    config.highlights = RENODX_TONE_MAP_HIGHLIGHTS;
    config.shadows = RENODX_TONE_MAP_SHADOWS;
    config.contrast = RENODX_TONE_MAP_CONTRAST;
    config.saturation = RENODX_TONE_MAP_SATURATION;
    config.reno_drt_dechroma = RENODX_TONE_MAP_BLOWOUT;
    config.hue_correction_strength = RENODX_TONE_MAP_HUE_CORRECTION;

    SV_Target.rgb = renodx::color::grade::UserColorGrading(SV_Target.rgb, config.exposure, config.highlights, config.shadows, config.contrast, config.saturation, config.reno_drt_dechroma, config.hue_correction_strength);

    SV_Target.rgb = applyRenoDice(SV_Target.rgb);

    SV_Target.rgb = renodx::color::correct::Hue(SV_Target.rgb, saturate(SV_Target.rgb), RENODX_TONE_MAP_HUE_SHIFT, RENODX_TONE_MAP_WORKING_COLOR_SPACE);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }

  SV_Target = renodx::draw::SwapChainPass(SV_Target);

  return SV_Target;
}
