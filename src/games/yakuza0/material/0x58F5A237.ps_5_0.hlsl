#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:56 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r1.x = t3.Sample(s3_s, r1.xy).y;
  r1.y = dot(v3.xyz, v3.xyz);
  r1.y = rsqrt(r1.y);
  r2.xyz = v3.xyz * r1.yyy;
  r1.z = dot(v4.xyz, v4.xyz);
  r1.z = rsqrt(r1.z);
  r3.xyz = v4.xyz * r1.zzz;
  r1.w = saturate(dot(r2.xyz, -cb3[6].xyz));
  r4.xy = cb12[29].zw * v7.xy;
  r5.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r6.xyz = t13.Sample(s13_s, r4.xy).xyw;
  } else {
    r6.xyz = float3(1,1,1);
  }
  r4.zw = r6.xy * cb1[9].xz + cb1[9].yw;
  r4.zw = r5.xx ? r4.zw : r6.xy;
  r7.xyz = -cb3[5].xyz + float3(1,1,1);
  r8.xyzw = t14.Sample(s14_s, r4.xy).xyzw;
  r9.xyzw = r8.xyzw + r8.xyzw;
  r8.xyzw = r8.xyzw / cb1[0].zzzz;
  r8.xyzw = r5.zzzz ? r9.xyzw : r8.xyzw;
  r8.xyzw = r5.yyyy ? r9.xyzw : r8.xyzw;
  r4.xy = r4.zw * cb1[9].xz + cb1[9].yw;
  r4.xy = r5.xx ? r4.xy : r6.xy;
  r2.w = r4.x * r4.y;
  r4.xzw = r2.www * r7.xyz + cb3[5].xyz;
  r6.xyw = v1.xyz * r6.zzz;
  r7.xyz = r4.xzw * cb1[11].xxx + cb1[11].yyy;
  r2.w = cb1[11].z + cb1[11].w;
  r7.xyz = r7.xyz * r2.www;
  r7.xyz = r5.xxx ? r7.xyz : r4.xzw;
  r7.xyz = r7.xyz * r6.zzz;
  r9.xyz = cb6[1].www * cb7[11].xyz;
  r10.xyz = r9.xyz * r0.xyz;
  r11.xyz = r8.xyz * r4.yyy + v5.xyz;
  r12.xyz = r8.www * r4.yyy + v6.xyz;
  r11.xyz = r5.www ? v5.xyz : r11.xyz;
  r12.xyz = r5.www ? v6.xyz : r12.xyz;
  r2.w = saturate(dot(r2.xyz, -cb3[7].xyz));
  r13.xyz = cb3[0].xyz * r1.www;
  r14.xyz = cb3[1].xyz * r2.www;
  r15.xyz = cb6[0].xyz * cb7[9].xyz;
  r16.xyz = r14.xyz * r4.yyy;
  r16.xyz = r13.xyz * r4.xzw + r16.xyz;
  r16.xyz = r15.xyz * r16.xyz + cb1[13].xyz;
  r9.xyz = r9.xyz * r0.xyz + r16.xyz;
  r16.xyz = r11.xyz * r7.xyz;
  r9.xyz = r9.xyz * r6.xyw + r16.xyz;
  r16.xyz = v4.xyz * r1.zzz + cb3[6].xyz;
  r1.w = dot(r16.xyz, r16.xyz);
  r1.w = rsqrt(r1.w);
  r16.xyz = r16.xyz * r1.www;
  r1.w = saturate(dot(-r16.xyz, r2.xyz));
  r16.xyz = v4.xyz * r1.zzz + float3(0,-0.300000012,0);
  r1.z = dot(r16.xyz, r16.xyz);
  r1.z = rsqrt(r1.z);
  r16.xyz = r16.xyz * r1.zzz;
  r1.z = saturate(dot(-r16.xyz, r2.xyz));
  r16.x = log2(r1.w);
  r16.y = log2(r1.z);
  r1.zw = cb7[10].ww * r16.xy;
  r1.zw = exp2(r1.zw);
  r3.w = cb3[11].x + cb3[11].x;
  r16.xyz = cb3[0].xyz * r1.zzz;
  r17.xyz = cb3[1].xyz * r1.www;
  r17.xyz = r17.xyz * r3.www;
  r18.xyz = r17.xyz * r2.www;
  r18.xyz = r16.xyz * r4.xzw + r18.xyz;
  r19.xyz = cb6[1].xyz * cb7[10].xyz;
  r18.xyz = r19.xyz * r18.xyz;
  r20.xyz = r12.xyz * r1.www;
  r20.xyz = r20.xyz * r7.xyz;
  r18.xyz = r18.xyz * r6.xyw + r20.xyz;
  r8.xyz = r8.xyz * r4.yyy + r9.xyz;
  r20.xyz = r8.www * r4.yyy + r18.xyz;
  r8.xyz = r5.www ? r8.xyz : r9.xyz;
  r5.yzw = r5.www ? r20.xyz : r18.xyz;
  r9.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r5.yzw = r9.xxx ? float3(0,0,0) : r5.yzw;
  r8.xyz = r8.xyz * r0.xyz;
  r5.yzw = r5.yzw * r1.xxx;
  r18.xyz = v3.xyz * r1.yyy + float3(1,1,1);
  r18.xyz = saturate(float3(0.5,0.5,0.5) * r18.xyz);
  r18.xyz = cb9[11].yyy * r18.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r18.xyz;
  r1.x = cb9[11].z * r1.x;
  r0.xyz = r1.xxx * r19.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r4.xzw + r0.xyz;
  r0.xyz = cb9[12].yyy * r6.xyw + r0.xyz;
  r0.xyz = cb9[12].zzz * r7.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r15.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r19.xyz + r0.xyz;
  r1.x = dot(-r3.xyz, r2.xyz);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r10.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r15.xyz;
  r0.xyz = r1.xyz * r13.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r15.xyz;
  r0.xyz = r1.xyz * r14.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r11.xyz + r0.xyz;
  r1.xyz = cb9[15].xxx * r19.xyz;
  r0.xyz = r1.xyz * r16.xyz + r0.xyz;
  r1.xyz = cb9[15].yyy * r19.xyz;
  r1.xyz = r1.xyz * r17.xyz;
  r0.xyz = r1.xyz * r1.www + r0.xyz;
  r1.xyz = cb9[15].zzz * r12.xyz;
  r0.xyz = r1.xyz * r1.www + r0.xyz;
  r0.xyz = r9.yyy ? r0.xyz : r8.xyz;
  r1.xyz = r9.yyy ? float3(0,0,0) : r5.yzw;
  r0.xyz = r1.xyz + r0.xyz;
  r0.w = v1.w * r0.w;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r2.w = r1.x * r0.w;
  r1.yzw = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r1.yzw, cb1[0].x);

  r3.xyz = log2(r1.yzw);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r1.yzw + r1.yzw;
  r5.yzw = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.yzw = r4.xyz * r5.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.yzw = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.yzw = r4.xyz * r1.yzw + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.yzw = r5.yzw / r1.yzw;
  r1.yzw = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.yzw;
  r1.yzw = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.yzw);

  MaterialPostTonemap(r1.yzw);

  r1.yzw = sqrt(r1.yzw);
  r0.xyz = r9.yyy ? r0.xyz : r1.yzw;
  r0.xyz = r9.zzz ? r3.xyz : r0.xyz;
  r1.yzw = v2.xyz + r0.xyz;
  r3.x = saturate(v2.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r2.xyz = r9.www ? r1.yzw : r0.xyz;
  r0.x = r0.w * r1.x + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r5.xxxx ? r2.xyzw : r0.xyzw;
  return;
}