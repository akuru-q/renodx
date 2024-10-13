// UI Back layer (With alpha)

#include "./shared.h"

Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0) {
  float4 cb0[8];
}

// 3Dmigoto declarations
#define cmp -

void main(float2 v0 : TEXCOORD0, float4 v1 : COLOR0, out float4 o0 : SV_TARGET0) {
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = saturate(v1.xyz);
  r0.xyz = log2(r0.xyz);
  r0.xyz = cb0[7].xxx * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  r0.x = t0.Sample(s0_s, v0.xy).x;
  o0.w = v1.w * r0.x;

  o0.rgb = saturate(o0.rgb);
  o0.rgb = injectedData.toneMapGammaCorrection
               ? pow(o0.rgb, 2.2f)
               : renodx::color::srgb::Decode(o0.rgb);
  o0.rgb *= injectedData.toneMapUINits / 80.f;
  return;
}
