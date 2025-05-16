#include "./shared.h"

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  float4 color = t0.Sample(s0, uv);

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    color = saturate(color);
  }

  color = renodx::draw::SwapChainPass(color);

  return color;

  //return renodx::draw::SwapChainPass(t0.Sample(s0, uv));
}
