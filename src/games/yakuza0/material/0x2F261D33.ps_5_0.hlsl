#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:53 2025
Texture2D<float4> t0 : register(t0);

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
  float2 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cb5[1].w * cb7[9].w;
  r0.x = cb6[0].w * r0.x;
  r1.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.y = v1.w * r1.w;
  r1.xyz = r1.xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r0.z = r0.y * r0.x + -cb7[8].x;
  r2.w = r0.y * r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  r0.xyz = cb1[0].xxx * r1.xyz;

  MaterialPreTonemap(r0.xyz, cb1[0].x);

  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r4.xyz = r0.xyz + r0.xyz;
  r3.xyz = r4.xyz * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r5.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = log2(r0.xyz);
  r0.xyz = cb1[0].yyy * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r4.xyz = r4.xyz * r5.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r3.xyz = r3.xyz / r4.xyz;
  r3.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r3.xyz;
  r3.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r3.xyz);

  MaterialPostTonemap(r3.xyz);

  r3.xyz = sqrt(r3.xyz);
  r4.xyzw = int4(16,0x8000,4,8) & asint(cb13[0].xxxx);
  r1.xyz = r4.yyy ? r1.xyz : r3.xyz;
  r0.xyz = r4.xxx ? r0.xyz : r1.xyz;
  r1.xyz = cb1[1].xyz + -r0.xyz;
  r0.w = saturate(v2.x);
  r1.xyz = r0.www * r1.xyz + r0.xyz;
  r0.xyz = v2.xyz + r0.xyz;
  r2.xyz = r4.zzz ? r0.xyz : r1.xyz;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r4.wwww ? r2.xyzw : r0.xyzw;
  return;
}