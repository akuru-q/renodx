#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:10 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb12 : register(b12)
{
  float4 cb12[30];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(-0.5,-0.5) + v0.xy;
  r0.zw = cb12[29].zw * float2(0.5,0.5);
  r0.xy = r0.xy * cb12[29].zw + r0.zw;
  r0.xyz = t0.Sample(s0_s, r0.xy).xyz;

  if (CUSTOM_CG_COUNT == 0.f) {
    r0.rgb = ApplyToneMapScalingPreFxaa(r0.rgb);
  }

  o0.w = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
  o0.xyz = r0.xyz;
  
  return;
}