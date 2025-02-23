#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Tue Oct 15 23:31:54 2024

SamplerState BlitSampler_s : register(s0);
Texture2D<float4> BlitTexture : register(t0);


// 3Dmigoto declarations
#define cmp -

void main(
    float2 v0: TEXCOORD0,
    float4 v1: SV_POSITION0,
    out float4 o0: SV_Target0)
{
  o0.rgba = BlitTexture.Sample(BlitSampler_s, v0.xy).xyzw;

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    o0.rgb = saturate(o0.rgb);
  }

  o0.rgb = renodx::draw::SwapChainPass(o0.rgb);
  
  return;
}