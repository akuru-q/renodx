#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:50 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[8];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[14];
}

cbuffer cb9 : register(b9)
{
  float4 cb9[15];
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
  float2 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.x = dot(v3.xyz, v3.xyz);
  r1.x = rsqrt(r1.x);
  r1.yzw = v3.xyz * r1.xxx;
  r2.x = dot(v4.xyz, v4.xyz);
  r2.x = rsqrt(r2.x);
  r2.xyz = v4.xyz * r2.xxx;
  r2.w = saturate(dot(r1.yzw, -cb3[6].xyz));
  r3.xy = cb12[29].zw * v7.xy;
  r4.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r4.x != 0) {
    r5.xyz = t13.Sample(s13_s, r3.xy).xyw;
  } else {
    r5.xyz = float3(1,1,1);
  }
  r3.zw = r5.xy * cb1[9].xz + cb1[9].yw;
  r3.zw = r4.xx ? r3.zw : r5.xy;
  r6.xyz = -cb3[5].xyz + float3(1,1,1);
  r7.xyz = t14.Sample(s14_s, r3.xy).xyz;
  r8.xyz = r7.xyz + r7.xyz;
  r7.xyz = r7.xyz / cb1[0].zzz;
  r7.xyz = r4.zzz ? r8.xyz : r7.xyz;
  r7.xyz = r4.yyy ? r8.xyz : r7.xyz;
  r3.xy = r3.zw * cb1[9].xz + cb1[9].yw;
  r3.xy = r4.xx ? r3.xy : r5.xy;
  r3.x = r3.x * r3.y;
  r3.xzw = r3.xxx * r6.xyz + cb3[5].xyz;
  r5.xyw = v1.xyz * r5.zzz;
  r6.xyz = r3.xzw * cb1[11].xxx + cb1[11].yyy;
  r4.y = cb1[11].z + cb1[11].w;
  r6.xyz = r6.xyz * r4.yyy;
  r6.xyz = r4.xxx ? r6.xyz : r3.xzw;
  r6.xyz = r6.xyz * r5.zzz;
  r8.xyz = cb6[1].www * cb7[11].xyz;
  r9.xyz = r8.xyz * r0.xyz;
  r10.xyz = r7.xyz * r3.yyy + v5.xyz;
  r10.xyz = r4.www ? v5.xyz : r10.xyz;
  r4.y = saturate(dot(r1.yzw, -cb3[7].xyz));
  r11.xyz = cb3[0].xyz * r2.www;
  r12.xyz = cb3[1].xyz * r4.yyy;
  r13.xyz = cb6[0].xyz * cb7[9].xyz;
  r14.xyz = r12.xyz * r3.yyy;
  r14.xyz = r11.xyz * r3.xzw + r14.xyz;
  r14.xyz = r13.xyz * r14.xyz + cb1[13].xyz;
  r8.xyz = r8.xyz * r0.xyz + r14.xyz;
  r14.xyz = r10.xyz * r6.xyz;
  r8.xyz = r8.xyz * r5.xyw + r14.xyz;
  r7.xyz = r7.xyz * r3.yyy + r8.xyz;
  r4.yzw = r4.www ? r7.xyz : r8.xyz;
  r4.yzw = r4.yzw * r0.xyz;
  r7.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r8.xyz = v3.xyz * r1.xxx + float3(1,1,1);
  r8.xyz = saturate(float3(0.5,0.5,0.5) * r8.xyz);
  r8.xyz = cb9[11].yyy * r8.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r8.xyz;
  r0.xyz = cb9[12].xxx * r3.xzw + r0.xyz;
  r0.xyz = cb9[12].yyy * r5.xyw + r0.xyz;
  r0.xyz = cb9[12].zzz * r6.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r13.xyz + r0.xyz;
  r1.x = dot(-r2.xyz, r1.yzw);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r9.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r13.xyz;
  r0.xyz = r1.xyz * r11.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r13.xyz;
  r0.xyz = r1.xyz * r12.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r10.xyz + r0.xyz;
  r1.xyz = r7.xxx ? r0.xyz : r4.yzw;
  r0.w = v1.w * r0.w;
  r1.w = cb5[1].w * cb7[9].w;
  r1.w = cb6[0].w * r1.w;
  r2.w = r1.w * r0.w;
  r1.xyz = cb1[0].xxx * r1.xyz;

  MarkerFunction1(r1.xyz, cb1[0].x);

  r3.xyz = log2(r1.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.yzw = r1.xyz + r1.xyz;
  r5.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.yzw * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.xyz = r4.yzw * r1.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.xyz = r5.xyz / r1.xyz;
  r1.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.xyz;
  r1.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.xyz);

  MarkerFunction2(r1.xyz);

  r1.xyz = sqrt(r1.xyz);
  r0.xyz = r7.xxx ? r0.xyz : r1.xyz;
  r0.xyz = r7.yyy ? r3.xyz : r0.xyz;
  r1.xyz = v2.xyz + r0.xyz;
  r3.x = saturate(v2.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r2.xyz = r7.zzz ? r1.xyz : r0.xyz;
  r0.x = r0.w * r1.w + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r4.xxxx ? r2.xyzw : r0.xyzw;
  return;
}