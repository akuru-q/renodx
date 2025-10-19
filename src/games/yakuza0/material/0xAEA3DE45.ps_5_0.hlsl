#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:29:02 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s3_s : register(s3);

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
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r1.xyzw = t3.Sample(s3_s, r1.xy).xyzw;
  r2.xy = t7.Sample(s7_s, v0.zw).xy;
  r2.z = dot(v3.xyz, v3.xyz);
  r2.z = rsqrt(r2.z);
  r3.xyz = v3.xyz * r2.zzz;
  r2.w = dot(v4.xyz, v4.xyz);
  r2.w = rsqrt(r2.w);
  r4.xyz = v4.xyz * r2.www;
  r3.w = dot(r3.xyz, -cb3[6].xyz);
  r5.xy = cb12[29].zw * v7.xy;
  r6.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r7.xyz = t13.Sample(s13_s, r5.xy).xyw;
  } else {
    r7.xyz = float3(1,1,1);
  }
  r5.zw = r7.xy * cb1[9].xz + cb1[9].yw;
  r5.zw = r6.xx ? r5.zw : r7.xy;
  r2.y = r2.y * cb1[10].x + cb1[10].y;
  r2.y = r2.x * r2.y;
  r8.xyz = -cb3[5].xyz + float3(1,1,1);
  r9.xyz = r2.yyy * r8.xyz + cb3[5].xyz;
  r10.xyzw = t14.Sample(s14_s, r5.xy).xyzw;
  r11.xyzw = r10.xyzw + r10.xyzw;
  r10.xyzw = r10.xyzw / cb1[0].zzzz;
  r10.xyzw = r6.zzzz ? r11.xyzw : r10.xyzw;
  r10.xyzw = r6.yyyy ? r11.xyzw : r10.xyzw;
  r5.xy = r5.zw * cb1[9].xz + cb1[9].yw;
  r5.xy = r6.xx ? r5.xy : r7.xy;
  r2.y = r5.x * r5.y;
  r7.xyw = r2.yyy * r8.xyz + cb3[5].xyz;
  r8.xyz = v1.xyz * r9.xyz;
  r8.xyz = r8.xyz * r7.zzz;
  r11.xyz = r7.xyw * r9.xyz;
  r12.xyz = r7.xyw * cb1[11].xxx + cb1[11].yyy;
  r13.xyz = r9.xyz * cb1[11].zzz + cb1[11].www;
  r12.xyz = r13.xyz * r12.xyz;
  r11.xyz = r6.xxx ? r12.xyz : r11.xyz;
  r11.xyz = r11.xyz * r2.xxx;
  r11.xyz = r11.xyz * r7.zzz;
  r12.xyz = cb6[1].www * cb7[11].xyz;
  r13.xyz = r12.xyz * r0.xyz;
  r14.xyz = r10.xyz * r5.yyy + v5.xyz;
  r15.xyz = r10.www * r5.yyy + v6.xyz;
  r14.xyz = r6.www ? v5.xyz : r14.xyz;
  r15.xyz = r6.www ? v6.xyz : r15.xyz;
  r2.y = saturate(dot(r3.xyz, -cb3[7].xyz));
  r4.w = saturate(r3.w);
  r16.xyz = cb3[0].xyz * r4.www;
  r17.xyz = cb3[1].xyz * r2.yyy;
  r18.xyz = cb6[0].xyz * cb7[9].xyz;
  r19.xyz = r17.xyz * r5.yyy;
  r19.xyz = r16.xyz * r7.xyw + r19.xyz;
  r19.xyz = r18.xyz * r19.xyz + cb1[13].xyz;
  r12.xyz = r12.xyz * r0.xyz + r19.xyz;
  r19.xyz = r14.xyz * r11.xyz;
  r12.xyz = r12.xyz * r8.xyz + r19.xyz;
  r19.xyz = v4.xyz * r2.www + cb3[6].xyz;
  r4.w = dot(r19.xyz, r19.xyz);
  r4.w = rsqrt(r4.w);
  r19.xyz = r19.xyz * r4.www;
  r4.w = saturate(dot(-r19.xyz, r3.xyz));
  r19.xyz = v4.xyz * r2.www + float3(0,-0.300000012,0);
  r2.w = dot(r19.xyz, r19.xyz);
  r2.w = rsqrt(r2.w);
  r19.xyz = r19.xyz * r2.www;
  r2.w = saturate(dot(-r19.xyz, r3.xyz));
  r19.x = log2(r4.w);
  r19.y = log2(r2.w);
  r6.yz = cb7[10].ww * r19.xy;
  r6.yz = exp2(r6.yz);
  r2.w = cb3[11].x + cb3[11].x;
  r19.xyz = cb3[0].xyz * r6.yyy;
  r20.xyz = cb3[1].xyz * r6.zzz;
  r20.xyz = r20.xyz * r2.www;
  r21.xyz = r20.xyz * r2.yyy;
  r21.xyz = r19.xyz * r7.xyw + r21.xyz;
  r22.xyz = cb6[1].xyz * cb7[10].xyz;
  r21.xyz = r22.xyz * r21.xyz;
  r23.xyz = r15.xyz * r6.zzz;
  r23.xyz = r23.xyz * r11.xyz;
  r21.xyz = r21.xyz * r8.xyz + r23.xyz;
  r10.xyz = r10.xyz * r5.yyy + r12.xyz;
  r23.xyz = r10.www * r5.yyy + r21.xyz;
  r10.xyz = r6.www ? r10.xyz : r12.xyz;
  r12.xyz = r6.www ? r23.xyz : r21.xyz;
  r21.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r12.xyz = r21.xxx ? float3(0,0,0) : r12.xyz;
  r10.xyz = r10.xyz * r0.xyz;
  r12.xyz = r12.xyz * r1.xyz;
  r2.yzw = v3.xyz * r2.zzz + float3(1,1,1);
  r2.yzw = saturate(float3(0.5,0.5,0.5) * r2.yzw);
  r2.yzw = cb9[11].yyy * r2.yzw;
  r0.xyz = cb9[11].xxx * r0.xyz + r2.yzw;
  r2.yzw = cb9[11].zzz * r1.xyz;
  r0.xyz = r2.yzw * r22.xyz + r0.xyz;
  r2.y = cb9[11].w * cb7[10].w;
  r0.xyz = r2.yyy * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r7.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r8.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r11.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r18.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r22.xyz + r0.xyz;
  r2.y = dot(-r4.xyz, r3.xyz);
  r2.y = 1 + -r2.y;
  r2.z = r2.y * r2.y;
  r2.z = r2.z * r2.z;
  r2.y = r2.z * r2.y;
  r2.y = r2.y * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r2.yyy + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r13.xyz + r0.xyz;
  r2.yzw = cb9[14].yyy * r18.xyz;
  r0.xyz = r2.yzw * r16.xyz + r0.xyz;
  r2.yzw = cb9[14].zzz * r18.xyz;
  r0.xyz = r2.yzw * r17.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r14.xyz + r0.xyz;
  r2.yzw = cb9[15].xxx * r22.xyz;
  r0.xyz = r2.yzw * r19.xyz + r0.xyz;
  r2.yzw = cb9[15].yyy * r22.xyz;
  r2.yzw = r2.yzw * r20.xyz;
  r0.xyz = r2.yzw * r6.zzz + r0.xyz;
  r2.yzw = cb9[15].zzz * r15.xyz;
  r0.xyz = r2.yzw * r6.zzz + r0.xyz;
  r0.xyz = r21.yyy ? r0.xyz : r10.xyz;
  r2.yzw = r21.yyy ? float3(0,0,0) : r12.xyz;
  r0.xyz = r2.yzw + r0.xyz;
  r1.w = v3.w * r1.w;
  r2.xyz = r9.xyz * r2.xxx;
  r2.w = dot(r4.xyz, r3.xyz);
  r2.w = r2.w + r2.w;
  r3.xyz = r3.xyz * -r2.www + r4.xyz;
  r3.xyz = float3(-1,1,1) * r3.xyz;
  r4.xyzw = t6.Sample(s6_s, r3.xyz).xyzw;
  r2.w = r5.z * r5.w;
  r3.x = saturate(0.75 + r3.w);
  r2.w = r3.x * r2.w;
  r2.w = max(cb3[11].y, r2.w);
  r3.x = max(0.00392156886, r4.w);
  r3.x = 0.25 / r3.x;
  r3.xyz = r4.xyz * r3.xxx;
  r3.xyz = r3.xyz * r3.xyz;
  r3.xyz = r3.xyz * r1.www;
  r2.xyz = r3.xyz * r2.xyz;
  r2.xyz = r2.xyz * r2.www;
  r0.xyz = r2.xyz * r1.xyz + r0.xyz;
  r0.w = v1.w * r0.w;
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
  r0.xyz = r21.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r21.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v2.xyz + r0.xyz;
  r0.w = saturate(v2.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r21.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r6.xxxx ? r1.xyzw : r0.xyzw;
  return;
}