#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:55 2025
Texture2D<float4> t13 : register(t13);

Texture2D<float4> t0 : register(t0);

SamplerState s13_s : register(s13);

SamplerState s0_s : register(s0);

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
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v4.xyz, v4.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = v4.xyz * r0.xxx;
  r0.w = dot(r0.xyz, v3.xyz);
  r1.x = -v4.z * cb9[0].x + v5.x;
  r1.y = v4.z * cb9[0].x + v5.x;
  r1.z = -1 / r0.w;
  r1.w = v5.y + v3.w;
  r1.w = r1.w * r1.z;
  r2.x = -v5.y + v3.w;
  r1.z = r2.x * r1.z;
  r2.x = min(r1.w, r1.z);
  r1.z = max(r1.w, r1.z);
  r2.yzw = r0.xyz * r2.xxx + -v2.xyz;
  r3.xyz = r0.xyz * r1.zzz + -v2.xyz;
  r1.w = cmp(r0.w >= 0);
  r4.xyz = r1.www ? float3(1,0.5,0) : 0;
  r1.w = v5.y + v5.y;
  r1.w = r4.x * r1.w + -v5.y;
  r2.yzw = v3.xyz * r1.www + r2.yzw;
  r3.xyz = -v3.xyz * r1.www + r3.xyz;
  r5.xyz = v3.xyz * v3.www + v2.xyz;
  r6.xyz = -v3.xyz * r0.www + r0.xyz;
  r1.w = dot(r6.xyz, r6.xyz);
  r3.w = dot(r6.xyz, r5.xyz);
  r1.w = r3.w / r1.w;
  r1.w = max(r1.w, r2.x);
  r1.z = min(r1.w, r1.z);
  r5.xyz = r6.xyz * r1.zzz + -r5.xyz;
  r1.z = dot(r5.xyz, r5.xyz);
  r1.z = sqrt(r1.z);
  r1.xz = r1.xz + -r1.yy;
  r1.z = saturate(r1.z / r1.x);
  r1.w = r1.y * r1.y;
  r3.xyz = r3.xyz + -r2.yzw;
  r2.x = dot(r3.xyz, r3.xyz);
  r3.w = dot(r3.xyz, r2.yzw);
  r4.x = dot(r2.yzw, r2.yzw);
  r4.w = r4.x * r2.x;
  r1.w = r2.x * r1.w + -r4.w;
  r1.w = r3.w * r3.w + r1.w;
  r4.w = cmp(r1.w < 0);
  if (r4.w != 0) discard;
  r1.w = sqrt(r1.w);
  r2.x = -1 / r2.x;
  r4.w = r3.w + r1.w;
  r4.w = r4.w * r2.x;
  r1.w = r3.w + -r1.w;
  r1.w = r1.w * r2.x;
  r2.x = max(r4.w, r1.w);
  r2.x = cmp(r2.x < 0);
  if (r2.x != 0) discard;
  r1.w = min(r4.w, r1.w);
  r2.x = 1 + -r1.w;
  r2.x = cmp(r2.x < 0);
  if (r2.x != 0) discard;
  r2.xyz = r3.xyz * r1.www + r2.yzw;
  r1.w = dot(r2.xyz, r2.xyz);
  r1.w = rsqrt(r1.w);
  r2.xyz = r2.xyz * r1.www;
  r1.w = sqrt(r4.x);
  r1.y = r1.w + -r1.y;
  r1.x = saturate(r1.y / r1.x);
  r1.yw = v1.xy * float2(0.5,1) + r4.yz;
  r3.xyz = t0.Sample(s0_s, r1.yw).xyz;
  r1.y = dot(r3.xyz, float3(0.333333343,0.333333343,0.333333343));
  r0.x = dot(r0.xyz, r2.xyz);
  r0.xw = float2(1,1) + -abs(r0.xw);
  r0.xw = max(float2(0,0), r0.xw);
  r0.x = log2(r0.x);
  r0.x = v7.w * r0.x;
  r0.x = exp2(r0.x);
  r0.x = r1.y * r0.x;
  r2.xyz = v8.xyz + -v7.xyz;
  r0.xyz = r0.xxx * r2.xyz + v7.xyz;
  r0.xyz = r3.xyz * r0.xyz;
  r0.w = log2(r0.w);
  r0.w = v7.w * r0.w;
  r0.w = exp2(r0.w);
  r0.w = r1.y * r0.w;
  r2.xyz = r0.www * r2.xyz + v7.xyz;
  r0.w = r1.z + r1.x;
  r0.w = r1.x / r0.w;
  r2.xyz = r3.xyz * r2.xyz + -r0.xyz;
  r0.xyz = r0.www * r2.xyz + r0.xyz;
  r0.w = 1 + -r1.z;
  r1.w = r1.x * r0.w + r1.z;
  r2.xyz = int3(8,16,0x8000) & asint(cb13[0].xxx);
  if (r2.x != 0) {
    r3.xy = v6.xy / v6.ww;
    r3.xy = t13.Sample(s13_s, r3.xy).xy;
  } else {
    r3.xy = float2(1,1);
  }
  r3.zw = r3.xy * cb1[9].xz + cb1[9].yw;
  r3.xy = r2.xx ? r3.zw : r3.xy;
  r0.w = r3.x * r3.y;
  r2.w = -cb9[0].y + 1;
  r0.w = r0.w * r2.w + cb9[0].y;
  r2.w = 1 + -r0.w;
  r0.w = v5.w * r2.w + r0.w;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = max(float3(9.99999972e-10,9.99999972e-10,9.99999972e-10), r0.xyz);
  r3.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r3.xyz, cb1[0].x);

  r4.xyz = log2(r3.xyz);
  r4.xyz = cb1[0].yyy * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r5.xyz = r3.xyz + r3.xyz;
  r6.xyz = r3.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r6.xyz = r5.xyz * r6.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r3.xyz = r3.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r3.xyz = r5.xyz * r3.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r3.xyz = r6.xyz / r3.xyz;
  r3.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r3.xyz;
  r3.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r3.xyz);

  MarkerFunction2(r3.xyz);

  r3.xyz = sqrt(r3.xyz);
  r0.xyz = r2.zzz ? r0.xyz : r3.xyz;
  r1.xyz = r2.yyy ? r4.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r2.xxxx ? r1.xyzw : r0.xyzw;
  return;
}