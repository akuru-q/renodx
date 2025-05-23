#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 15:40:51 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[3];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  
  //r0.xyz = log2(r0.xyz);
  //o0.w = r0.w;
  //r0.xyz = cb0[2].xxx * r0.xyz;
  //o0.xyz = exp2(r0.xyz);
  
  o0.rgb = renodx::math::SignPow(r0.xyz, cb0[2].x);
  o0.w = log2(r0.w);

  o0.rgb = applyRenoDice(o0.rgb);
  
  return;
}