#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:11 2025
Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[1];
}




// 3Dmigoto declarations
#define cmp -



void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  
  TonemapSDR(r0);
  
  r0.xyzw = float4(0.200000003,0.200000003,0.200000003,0.200000003) * r0.xyzw;
  r1.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  
  TonemapSDR(r1);
   
  r0.xyzw = r1.xyzw * float4(0.200000003,0.200000003,0.200000003,0.200000003) + r0.xyzw;
  r1.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
  
  TonemapSDR(r1);
  
  r0.xyzw = r1.xyzw * float4(0.200000003,0.200000003,0.200000003,0.200000003) + r0.xyzw;
  r1.xyzw = t3.Sample(s3_s, v1.zw).xyzw;
  
  TonemapSDR(r1);
  
  r0.xyzw = r1.xyzw * float4(0.200000003,0.200000003,0.200000003,0.200000003) + r0.xyzw;
  r1.xyzw = t4.Sample(s4_s, v2.xy).xyzw;
  
  TonemapSDR(r1);
  
  r0.xyzw = r1.xyzw * float4(0.200000003,0.200000003,0.200000003,0.200000003) + r0.xyzw;
  r0.xyzw = cb9[0].yzwx * r0.xyzw;
  
  //r0.xyz = saturate(r0.xyz + r0.www); 
  r0.xyz = (r0.xyz + r0.www); 
  
  TonemapSDR(r0);
  
  r0.w = max(r0.y, r0.z);
  o0.w = max(r0.x, r0.w);
  o0.xyz = r0.xyz;

  ScaleBloom(o0);
  
  return;
}