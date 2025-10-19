#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:10 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[7];
}

// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = cb9[4].zwzw + -cb9[4].xyxy;
  r1.xyzw = v0.xyzw * r0.zwzw + cb9[4].xyxy;
  r2.xw = t0.Sample(s0_s, r1.zw).xw;
  r1.xw = t0.Sample(s0_s, r1.xy).xw;
  r3.xyzw = cb9[5].zwzw + -cb9[5].xyxy;
  r4.xyzw = v0.xyzw * r3.zwzw + cb9[5].xyxy;
  r2.y = t0.Sample(s0_s, r4.zw).y;
  r1.y = t0.Sample(s0_s, r4.xy).y;
  r4.xyzw = cb9[6].zwzw + -cb9[6].xyxy;
  r5.xyzw = v0.xyzw * r4.zwzw + cb9[6].xyxy;
  r2.z = t0.Sample(s0_s, r5.zw).z;
  r1.z = t0.Sample(s0_s, r5.xy).z;
  r2.xyzw = cb9[2].xyzw * r2.xyzw;
  r1.xyzw = r1.xyzw * cb9[3].xyzw + r2.xyzw;
  r2.xyzw = v1.xyzw * r0.zwzw + cb9[4].xyxy;
  r0.xyzw = v2.xyzw * r0.xyzw + cb9[4].xyxy;
  r5.xw = t0.Sample(s0_s, r2.xy).xw;
  r2.xw = t0.Sample(s0_s, r2.zw).xw;
  r6.xyzw = v1.xyzw * r3.zwzw + cb9[5].xyxy;
  r3.xyzw = v2.xyzw * r3.xyzw + cb9[5].xyxy;
  r5.y = t0.Sample(s0_s, r6.xy).y;
  r2.y = t0.Sample(s0_s, r6.zw).y;
  r6.xyzw = v1.xyzw * r4.zwzw + cb9[6].xyxy;
  r4.xyzw = v2.xyzw * r4.xyzw + cb9[6].xyxy;
  r5.z = t0.Sample(s0_s, r6.xy).z;
  r2.z = t0.Sample(s0_s, r6.zw).z;
  r1.xyzw = r5.xyzw * cb9[1].xyzw + r1.xyzw;
  r1.xyzw = r2.xyzw * cb9[1].xyzw + r1.xyzw;
  r2.xw = t0.Sample(s0_s, r0.xy).xw;
  r0.xw = t0.Sample(s0_s, r0.zw).xw;
  r2.y = t0.Sample(s0_s, r3.xy).y;
  r0.y = t0.Sample(s0_s, r3.zw).y;
  r2.z = t0.Sample(s0_s, r4.xy).z;
  r0.z = t0.Sample(s0_s, r4.zw).z;
  r1.xyzw = r2.xyzw * cb9[2].xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw * cb9[3].xyzw + r1.xyzw;

  TonemapSDR(o0);
  ScaleBloom(o0);

  return;
}