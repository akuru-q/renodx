#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:55 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

SamplerState s3_s : register(s3);

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
  float4 v1 : TEXCOORD1,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : TEXCOORD6,
  float4 v9 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r1.xyz = t3.Sample(s3_s, r1.xy).xyz;
  r2.xy = t5.Sample(s5_s, v0.zw).xy;
  r3.xyzw = t1.Sample(s1_s, v1.xy).xyzw;
  r2.zw = t7.Sample(s7_s, v1.zw).xy;
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r1.w = dot(r2.xy, r2.xy);
  r1.w = 1 + -r1.w;
  r1.w = max(0, r1.w);
  r1.w = sqrt(r1.w);
  r4.xyz = v8.yzx * v4.zxy;
  r4.xyz = v4.yzx * v8.zxy + -r4.xyz;
  r4.xyz = v8.www * r4.xyz;
  r5.xyz = v8.xyz * r2.xxx;
  r4.xyz = r2.yyy * r4.xyz + r5.xyz;
  r4.xyz = r1.www * v4.xyz + r4.xyz;
  r1.w = dot(r4.xyz, r4.xyz);
  r1.w = rsqrt(r1.w);
  r5.xyz = r4.xyz * r1.www;
  r2.x = dot(v5.xyz, v5.xyz);
  r2.x = rsqrt(r2.x);
  r6.xyz = v5.xyz * r2.xxx;
  r2.y = saturate(dot(r5.xyz, -cb3[6].xyz));
  r7.xy = cb12[29].zw * v9.xy;
  r8.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r8.x != 0) {
    r9.xyz = t13.Sample(s13_s, r7.xy).xyw;
  } else {
    r9.xyz = float3(1,1,1);
  }
  r7.zw = r9.xy * cb1[9].xz + cb1[9].yw;
  r7.zw = r8.xx ? r7.zw : r9.xy;
  r2.w = r2.w * cb1[10].x + cb1[10].y;
  r2.w = r2.z * r2.w;
  r10.xyz = -cb3[5].xyz + float3(1,1,1);
  r11.xyz = r2.www * r10.xyz + cb3[5].xyz;
  r12.xyzw = t14.Sample(s14_s, r7.xy).xyzw;
  r13.xyzw = r12.xyzw + r12.xyzw;
  r12.xyzw = r12.xyzw / cb1[0].zzzz;
  r12.xyzw = r8.zzzz ? r13.xyzw : r12.xyzw;
  r12.xyzw = r8.yyyy ? r13.xyzw : r12.xyzw;
  r7.xy = r7.zw * cb1[9].xz + cb1[9].yw;
  r7.xy = r8.xx ? r7.xy : r9.xy;
  r2.w = r7.x * r7.y;
  r7.xzw = r2.www * r10.xyz + cb3[5].xyz;
  r9.xyw = v2.xyz * r11.xyz;
  r9.xyw = r9.xyw * r9.zzz;
  r10.xyz = r7.xzw * r11.xyz;
  r13.xyz = r7.xzw * cb1[11].xxx + cb1[11].yyy;
  r11.xyz = r11.xyz * cb1[11].zzz + cb1[11].www;
  r11.xyz = r13.xyz * r11.xyz;
  r10.xyz = r8.xxx ? r11.xyz : r10.xyz;
  r10.xyz = r10.xyz * r2.zzz;
  r10.xyz = r10.xyz * r9.zzz;
  r11.xyz = cb6[1].www * cb7[11].xyz;
  r13.xyz = r11.xyz * r0.xyz;
  r14.xyz = r12.xyz * r7.yyy + v6.xyz;
  r15.xyz = r12.www * r7.yyy + v7.xyz;
  r14.xyz = r8.www ? v6.xyz : r14.xyz;
  r15.xyz = r8.www ? v7.xyz : r15.xyz;
  r2.z = saturate(dot(r5.xyz, -cb3[7].xyz));
  r16.xyz = cb3[0].xyz * r2.yyy;
  r17.xyz = cb3[1].xyz * r2.zzz;
  r18.xyz = cb6[0].xyz * cb7[9].xyz;
  r19.xyz = r17.xyz * r7.yyy;
  r19.xyz = r16.xyz * r7.xzw + r19.xyz;
  r19.xyz = r18.xyz * r19.xyz + cb1[13].xyz;
  r11.xyz = r11.xyz * r0.xyz + r19.xyz;
  r19.xyz = r14.xyz * r10.xyz;
  r11.xyz = r11.xyz * r9.xyw + r19.xyz;
  r19.xyz = v5.xyz * r2.xxx + cb3[6].xyz;
  r2.y = dot(r19.xyz, r19.xyz);
  r2.y = rsqrt(r2.y);
  r19.xyz = r19.xyz * r2.yyy;
  r2.y = saturate(dot(-r19.xyz, r5.xyz));
  r19.xyz = v5.xyz * r2.xxx + float3(0,-0.300000012,0);
  r2.x = dot(r19.xyz, r19.xyz);
  r2.x = rsqrt(r2.x);
  r19.xyz = r19.xyz * r2.xxx;
  r2.x = saturate(dot(-r19.xyz, r5.xyz));
  r19.x = log2(r2.y);
  r19.y = log2(r2.x);
  r2.xy = cb7[10].ww * r19.xy;
  r2.xy = exp2(r2.xy);
  r2.w = cb3[11].x + cb3[11].x;
  r19.xyz = cb3[0].xyz * r2.xxx;
  r20.xyz = cb3[1].xyz * r2.yyy;
  r20.xyz = r20.xyz * r2.www;
  r2.xzw = r20.xyz * r2.zzz;
  r2.xzw = r19.xyz * r7.xzw + r2.xzw;
  r21.xyz = cb6[1].xyz * cb7[10].xyz;
  r2.xzw = r21.xyz * r2.xzw;
  r22.xyz = r15.xyz * r2.yyy;
  r22.xyz = r22.xyz * r10.xyz;
  r2.xzw = r2.xzw * r9.xyw + r22.xyz;
  r12.xyz = r12.xyz * r7.yyy + r11.xyz;
  r22.xyz = r12.www * r7.yyy + r2.xzw;
  r11.xyz = r8.www ? r12.xyz : r11.xyz;
  r2.xzw = r8.www ? r22.xyz : r2.xzw;
  r12.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r2.xzw = r12.xxx ? float3(0,0,0) : r2.xzw;
  r8.yzw = r11.xyz * r0.xyz;
  r2.xzw = r2.xzw * r1.xyz;
  r4.xyz = r4.xyz * r1.www + float3(1,1,1);
  r4.xyz = saturate(float3(0.5,0.5,0.5) * r4.xyz);
  r4.xyz = cb9[11].yyy * r4.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r4.xyz;
  r1.xyz = cb9[11].zzz * r1.xyz;
  r0.xyz = r1.xyz * r21.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r7.xzw + r0.xyz;
  r0.xyz = cb9[12].yyy * r9.xyw + r0.xyz;
  r0.xyz = cb9[12].zzz * r10.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r18.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r21.xyz + r0.xyz;
  r1.x = dot(-r6.xyz, r5.xyz);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r13.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r18.xyz;
  r0.xyz = r1.xyz * r16.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r18.xyz;
  r0.xyz = r1.xyz * r17.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r14.xyz + r0.xyz;
  r1.xyz = cb9[15].xxx * r21.xyz;
  r0.xyz = r1.xyz * r19.xyz + r0.xyz;
  r1.xyz = cb9[15].yyy * r21.xyz;
  r1.xyz = r1.xyz * r20.xyz;
  r0.xyz = r1.xyz * r2.yyy + r0.xyz;
  r1.xyz = cb9[15].zzz * r15.xyz;
  r0.xyz = r1.xyz * r2.yyy + r0.xyz;
  r0.xyz = r12.yyy ? r0.xyz : r8.yzw;
  r1.xyz = r12.yyy ? float3(0,0,0) : r2.xzw;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r3.xyz * r3.www + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r2.xyz + r2.xyz;
  r5.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.xyz * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r4.xyz * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r5.xyz / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MarkerFunction2(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r12.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r12.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r12.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r8.xxxx ? r1.xyzw : r0.xyzw;
  return;
}