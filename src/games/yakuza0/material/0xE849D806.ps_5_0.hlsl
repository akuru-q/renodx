#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:20 2025
Texture2D<float4> t13 : register(t13);

Texture2D<float4> t0 : register(t0);

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

cbuffer cb9 : register(b9)
{
  float4 cb9[1];
}

cbuffer cb13 : register(b13)
{
  float4 cb13[1];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float3 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t0.Sample(s0_s, v1.xy).xyz;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyz = v3.xyz * r0.xyz;
  r2.xyz = int3(8,16,0x8000) & asint(cb13[0].xxx);
  if (r2.x != 0) {
    r3.xy = v2.xy / v2.ww;
    r3.xy = t13.Sample(s13_s, r3.xy).xy;
  } else {
    r3.xy = float2(1,1);
  }
  r3.zw = r3.xy * cb1[9].xz + cb1[9].yw;
  r3.xy = r2.xx ? r3.zw : r3.xy;
  r0.w = r3.x * r3.y;
  r3.xyz = -cb3[5].xyz + float3(1,1,1);
  r3.xyz = r0.www * r3.xyz + cb3[5].xyz;
  r3.xyz = r2.xxx ? r3.xyz : float3(1,1,1);
  r0.xyz = cb9[0].xyz * r0.xyz;
  r0.xyz = r1.xyz * r3.xyz + r0.xyz;
  r1.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r1.xyz, cb1[0].x);

  r3.xyz = log2(r1.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r1.xyz + r1.xyz;
  r5.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.xyz * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.xyz = r4.xyz * r1.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.xyz = r5.xyz / r1.xyz;
  r1.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.xyz;
  r1.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.xyz);

  MaterialPostTonemap(r1.xyz);

  r1.xyz = sqrt(r1.xyz);
  r0.xyz = r2.zzz ? r0.xyz : r1.xyz;
  r0.xyz = r2.yyy ? r3.xyz : r0.xyz;
  r0.w = 1;
  r1.xyzw = cb1[3].xyzw * r0.xyzw;
  o0.xyzw = r2.xxxx ? r0.xyzw : r1.xyzw;
  return;
}