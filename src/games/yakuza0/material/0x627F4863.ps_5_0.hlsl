#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:10 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[4];
}

cbuffer cb5 : register(b5)
{
  float4 cb5[2];
}

cbuffer cb6 : register(b6)
{
  float4 cb6[1];
}

cbuffer cb7 : register(b7)
{
  float4 cb7[10];
}

cbuffer cb13 : register(b13)
{
  float4 cb13[1];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t1.Sample(s1_s, v0.zw).xyz;
  r1.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r0.xyz = r0.xyz * r0.xyz + -r1.xyz;
  r0.xyz = v2.www * r0.xyz + r1.xyz;
  r0.xyz = v1.xyz * r0.xyz;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r0.xyz, cb1[0].x);

  r1.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r2.xyz = r0.xyz + r0.xyz;
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r2.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.xyz = r2.xyz * r1.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r1.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.3790642,1.3790642,1.3790642) * r0.xyz);

  MaterialPostTonemap(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r1.xyz = cb1[1].xyz + -r0.xyz;
  r0.w = saturate(v2.x);
  r1.xyz = r0.www * r1.xyz + r0.xyz;
  r0.xyz = v2.xyz + r0.xyz;
  r2.xy = int2(4,8) & asint(cb13[0].xx);
  r0.xyz = r2.xxx ? r0.xyz : r1.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r0.w = r1.w * r1.x;
  r1.xyzw = cb1[3].xyzw * r0.xyzw;
  o0.xyzw = r2.yyyy ? r0.xyzw : r1.xyzw;
  return;
}