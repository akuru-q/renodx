#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:58 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s5_s : register(s5);

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
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r2.xyz = t3.Sample(s3_s, r1.xy).xyz;
  r1.xy = t5.Sample(s5_s, r1.zw).xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r1.z = dot(r1.xy, r1.xy);
  r1.z = 1 + -r1.z;
  r1.z = max(0, r1.z);
  r1.z = sqrt(r1.z);
  r3.xyz = v7.yzx * v3.zxy;
  r3.xyz = v3.yzx * v7.zxy + -r3.xyz;
  r3.xyz = v7.www * r3.xyz;
  r4.xyz = v7.xyz * r1.xxx;
  r1.xyw = r1.yyy * r3.xyz + r4.xyz;
  r1.xyz = r1.zzz * v3.xyz + r1.xyw;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = rsqrt(r1.w);
  r3.xyz = r1.xyz * r1.www;
  r2.w = dot(v4.xyz, v4.xyz);
  r2.w = rsqrt(r2.w);
  r4.xyz = v4.xyz * r2.www;
  r3.w = saturate(dot(r3.xyz, -cb3[6].xyz));
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
  r4.w = r5.x * r5.y;
  r5.xzw = r4.www * r8.xyz + cb3[5].xyz;
  r7.xyw = v1.xyz * r7.zzz;
  r8.xyz = r5.xzw * cb1[11].xxx + cb1[11].yyy;
  r4.w = cb1[11].z + cb1[11].w;
  r8.xyz = r8.xyz * r4.www;
  r8.xyz = r6.xxx ? r8.xyz : r5.xzw;
  r8.xyz = r8.xyz * r7.zzz;
  r10.xyz = cb6[1].www * cb7[11].xyz;
  r11.xyz = r10.xyz * r0.xyz;
  r12.xyz = r9.xyz * r5.yyy + v5.xyz;
  r13.xyz = r9.www * r5.yyy + v6.xyz;
  r12.xyz = r6.www ? v5.xyz : r12.xyz;
  r13.xyz = r6.www ? v6.xyz : r13.xyz;
  r4.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r14.xyz = cb3[0].xyz * r3.www;
  r15.xyz = cb3[1].xyz * r4.www;
  r16.xyz = cb6[0].xyz * cb7[9].xyz;
  r17.xyz = r15.xyz * r5.yyy;
  r17.xyz = r14.xyz * r5.xzw + r17.xyz;
  r17.xyz = r16.xyz * r17.xyz + cb1[13].xyz;
  r10.xyz = r10.xyz * r0.xyz + r17.xyz;
  r17.xyz = r12.xyz * r8.xyz;
  r10.xyz = r10.xyz * r7.xyw + r17.xyz;
  r17.xyz = v4.xyz * r2.www + cb3[6].xyz;
  r3.w = dot(r17.xyz, r17.xyz);
  r3.w = rsqrt(r3.w);
  r17.xyz = r17.xyz * r3.www;
  r3.w = saturate(dot(-r17.xyz, r3.xyz));
  r17.xyz = v4.xyz * r2.www + float3(0,-0.300000012,0);
  r2.w = dot(r17.xyz, r17.xyz);
  r2.w = rsqrt(r2.w);
  r17.xyz = r17.xyz * r2.www;
  r2.w = saturate(dot(-r17.xyz, r3.xyz));
  r17.x = log2(r3.w);
  r17.y = log2(r2.w);
  r6.yz = cb7[10].ww * r17.xy;
  r6.yz = exp2(r6.yz);
  r2.w = cb3[11].x + cb3[11].x;
  r17.xyz = cb3[0].xyz * r6.yyy;
  r18.xyz = cb3[1].xyz * r6.zzz;
  r18.xyz = r18.xyz * r2.www;
  r19.xyz = r18.xyz * r4.www;
  r19.xyz = r17.xyz * r5.xzw + r19.xyz;
  r20.xyz = cb6[1].xyz * cb7[10].xyz;
  r19.xyz = r20.xyz * r19.xyz;
  r21.xyz = r13.xyz * r6.zzz;
  r21.xyz = r21.xyz * r8.xyz;
  r19.xyz = r19.xyz * r7.xyw + r21.xyz;
  r9.xyz = r9.xyz * r5.yyy + r10.xyz;
  r21.xyz = r9.www * r5.yyy + r19.xyz;
  r9.xyz = r6.www ? r9.xyz : r10.xyz;
  r10.xyz = r6.www ? r21.xyz : r19.xyz;
  r19.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r10.xyz = r19.xxx ? float3(0,0,0) : r10.xyz;
  r9.xyz = r9.xyz * r0.xyz;
  r10.xyz = r10.xyz * r2.xyz;
  r1.xyz = r1.xyz * r1.www + float3(1,1,1);
  r1.xyz = saturate(float3(0.5,0.5,0.5) * r1.xyz);
  r1.xyz = cb9[11].yyy * r1.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r1.xyz;
  r1.xyz = cb9[11].zzz * r2.xyz;
  r0.xyz = r1.xyz * r20.xyz + r0.xyz;
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
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r11.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r16.xyz;
  r0.xyz = r1.xyz * r14.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r16.xyz;
  r0.xyz = r1.xyz * r15.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r12.xyz + r0.xyz;
  r1.xyz = cb9[15].xxx * r20.xyz;
  r0.xyz = r1.xyz * r17.xyz + r0.xyz;
  r1.xyz = cb9[15].yyy * r20.xyz;
  r1.xyz = r1.xyz * r18.xyz;
  r0.xyz = r1.xyz * r6.zzz + r0.xyz;
  r1.xyz = cb9[15].zzz * r13.xyz;
  r0.xyz = r1.xyz * r6.zzz + r0.xyz;
  r0.xyz = r19.yyy ? r0.xyz : r9.xyz;
  r1.xyz = r19.yyy ? float3(0,0,0) : r10.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.w = v1.w * r0.w;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r2.w = r1.x * r0.w;
  r1.yzw = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r1.yzw, cb1[0].x);

  r3.xyz = log2(r1.yzw);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r1.yzw + r1.yzw;
  r5.xyz = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.xyz * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.yzw = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.yzw = r4.xyz * r1.yzw + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.yzw = r5.xyz / r1.yzw;
  r1.yzw = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.yzw;
  r1.yzw = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.yzw);

  MarkerFunction2(r1.yzw);

  r1.yzw = sqrt(r1.yzw);
  r0.xyz = r19.yyy ? r0.xyz : r1.yzw;
  r0.xyz = r19.zzz ? r3.xyz : r0.xyz;
  r1.yzw = v2.xyz + r0.xyz;
  r3.x = saturate(v2.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r2.xyz = r19.www ? r1.yzw : r0.xyz;
  r0.x = r0.w * r1.x + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r6.xxxx ? r2.xyzw : r0.xyzw;
  return;
}