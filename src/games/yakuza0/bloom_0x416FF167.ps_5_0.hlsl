#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:07 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[3];
}

cbuffer cb13 : register(b13)
{
  float4 cb13[1];
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

  r0.xyz = t1.Sample(s1_s, v0.xy).xyz;
  
  //TonemapSDR(r0.rgb);
  //o0.rgb = r2.rgb;
  //return;
  
  r0.w = dot(float3(0.298911989,0.586610973,0.114478), r0.xyz);
  r1.xyzw = cb9[2].xyzw * r0.xyzw;
  r2.x = 8 & asint(cb13[0].x);
  if (r2.x != 0) {
    r2.xyz = t0.Sample(s0_s, v0.xy).xyz;

    if (RENODX_TONE_MAP_TYPE != 0.f) {
      r2.rgb = lerp(r2.rgb, r2.rgb * 0.7f, saturate(renodx::color::y::from::BT709(r2.rgb)));
    }
	
    r3.xyz = saturate(-cb9[0].yzw + r2.xyz);
    r2.x = dot(float3(0.298911989,0.586610973,0.114478), r2.xyz);
    r3.w = saturate(-cb9[0].x + r2.x);
    r2.xyzw =  saturate(cb9[1].yzwx * r3.xyzw);
    o0.xyzw = r0.xyzw * cb9[2].xyzw + r2.xyzw;
  } else {
    o0.xyzw = r1.xyzw;
  }
  return;
}