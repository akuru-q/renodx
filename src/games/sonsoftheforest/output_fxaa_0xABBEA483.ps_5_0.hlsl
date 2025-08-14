#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Wed Jul 24 23:44:38 2024
Texture2DArray<float4> t3 : register(t3);

Texture2DArray<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2DArray<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[80];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[11];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * cb0[8].xy + cb0[8].zw;
  r0.zw = r0.xy * cb0[6].xy + cb0[6].zw;
  r0.z = t1.SampleBias(s1_s, r0.zw, cb1[79].y).w;
  r0.z = -0.5 + r0.z;
  r0.z = r0.z + r0.z;
  r1.xy = cb0[9].xy * r0.xy;
  r2.xy = cb1[48].xy * r0.xy;
  r1.xy = (uint2)r1.xy;
  r1.zw = float2(0,0);
  r0.xyw = t0.Load(r1.xyzw).xyz; 
  //r0.xyw = saturate(r0.xyw);
  r1.xyz = r0.xyw * r0.zzz;
  r1.xyz = cb0[5].xxx * r1.xyz;
  r0.z = dot(r0.xyw, float3(0.212672904,0.715152204,0.0721750036));
  r0.z = sqrt(r0.z);
  r0.z = cb0[5].y * -r0.z + 1;
  r0.xyz = r1.xyz * r0.zzz + r0.xyw;
  r2.z = 0;
  r1.xyzw = t2.SampleLevel(s0_s, r2.xyz, 0).xyzw;  
  o0.xyz = r1.www * r0.xyz + r1.xyz;
  r0.xy = cb1[46].xy * v1.xy;
  r0.xy = (uint2)r0.xy;
  r0.xy = (uint2)r0.xy;
  r0.zw = float2(-1,-1) + cb1[46].xy;
  r0.zw = cb0[8].zw * r0.zw;
  r0.xy = r0.xy * cb0[8].xy + r0.zw;
  r0.xy = (uint2)r0.xy;
  r0.zw = float2(0,0);
  r0.x = t3.Load(r0.xyzw).x;
  r0.y = cmp(cb0[10].x == 1.000000);
  o0.w = r0.y ? r0.x : 1;
  return;
}