#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:57 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[8];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[14];
}

cbuffer cb5 : register(b5)
{
  float4 cb5[2];
}

cbuffer cb6 : register(b6)
{
  float4 cb6[2];
}

cbuffer cb7 : register(b7)
{
  float4 cb7[12];
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
  float4 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r1.xyz = t1.Sample(s1_s, v0.zw).xyz;
  r2.xyz = -cb3[5].xyz + float3(1,1,1);
  r1.w = dot(v3.xyz, v3.xyz);
  r1.w = rsqrt(r1.w);
  r3.xyz = v3.xyz * r1.www;
  r1.w = dot(v4.xyz, v4.xyz);
  r1.w = rsqrt(r1.w);
  r4.xyz = v4.xyz * r1.www;
  r5.xy = cb12[29].zw * v7.xy;
  r6.xyzw = int4(8,0x4000,8192,128) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r7.xyz = t13.Sample(s13_s, r5.xy).xyw;
  } else {
    r7.xyz = float3(1,1,1);
  }
  r5.xyzw = t14.Sample(s14_s, r5.xy).xyzw;
  r8.xyzw = r5.xyzw + r5.xyzw;
  r5.xyzw = r5.xyzw / cb1[0].zzzz;
  r5.xyzw = r6.zzzz ? r8.xyzw : r5.xyzw;
  r5.xyzw = r6.yyyy ? r8.xyzw : r5.xyzw;
  r6.yz = r7.xy * cb1[9].xz + cb1[9].yw;
  r6.yz = r6.xx ? r6.yz : r7.xy;
  r2.w = r6.y * r6.z;
  r2.xyz = r2.www * r2.xyz + cb3[5].xyz;
  r7.xyz = v1.xyz * r7.zzz;
  r8.xyz = r2.xyz * cb1[11].xxx + cb1[11].yyy;
  r2.w = cb1[11].z + cb1[11].w;
  r8.xyz = r8.xyz * r2.www;
  r8.xyz = r6.xxx ? r8.xyz : r2.xyz;
  r2.w = saturate(dot(r3.xyz, -cb3[6].xyz));
  r3.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r9.xyz = cb3[0].xyz * r2.www;
  r10.xyz = cb3[1].xyz * r3.www;
  r11.xyz = cb1[13].xyz * cb7[11].www;
  r12.xyz = cb6[0].xyz * cb7[9].xyz;
  r10.xyz = r10.xyz * r6.zzz;
  r9.xyz = r9.xyz * r2.xyz + r10.xyz;
  r9.xyz = r12.xyz * r9.xyz + r11.xyz;
  r10.xyz = v5.xyz * r8.xyz;
  r9.xyz = r9.xyz * r7.xyz + r10.xyz;
  r10.xyz = v4.xyz * r1.www + cb3[6].xyz;
  r1.w = dot(r10.xyz, r10.xyz);
  r1.w = rsqrt(r1.w);
  r10.xyz = r10.xyz * r1.www;
  r1.w = saturate(dot(-r10.xyz, r3.xyz));
  r2.w = saturate(dot(-r4.xyz, r3.xyz));
  r3.x = log2(r1.w);
  r3.y = log2(r2.w);
  r3.xy = cb7[10].ww * r3.xy;
  r3.xy = exp2(r3.xy);
  r4.xyz = cb3[0].xyz * r3.xxx;
  r10.xyz = cb3[1].xyz * r3.yyy;
  r3.xzw = r10.xyz * r3.www;
  r2.xyz = r4.xyz * r2.xyz + r3.xzw;
  r3.xzw = cb6[1].xyz * cb7[10].xyz;
  r2.xyz = r3.xzw * r2.xyz;
  r3.xyz = v6.xyz * r3.yyy;
  r3.xyz = r3.xyz * r8.xyz;
  r2.xyz = r2.xyz * r7.xyz + r3.xyz;
  r3.xyz = r5.xyz * r6.zzz + r9.xyz;
  r2.xyz = r5.www * r6.zzz + r2.xyz;
  r2.xyz = r6.www ? float3(0,0,0) : r2.xyz;
  r1.xyz = r3.xyz + r1.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = int3(16,0x8000,4) & asint(cb13[0].xxx);
  r5.xyz = r2.xyz + r2.xyz;
  r6.yzw = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r6.yzw = r5.xyz * r6.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r5.xyz * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r6.yzw / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MarkerFunction2(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r4.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r4.xxx ? r3.xyz : r0.xyz;
  r2.xyz = v2.xyz + r0.xyz;
  r0.w = saturate(v2.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r4.zzz ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r6.xxxx ? r1.xyzw : r0.xyzw;
  return;
}