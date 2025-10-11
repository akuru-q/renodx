#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:21 2025
Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s2_s : register(s2);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[4];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : COLOR0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cb9[0].w * -2 + 1;
  r0.x = 1 / r0.x;
  r0.y = cb9[0].z + 1;
  r1.xyz = t0.Sample(s0_s, v1.xy).xyz;

  ProcessUntonemapped(r1.rgb);

  r2.y = dot(float3(-0.168740004,-0.331259996,0.5), r1.xyz);
  r2.z = dot(float3(0.5,-0.418689996,-0.0813099965), r1.xyz);
  r2.yz = r2.yz * r0.yy;
  r0.y = dot(float3(0.298999995,0.587000012,0.114), r1.xyz);
  r2.x = cb9[0].y + r0.y;
  r3.x = dot(float2(1,1.40199995), r2.xz);
  r3.y = dot(float3(1,-0.344139993,-0.714139998), r2.xyz);
  r3.z = dot(float2(1,1.77199996), r2.xy);
  r0.xyz = saturate(r3.xyz * r0.xxx + -cb9[0].www);
  r0.xyz = log2(r0.xyz);
  r2.xyz = cb9[1].xyz * float3(0.454545438,0.454545438,0.454545438);
  r0.xyz = r2.xyz * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(float3(1,1,1), r0.xyz);
  r0.xyz = saturate(cb9[2].xyz * r0.xyz);
  r0.xyz = saturate(cb9[3].xyz + r0.xyz);
  r0.xyz = r0.xyz + -r1.xyz;
  r0.w = t2.Sample(s2_s, v1.zw).x;
  r0.w = cb9[1].w * r0.w;
  o0.xyz = r0.www * r0.xyz + r1.xyz;
  o0.w = v0.w;

  o0 = ApplyToneMapScaling(o0);

  return;
}