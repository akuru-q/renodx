#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:21 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.zw).xyzw;
  r0.xyzw = float4(0.25,0.25,0.25,0.25) * r0.xyzw;
  r1.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyzw = r1.xyzw * float4(0.25,0.25,0.25,0.25) + r0.xyzw;
  r1.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  r0.xyzw = r1.xyzw * float4(0.25,0.25,0.25,0.25) + r0.xyzw;
  r1.xyzw = t0.Sample(s0_s, v1.zw).xyzw;
  o0.xyzw = r1.xyzw * float4(0.25,0.25,0.25,0.25) + r0.xyzw;
  
  TonemapSDR(o0);

  ScaleBloom(o0);
  
  return;
}