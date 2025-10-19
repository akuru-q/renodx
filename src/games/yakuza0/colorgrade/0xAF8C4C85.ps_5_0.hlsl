#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:15 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[1];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cb9[0].w * -2 + 1;
  r0.x = 1 / r0.x;
  r0.yzw = t0.Sample(s0_s, v0.xy).xyz;

  ProcessUntonemapped(r0.yzw);

  o0.xyz = saturate(r0.yzw * r0.xxx + -cb9[0].www);
  o0.w = 1;

  o0 = ApplyToneMapScaling(o0);

  return;
}