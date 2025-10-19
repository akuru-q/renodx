#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:19 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[4];
}

cbuffer cb5 : register(b5)
{
  float4 cb5[2];
}

cbuffer cb6 : register(b6)
{
  float4 cb6[1];
}

cbuffer cb7 : register(b7)
{
  float4 cb7[10];
}

cbuffer cb13 : register(b13)
{
  float4 cb13[1];
}


// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cb5[1].w * cb7[9].w;
  r0.x = cb6[0].w * r0.x;
  r1.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.y = r1.w * r0.x + -cb7[8].x;
  r2.w = r1.w * r0.x;
  r0.xzw = r1.xyz * r1.xyz;
  r0.xzw = v1.xyz * r0.xzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r1.xyz = cb1[0].xxx * r0.xzw;
  r1.xyz = log2(r1.xyz);
  r1.xyz = cb1[0].yyy * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r3.xyz = sqrt(r0.xzw);
  r4.xyz = int3(16,0x8000,8) & asint(cb13[0].xxx);
  r0.xyz = r4.yyy ? r0.xzw : r3.xyz;
  r2.xyz = r4.xxx ? r1.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r4.zzzz ? r2.xyzw : r0.xyzw;

  //TonemapSDR(o0);
  //ScaleBloom(o0);

  // not bloom!
  
  return;
}