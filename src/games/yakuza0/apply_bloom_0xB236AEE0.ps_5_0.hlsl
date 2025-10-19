#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:16 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);


// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;

  TonemapSDR(o0);
  ScaleBloom(o0);
  
  return;
}