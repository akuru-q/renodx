#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:05 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[6];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[10];
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

cbuffer cb12 : register(b12)
{
  float4 cb12[30];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r1.xyz = v1.xyz * r0.xyz;
  r2.xy = cb12[29].zw * v3.xy;
  r2.zw = int2(8,4) & asint(cb13[0].xx);
  if (r2.z != 0) {
    r3.xy = t13.Sample(s13_s, r2.xy).xy;
  } else {
    r3.xy = float2(1,1);
  }
  r3.zw = r3.xy * cb1[9].xz + cb1[9].yw;
  r3.xy = r2.zz ? r3.zw : r3.xy;
  r1.w = r3.x * r3.y;
  r3.xyz = -cb3[5].xyz + float3(1,1,1);
  r3.xyz = r1.www * r3.xyz + cb3[5].xyz;
  r4.xyz = t14.Sample(s14_s, r2.xy).xyz;
  r4.xyz = r4.xyz / cb1[0].zzz;
  r0.xyz = r4.xyz * r0.xyz;
  r0.xyz = r1.xyz * r3.xyz + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r0.xyz, cb1[0].x);

  r3.xyz = r0.xyz + r0.xyz;
  r4.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r4.xyz = r3.xyz * r4.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r3.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r4.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.3790642,1.3790642,1.3790642) * r0.xyz);

  MarkerFunction2(r0.xyz);

  r3.xyz = v2.xyz + r0.xyz;
  r2.x = saturate(v2.x);
  r4.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r2.xxx * r4.xyz + r0.xyz;
  r1.xyz = r2.www ? r3.xyz : r0.xyz;
  r0.x = -cb7[8].x + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r2.zzzz ? r1.xyzw : r0.xyzw;
  return;
}