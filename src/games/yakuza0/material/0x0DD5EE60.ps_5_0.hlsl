#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:50 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

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
  float4 v0 : TEXCOORD0,
  float2 v1 : TEXCOORD1,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float3 v7 : TEXCOORD5,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r2.xy = t7.Sample(s7_s, v1.xy).xy;
  r1.w = v3.w * r1.w;
  r1.xyz = -r1.xyz * r1.xyz + float3(1,1,1);
  r1.xyz = -r1.xyz * r1.www + float3(1,1,1);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = dot(v4.xyz, v4.xyz);
  r1.x = rsqrt(r1.x);
  r1.yzw = v4.xyz * r1.xxx;
  r2.z = dot(v5.xyz, v5.xyz);
  r2.z = rsqrt(r2.z);
  r3.xyz = v5.xyz * r2.zzz;
  r2.z = saturate(dot(r1.yzw, -cb3[6].xyz));
  r4.xy = cb12[29].zw * v8.xy;
  r5.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r6.xyz = t13.Sample(s13_s, r4.xy).xyw;
  } else {
    r6.xyz = float3(1,1,1);
  }
  r4.zw = r6.xy * cb1[9].xz + cb1[9].yw;
  r4.zw = r5.xx ? r4.zw : r6.xy;
  r2.y = r2.y * cb1[10].x + cb1[10].y;
  r2.y = r2.x * r2.y;
  r7.xyz = -cb3[5].xyz + float3(1,1,1);
  r8.xyz = r2.yyy * r7.xyz + cb3[5].xyz;
  r9.xyz = t14.Sample(s14_s, r4.xy).xyz;
  r10.xyz = r9.xyz + r9.xyz;
  r9.xyz = r9.xyz / cb1[0].zzz;
  r9.xyz = r5.zzz ? r10.xyz : r9.xyz;
  r9.xyz = r5.yyy ? r10.xyz : r9.xyz;
  r2.yw = r4.zw * cb1[9].xz + cb1[9].yw;
  r2.yw = r5.xx ? r2.yw : r6.xy;
  r2.y = r2.y * r2.w;
  r4.xyz = r2.yyy * r7.xyz + cb3[5].xyz;
  r6.xyw = v2.xyz * r8.xyz;
  r6.xyw = r6.xyw * r6.zzz;
  r7.xyz = r4.xyz * r8.xyz;
  r10.xyz = r4.xyz * cb1[11].xxx + cb1[11].yyy;
  r8.xyz = r8.xyz * cb1[11].zzz + cb1[11].www;
  r8.xyz = r10.xyz * r8.xyz;
  r7.xyz = r5.xxx ? r8.xyz : r7.xyz;
  r7.xyz = r7.xyz * r2.xxx;
  r7.xyz = r7.xyz * r6.zzz;
  r8.xyz = cb6[1].www * cb7[11].xyz;
  r10.xyz = r8.xyz * r0.xyz;
  r11.xyz = r9.xyz * r2.www + v6.xyz;
  r11.xyz = r5.www ? v6.xyz : r11.xyz;
  r2.x = saturate(dot(r1.yzw, -cb3[7].xyz));
  r12.xyz = cb3[0].xyz * r2.zzz;
  r2.xyz = cb3[1].xyz * r2.xxx;
  r13.xyz = cb6[0].xyz * cb7[9].xyz;
  r14.xyz = r2.xyz * r2.www;
  r14.xyz = r12.xyz * r4.xyz + r14.xyz;
  r14.xyz = r13.xyz * r14.xyz + cb1[13].xyz;
  r8.xyz = r8.xyz * r0.xyz + r14.xyz;
  r14.xyz = r11.xyz * r7.xyz;
  r8.xyz = r8.xyz * r6.xyw + r14.xyz;
  r9.xyz = r9.xyz * r2.www + r8.xyz;
  r5.yzw = r5.www ? r9.xyz : r8.xyz;
  r5.yzw = r5.yzw * r0.xyz;
  r8.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r9.xyz = v4.xyz * r1.xxx + float3(1,1,1);
  r9.xyz = saturate(float3(0.5,0.5,0.5) * r9.xyz);
  r9.xyz = cb9[11].yyy * r9.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r9.xyz;
  r0.xyz = cb9[12].xxx * r4.xyz + r0.xyz;
  r0.xyz = cb9[12].yyy * r6.xyw + r0.xyz;
  r0.xyz = cb9[12].zzz * r7.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r13.xyz + r0.xyz;
  r1.x = dot(-r3.xyz, r1.yzw);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r10.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r13.xyz;
  r0.xyz = r1.xyz * r12.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r13.xyz;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r11.xyz + r0.xyz;
  r1.xyz = r8.xxx ? r0.xyz : r5.yzw;
  r1.w = cb5[1].w * cb7[9].w;
  r1.w = cb6[0].w * r1.w;
  r2.w = r1.w * r0.w;
  r1.xyz = cb1[0].xxx * r1.xyz;

  MarkerFunction1(r1.xyz, cb1[0].x);

  r3.xyz = log2(r1.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r1.xyz + r1.xyz;
  r5.yzw = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.yzw = r4.xyz * r5.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.xyz = r4.xyz * r1.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.xyz = r5.yzw / r1.xyz;
  r1.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.xyz;
  r1.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.xyz);

  MarkerFunction2(r1.xyz);

  r1.xyz = sqrt(r1.xyz);
  r0.xyz = r8.xxx ? r0.xyz : r1.xyz;
  r0.xyz = r8.yyy ? r3.xyz : r0.xyz;
  r1.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r2.xyz = r8.zzz ? r1.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r5.xxxx ? r2.xyzw : r0.xyzw;
  return;
}