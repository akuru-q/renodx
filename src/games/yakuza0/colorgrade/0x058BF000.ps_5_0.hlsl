#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:02 2025
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
  r1.x = dot(cb9[4].xyz, r2.xyz);
  r1.y = dot(cb9[8].xyz, r2.xyz);
  r1.xy = cb9[0].zw + r1.xy;
  r0.w = 1 + r1.x;
  r3.y = dot(float3(-0.168740004,-0.331259996,0.5), r0.xyz);
  r3.z = dot(float3(0.5,-0.418689996,-0.0813099965), r0.xyz);
  r0.x = dot(float3(0.298999995,0.587000012,0.114), r0.xyz);
  r0.x = cb9[0].y + r0.x;
  r0.yz = r3.yz * r0.ww;
  r3.x = dot(float2(1,1.40199995), r0.xz);
  r3.y = dot(float3(1,-0.344139993,-0.714139998), r0.xyz);
  r3.z = dot(float2(1,1.77199996), r0.xy);
  r0.x = r1.y * -2 + 1;
  r0.x = 1 / r0.x;
  r0.xyz = saturate(r3.xyz * r0.xxx + -r1.yyy);
  r0.xyz = log2(r0.xyz);
  r1.x = dot(cb9[5].xyz, r2.xyz);
  r1.y = dot(cb9[9].xyz, r2.xyz);
  r1.z = dot(cb9[13].xyz, r2.xyz);
  r1.xyz = cb9[1].xyz + r1.xyz;
  r1.xyz = float3(0.454545438,0.454545438,0.454545438) * r1.xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(float3(1,1,1), r0.xyz);
  r1.xyz = -cb9[6].xyz * r2.xxx + float3(1,1,1);
  r1.xyz = cb9[2].xyz * r1.xyz;
  r2.xyw = -cb9[10].xyz * r2.yyy + float3(1,1,1);
  r3.xyz = -cb9[14].xyz * r2.zzz + float3(1,1,1);
  r1.xyz = r2.xyw * r1.xyz;
  r1.xyz = r1.xyz * r3.xyz;
  o0.xyz = saturate(r1.xyz * r0.xyz);
  o0.w = 1;

  o0 = ApplyToneMapScaling(o0); // cutscene

  return;
}