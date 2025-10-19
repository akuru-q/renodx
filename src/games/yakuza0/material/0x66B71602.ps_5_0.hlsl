#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:57 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[12];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[14];
}

cbuffer cb9 : register(b9)
{
  float4 cb9[16];
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r1.x = t3.Sample(s3_s, r1.xy).y;
  r1.yzw = t1.Sample(s1_s, v0.zw).xyz;
  r2.x = t2.Sample(s2_s, v1.xy).y;
  r2.y = dot(v4.xyz, v4.xyz);
  r2.y = rsqrt(r2.y);
  r3.xyz = v4.xyz * r2.yyy;
  r2.z = dot(v5.xyz, v5.xyz);
  r2.z = rsqrt(r2.z);
  r4.xyz = v5.xyz * r2.zzz;
  r2.w = saturate(dot(r3.xyz, -cb3[6].xyz));
  r5.xy = cb12[29].zw * v8.xy;
  r6.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r7.xyz = t13.Sample(s13_s, r5.xy).xyw;
  } else {
    r7.xyz = float3(1,1,1);
  }
  r5.zw = r7.xy * cb1[9].xz + cb1[9].yw;
  r5.zw = r6.xx ? r5.zw : r7.xy;
  r8.xyz = -cb3[5].xyz + float3(1,1,1);
  r9.xyzw = t14.Sample(s14_s, r5.xy).xyzw;
  r10.xyzw = r9.xyzw + r9.xyzw;
  r9.xyzw = r9.xyzw / cb1[0].zzzz;
  r9.xyzw = r6.zzzz ? r10.xyzw : r9.xyzw;
  r9.xyzw = r6.yyyy ? r10.xyzw : r9.xyzw;
  r5.xy = r5.zw * cb1[9].xz + cb1[9].yw;
  r5.xy = r6.xx ? r5.xy : r7.xy;
  r3.w = r5.x * r5.y;
  r5.xzw = r3.www * r8.xyz + cb3[5].xyz;
  r7.xyw = v2.xyz * r7.zzz;
  r8.xyz = r5.xzw * cb1[11].xxx + cb1[11].yyy;
  r3.w = cb1[11].z + cb1[11].w;
  r8.xyz = r8.xyz * r3.www;
  r8.xyz = r6.xxx ? r8.xyz : r5.xzw;
  r8.xyz = r8.xyz * r7.zzz;
  r10.xyz = cb6[1].www * cb7[11].xyz;
  r11.xyz = r10.xyz * r0.xyz;
  r12.xyz = r9.xyz * r5.yyy + v6.xyz;
  r13.xyz = r9.www * r5.yyy + v7.xyz;
  r12.xyz = r6.www ? v6.xyz : r12.xyz;
  r13.xyz = r6.www ? v7.xyz : r13.xyz;
  r3.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r14.xyz = cb3[0].xyz * r2.www;
  r15.xyz = cb3[1].xyz * r3.www;
  r16.xyz = cb6[0].xyz * cb7[9].xyz;
  r17.xyz = r15.xyz * r5.yyy;
  r17.xyz = r14.xyz * r5.xzw + r17.xyz;
  r17.xyz = r16.xyz * r17.xyz + cb1[13].xyz;
  r10.xyz = r10.xyz * r0.xyz + r17.xyz;
  r17.xyz = r12.xyz * r8.xyz;
  r10.xyz = r10.xyz * r7.xyw + r17.xyz;
  r17.xyz = v5.xyz * r2.zzz + cb3[6].xyz;
  r2.w = dot(r17.xyz, r17.xyz);
  r2.w = rsqrt(r2.w);
  r17.xyz = r17.xyz * r2.www;
  r2.w = saturate(dot(-r17.xyz, r3.xyz));
  r17.xyz = v5.xyz * r2.zzz + float3(0,-0.300000012,0);
  r2.z = dot(r17.xyz, r17.xyz);
  r2.z = rsqrt(r2.z);
  r17.xyz = r17.xyz * r2.zzz;
  r2.z = saturate(dot(-r17.xyz, r3.xyz));
  r17.x = log2(r2.w);
  r17.y = log2(r2.z);
  r2.zw = cb7[10].ww * r17.xy;
  r2.zw = exp2(r2.zw);
  r4.w = cb3[11].x + cb3[11].x;
  r17.xyz = cb3[0].xyz * r2.zzz;
  r18.xyz = cb3[1].xyz * r2.www;
  r18.xyz = r18.xyz * r4.www;
  r19.xyz = r18.xyz * r3.www;
  r19.xyz = r17.xyz * r5.xzw + r19.xyz;
  r20.xyz = cb6[1].xyz * cb7[10].xyz;
  r19.xyz = r20.xyz * r19.xyz;
  r21.xyz = r13.xyz * r2.www;
  r21.xyz = r21.xyz * r8.xyz;
  r19.xyz = r19.xyz * r7.xyw + r21.xyz;
  r9.xyz = r9.xyz * r5.yyy + r10.xyz;
  r21.xyz = r9.www * r5.yyy + r19.xyz;
  r9.xyz = r6.www ? r9.xyz : r10.xyz;
  r6.yzw = r6.www ? r21.xyz : r19.xyz;
  r10.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r6.yzw = r10.xxx ? float3(0,0,0) : r6.yzw;
  r9.xyz = r9.xyz * r0.xyz;
  r6.yzw = r6.yzw * r1.xxx;
  r19.xyz = v4.xyz * r2.yyy + float3(1,1,1);
  r19.xyz = saturate(float3(0.5,0.5,0.5) * r19.xyz);
  r19.xyz = cb9[11].yyy * r19.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r19.xyz;
  r1.x = cb9[11].z * r1.x;
  r0.xyz = r1.xxx * r20.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r5.xzw + r0.xyz;
  r0.xyz = cb9[12].yyy * r7.xyw + r0.xyz;
  r0.xyz = cb9[12].zzz * r8.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r16.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r20.xyz + r0.xyz;
  r1.x = dot(-r4.xyz, r3.xyz);
  r1.x = 1 + -r1.x;
  r2.y = r1.x * r1.x;
  r2.y = r2.y * r2.y;
  r1.x = r2.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r11.xyz + r0.xyz;
  r3.xyz = cb9[14].yyy * r16.xyz;
  r0.xyz = r3.xyz * r14.xyz + r0.xyz;
  r3.xyz = cb9[14].zzz * r16.xyz;
  r0.xyz = r3.xyz * r15.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r12.xyz + r0.xyz;
  r3.xyz = cb9[15].xxx * r20.xyz;
  r0.xyz = r3.xyz * r17.xyz + r0.xyz;
  r3.xyz = cb9[15].yyy * r20.xyz;
  r3.xyz = r3.xyz * r18.xyz;
  r0.xyz = r3.xyz * r2.www + r0.xyz;
  r3.xyz = cb9[15].zzz * r13.xyz;
  r0.xyz = r3.xyz * r2.www + r0.xyz;
  r0.xyz = r10.yyy ? r0.xyz : r9.xyz;
  r2.yzw = r10.yyy ? float3(0,0,0) : r6.yzw;
  r0.xyz = r2.yzw + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r3.w = r1.x * r0.w;
  r2.yzw = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r2.yzw, cb1[0].x);

  r4.xyz = log2(r2.yzw);
  r4.xyz = cb1[0].yyy * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r5.xyz = r2.yzw + r2.yzw;
  r6.yzw = r2.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r6.yzw = r5.xyz * r6.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.yzw = r2.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.yzw = r5.xyz * r2.yzw + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.yzw = r6.yzw / r2.yzw;
  r2.yzw = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.yzw;
  r2.yzw = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.yzw);

  MarkerFunction2(r2.yzw);

  r2.yzw = sqrt(r2.yzw);
  r0.xyz = r10.yyy ? r0.xyz : r2.yzw;
  r0.xyz = r10.zzz ? r4.xyz : r0.xyz;
  r2.yzw = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r4.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r4.xyz + r0.xyz;
  r0.xyz = r10.www ? r2.yzw : r0.xyz;
  r3.xyz = r1.yzw * r2.xxx + r0.xyz;
  r0.x = saturate(cb9[0].w + r2.x);
  r0.xyzw = r3.xyzw * r0.xxxx;
  r1.xyzw = cb1[3].xyzw * r0.xyzw;
  o0.xyzw = r6.xxxx ? r0.xyzw : r1.xyzw;
  return;
}