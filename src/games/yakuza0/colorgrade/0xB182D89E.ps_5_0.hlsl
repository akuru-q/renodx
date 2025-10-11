#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:15 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[15];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t0.Sample(s0_s, v0.xy).xyz;

  ProcessUntonemapped(r0.rgb);

  r0.w = dot(r0.xyz, float3(0.333333343,0.333333343,0.333333343));
  r1.x = 1 + -r0.w;
  r1.y = -r1.x * r1.x + 1;
  r2.x = r1.x * r1.x;
  r2.y = -r0.w * r0.w + r1.y;
  r2.z = r0.w * r0.w;
  r2.xyz = saturate(r2.xyz);
  r1.xyz = -cb9[6].xyz * r2.xxx + float3(1,1,1);
  r1.xyz = cb9[2].xyz * r1.xyz;
  r2.xyw = -cb9[10].xyz * r2.yyy + float3(1,1,1);
  r3.xyz = -cb9[14].xyz * r2.zzz + float3(1,1,1);
  r1.xyz = r2.xyw * r1.xyz;
  r1.xyz = r1.xyz * r3.xyz;
  r0.w = cb9[0].w * -2 + 1;
  r0.w = 1 / r0.w;
  r0.xyz = saturate(r0.xyz * r0.www + -cb9[0].www);
  o0.xyz = saturate(r0.xyz * r1.xyz);
  o0.w = 1;

  o0 = ApplyToneMapScaling(o0);

  return;
}