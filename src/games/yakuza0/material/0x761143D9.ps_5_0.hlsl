#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:58 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

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
  float4 v7 : TEXCOORD5,
  float4 v8 : TEXCOORD6,
  float4 v9 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r1.xy = t3.Sample(s3_s, r1.xy).xy;
  r1.zw = t5.Sample(s5_s, r1.zw).xy;
  r2.xyz = t1.Sample(s1_s, v0.zw).xyz;
  r2.w = t2.Sample(s2_s, v1.xy).y;
  r1.zw = r1.zw * float2(2,2) + float2(-1,-1);
  r3.x = dot(r1.zw, r1.zw);
  r3.x = 1 + -r3.x;
  r3.x = max(0, r3.x);
  r3.x = sqrt(r3.x);
  r3.yzw = v8.yzx * v4.zxy;
  r3.yzw = v4.yzx * v8.zxy + -r3.yzw;
  r3.yzw = v8.www * r3.yzw;
  r4.xyz = v8.xyz * r1.zzz;
  r3.yzw = r1.www * r3.yzw + r4.xyz;
  r3.xyz = r3.xxx * v4.xyz + r3.yzw;
  r1.z = dot(r3.xyz, r3.xyz);
  r1.z = rsqrt(r1.z);
  r4.xyz = r3.xyz * r1.zzz;
  r1.w = dot(v5.xyz, v5.xyz);
  r1.w = rsqrt(r1.w);
  r5.xyz = v5.xyz * r1.www;
  r3.w = dot(r4.xyz, -cb3[6].xyz);
  r6.xy = cb12[29].zw * v9.xy;
  r7.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r7.x != 0) {
    r8.xyz = t13.Sample(s13_s, r6.xy).xyw;
  } else {
    r8.xyz = float3(1,1,1);
  }
  r6.zw = r8.xy * cb1[9].xz + cb1[9].yw;
  r6.zw = r7.xx ? r6.zw : r8.xy;
  r9.xyz = -cb3[5].xyz + float3(1,1,1);
  r10.xyzw = t14.Sample(s14_s, r6.xy).xyzw;
  r11.xyzw = r10.xyzw + r10.xyzw;
  r10.xyzw = r10.xyzw / cb1[0].zzzz;
  r10.xyzw = r7.zzzz ? r11.xyzw : r10.xyzw;
  r10.xyzw = r7.yyyy ? r11.xyzw : r10.xyzw;
  r6.xy = r6.zw * cb1[9].xz + cb1[9].yw;
  r6.xy = r7.xx ? r6.xy : r8.xy;
  r4.w = r6.x * r6.y;
  r8.xyw = r4.www * r9.xyz + cb3[5].xyz;
  r9.xyz = v2.xyz * r8.zzz;
  r11.xyz = r8.xyw * cb1[11].xxx + cb1[11].yyy;
  r4.w = cb1[11].z + cb1[11].w;
  r11.xyz = r11.xyz * r4.www;
  r11.xyz = r7.xxx ? r11.xyz : r8.xyw;
  r11.xyz = r11.xyz * r8.zzz;
  r12.xyz = cb6[1].www * cb7[11].xyz;
  r13.xyz = r12.xyz * r0.xyz;
  r14.xyz = r10.xyz * r6.yyy + v6.xyz;
  r15.xyz = r10.www * r6.yyy + v7.xyz;
  r14.xyz = r7.www ? v6.xyz : r14.xyz;
  r15.xyz = r7.www ? v7.xyz : r15.xyz;
  r4.w = saturate(dot(r4.xyz, -cb3[7].xyz));
  r5.w = saturate(r3.w);
  r16.xyz = cb3[0].xyz * r5.www;
  r17.xyz = cb3[1].xyz * r4.www;
  r18.xyz = cb6[0].xyz * cb7[9].xyz;
  r19.xyz = r17.xyz * r6.yyy;
  r19.xyz = r16.xyz * r8.xyw + r19.xyz;
  r19.xyz = r18.xyz * r19.xyz + cb1[13].xyz;
  r12.xyz = r12.xyz * r0.xyz + r19.xyz;
  r19.xyz = r14.xyz * r11.xyz;
  r12.xyz = r12.xyz * r9.xyz + r19.xyz;
  r19.xyz = v5.xyz * r1.www + cb3[6].xyz;
  r5.w = dot(r19.xyz, r19.xyz);
  r5.w = rsqrt(r5.w);
  r19.xyz = r19.xyz * r5.www;
  r5.w = saturate(dot(-r19.xyz, r4.xyz));
  r19.xyz = v5.xyz * r1.www + float3(0,-0.300000012,0);
  r1.w = dot(r19.xyz, r19.xyz);
  r1.w = rsqrt(r1.w);
  r19.xyz = r19.xyz * r1.www;
  r1.w = saturate(dot(-r19.xyz, r4.xyz));
  r19.x = log2(r5.w);
  r19.y = log2(r1.w);
  r7.yz = cb7[10].ww * r19.xy;
  r7.yz = exp2(r7.yz);
  r1.w = cb3[11].x + cb3[11].x;
  r19.xyz = cb3[0].xyz * r7.yyy;
  r20.xyz = cb3[1].xyz * r7.zzz;
  r20.xyz = r20.xyz * r1.www;
  r21.xyz = r20.xyz * r4.www;
  r21.xyz = r19.xyz * r8.xyw + r21.xyz;
  r22.xyz = cb6[1].xyz * cb7[10].xyz;
  r21.xyz = r22.xyz * r21.xyz;
  r23.xyz = r15.xyz * r7.zzz;
  r23.xyz = r23.xyz * r11.xyz;
  r21.xyz = r21.xyz * r9.xyz + r23.xyz;
  r10.xyz = r10.xyz * r6.yyy + r12.xyz;
  r23.xyz = r10.www * r6.yyy + r21.xyz;
  r10.xyz = r7.www ? r10.xyz : r12.xyz;
  r12.xyz = r7.www ? r23.xyz : r21.xyz;
  r21.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r12.xyz = r21.xxx ? float3(0,0,0) : r12.xyz;
  r10.xyz = r10.xyz * r0.xyz;
  r12.xyz = r12.xyz * r1.yyy;
  r3.xyz = r3.xyz * r1.zzz + float3(1,1,1);
  r3.xyz = saturate(float3(0.5,0.5,0.5) * r3.xyz);
  r3.xyz = cb9[11].yyy * r3.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r3.xyz;
  r1.y = cb9[11].z * r1.y;
  r0.xyz = r1.yyy * r22.xyz + r0.xyz;
  r1.y = cb9[11].w * cb7[10].w;
  r0.xyz = r1.yyy * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r8.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r9.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r11.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r18.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r22.xyz + r0.xyz;
  r1.y = dot(-r5.xyz, r4.xyz);
  r1.y = 1 + -r1.y;
  r1.z = r1.y * r1.y;
  r1.z = r1.z * r1.z;
  r1.y = r1.z * r1.y;
  r1.y = r1.y * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.yyy + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r13.xyz + r0.xyz;
  r1.yzw = cb9[14].yyy * r18.xyz;
  r0.xyz = r1.yzw * r16.xyz + r0.xyz;
  r1.yzw = cb9[14].zzz * r18.xyz;
  r0.xyz = r1.yzw * r17.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r14.xyz + r0.xyz;
  r1.yzw = cb9[15].xxx * r22.xyz;
  r0.xyz = r1.yzw * r19.xyz + r0.xyz;
  r1.yzw = cb9[15].yyy * r22.xyz;
  r1.yzw = r1.yzw * r20.xyz;
  r0.xyz = r1.yzw * r7.zzz + r0.xyz;
  r1.yzw = cb9[15].zzz * r15.xyz;
  r0.xyz = r1.yzw * r7.zzz + r0.xyz;
  r0.xyz = r21.yyy ? r0.xyz : r10.xyz;
  r1.yzw = r21.yyy ? float3(0,0,0) : r12.xyz;
  r0.xyz = r1.yzw + r0.xyz;
  r1.x = v4.w * r1.x;
  r1.y = dot(r5.xyz, r4.xyz);
  r1.y = r1.y + r1.y;
  r1.yzw = r4.xyz * -r1.yyy + r5.xyz;
  r1.yzw = float3(-1,1,1) * r1.yzw;
  r4.xyzw = t6.Sample(s6_s, r1.yzw).xyzw;
  r1.y = r6.z * r6.w;
  r1.z = saturate(0.75 + r3.w);
  r1.y = r1.y * r1.z;
  r1.y = max(cb3[11].y, r1.y);
  r1.z = max(0.00392156886, r4.w);
  r1.z = 0.25 / r1.z;
  r3.xyz = r4.xyz * r1.zzz;
  r3.xyz = r3.xyz * r3.xyz;
  r1.xzw = r3.xyz * r1.xxx;
  r0.xyz = r1.xzw * r1.yyy + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
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
  r0.xyz = r21.yyy ? r0.xyz : r3.xyz;
  r0.xyz = r21.zzz ? r4.xyz : r0.xyz;
  r3.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r4.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r4.xyz + r0.xyz;
  r0.xyz = r21.www ? r3.xyz : r0.xyz;
  r1.xyz = r2.xyz * r2.www + r0.xyz;
  r0.x = saturate(cb9[0].w + r2.w);
  r2.xyzw = r1.xyzw * r0.xxxx;
  r0.x = r1.w * r0.x + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r7.xxxx ? r2.xyzw : r0.xyzw;
  return;
}