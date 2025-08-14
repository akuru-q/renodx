#include "./common.hlsl"
#include "./shared.h"

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  float4 color = t0.Sample(s0, uv);

  if (injectedData.toneMapGammaCorrection == 1.f) {
    color.xyz = renodx::color::correct::GammaSafe(color.xyz);
  }
  
  color.rgb = renodx::color::bt709::clamp::BT2020(color.rgb);

  color.xyz *= injectedData.toneMapUINits;
  color.xyz /= 80.f;

  color.a = 1.f;
  return color;
}
