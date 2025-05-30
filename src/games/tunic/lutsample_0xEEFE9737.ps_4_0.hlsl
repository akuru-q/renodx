// Game Render + LUT

#include "./shared.h"

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0) {
  float4 cb0[7];
}

// 3Dmigoto declarations
#define cmp -

void main(float4 v0: SV_POSITION0, float4 v1: TEXCOORD0, float4 v2: TEXCOORD1, float4 v3: TEXCOORD2, out float4 o0: SV_Target0) {
  float4 r0, r1, r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v3.xy).xyzw;
  o0.w = r0.w;

  r0.xyz = cb0[6].yyy * r0.xyz;  // scale

  float3 gamma_input = max(0, r0.rgb);

  float3 untonemapped = renodx::color::srgb::Decode(gamma_input);

  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.lut_sampler = s1_s;
  lut_config.strength = CUSTOM_LUT_STRENGTH;
  lut_config.scaling = CUSTOM_LUT_SCALING;
  lut_config.size = 32u;
  lut_config.tetrahedral = CUSTOM_LUT_TETRAHEDRAL == 1.f;

  float3 outputColor;
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    outputColor = renodx::lut::Sample(
        saturate(untonemapped),
        lut_config,
        t1);
  } else {
    outputColor = renodx::draw::ToneMapPass(
        untonemapped,
        renodx::lut::Sample(
            renodx::tonemap::renodrt::NeutralSDR(untonemapped),
            lut_config,
            t1));
  }

  outputColor = renodx::draw::RenderIntermediatePass(outputColor);

  o0.rgb = outputColor.rgb;
  return;
}
