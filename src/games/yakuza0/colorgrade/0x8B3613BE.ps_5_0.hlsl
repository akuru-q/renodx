#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:13 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[16];
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

  r0.x = cb9[0].w * -2 + 1;
  r0.x = 1 / r0.x;
  r0.yzw = t0.Sample(s0_s, v0.xy).xyz;

  ProcessUntonemapped(r0.yzw);

  r1.xyz = saturate(r0.yzw * r0.xxx + -cb9[0].www);
  r0.x = dot(r0.yzw, float3(0.333333343,0.333333343,0.333333343));
  r0.yzw = log2(r1.xyz);
  r1.x = 1 + -r0.x;
  r1.y = -r1.x * r1.x + 1;
  r2.x = r1.x * r1.x;
  r2.y = -r0.x * r0.x + r1.y;
  r2.z = r0.x * r0.x;
  r2.xyz = saturate(r2.xyz);
  r1.x = dot(cb9[5].xyz, r2.xyz);
  r1.y = dot(cb9[9].xyz, r2.xyz);
  r1.z = dot(cb9[13].xyz, r2.xyz);
  r1.xyz = cb9[1].xyz + r1.xyz;
  r1.xyz = float3(0.454545438,0.454545438,0.454545438) * r1.xyz;
  r0.xyz = r1.xyz * r0.yzw;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(float3(1,1,1), r0.xyz);
  r1.xyz = -cb9[6].xyz * r2.xxx + float3(1,1,1);
  r1.xyz = cb9[2].xyz * r1.xyz;
  r3.xyz = -cb9[10].xyz * r2.yyy + float3(1,1,1);
  r1.xyz = r3.xyz * r1.xyz;
  r3.xyz = -cb9[14].xyz * r2.zzz + float3(1,1,1);
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = saturate(r1.xyz * r0.xyz);
  r1.xyz = cb9[11].xyz * r2.yyy;
  r1.xyz = cb9[7].xyz * r2.xxx + r1.xyz;
  r1.xyz = cb9[15].xyz * r2.zzz + r1.xyz;
  r1.xyz = cb9[3].xyz + r1.xyz;
  o0.xyz = saturate(r1.xyz + r0.xyz);
  o0.w = 1;

  o0 = ApplyToneMapScaling(o0);

  return;
}