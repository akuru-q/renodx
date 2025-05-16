#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 15:40:53 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[5];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  
  r0 = max(0, r0);
  
  r0.xyzw = cb0[4].xyzw + r0.xyzw;
  r0.xyzw = v1.xyzw * r0.xyzw;
  r0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;
  r0.xyz = log2(r0.xyz);
  r0.xyz = cb0[2].xxx * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  return;
}