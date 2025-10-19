#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:56 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

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
  float4 v0 : TEXCOORD0,
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r2.xyzw = t3.Sample(s3_s, r1.xy).xyzw;
  r1.xy = t5.Sample(s5_s, r1.zw).xy;
  r1.zw = t7.Sample(s7_s, v0.zw).xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r3.x = dot(r1.xy, r1.xy);
  r3.x = 1 + -r3.x;
  r3.x = max(0, r3.x);
  r3.x = sqrt(r3.x);
  r3.yzw = v7.yzx * v3.zxy;
  r3.yzw = v3.yzx * v7.zxy + -r3.yzw;
  r3.yzw = v7.www * r3.yzw;
  r4.xyz = v7.xyz * r1.xxx;
  r3.yzw = r1.yyy * r3.yzw + r4.xyz;
  r3.xyz = r3.xxx * v3.xyz + r3.yzw;
  r1.x = dot(r3.xyz, r3.xyz);
  r1.x = rsqrt(r1.x);
  r4.xyz = r3.xyz * r1.xxx;
  r1.y = dot(v4.xyz, v4.xyz);
  r1.y = rsqrt(r1.y);
  r5.xyz = v4.xyz * r1.yyy;
  r3.w = dot(r4.xyz, -cb3[6].xyz);
  r6.xy = cb12[29].zw * v8.xy;
  r7.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r7.x != 0) {
    r8.xyz = t13.Sample(s13_s, r6.xy).xyw;
  } else {
    r8.xyz = float3(1,1,1);
  }
  r6.zw = r8.xy * cb1[9].xz + cb1[9].yw;
  r6.zw = r7.xx ? r6.zw : r8.xy;
  r1.w = r1.w * cb1[10].x + cb1[10].y;
  r1.w = r1.z * r1.w;
  r9.xyz = -cb3[5].xyz + float3(1,1,1);
  r10.xyz = r1.www * r9.xyz + cb3[5].xyz;
  r11.xyzw = t14.Sample(s14_s, r6.xy).xyzw;
  r12.xyzw = r11.xyzw + r11.xyzw;
  r11.xyzw = r11.xyzw / cb1[0].zzzz;
  r11.xyzw = r7.zzzz ? r12.xyzw : r11.xyzw;
  r11.xyzw = r7.yyyy ? r12.xyzw : r11.xyzw;
  r6.xy = r6.zw * cb1[9].xz + cb1[9].yw;
  r6.xy = r7.xx ? r6.xy : r8.xy;
  r1.w = r6.x * r6.y;
  r8.xyw = r1.www * r9.xyz + cb3[5].xyz;
  r9.xyz = v1.xyz * r10.xyz;
  r9.xyz = r9.xyz * r8.zzz;
  r12.xyz = r8.xyw * r10.xyz;
  r13.xyz = r8.xyw * cb1[11].xxx + cb1[11].yyy;
  r14.xyz = r10.xyz * cb1[11].zzz + cb1[11].www;
  r13.xyz = r14.xyz * r13.xyz;
  r12.xyz = r7.xxx ? r13.xyz : r12.xyz;
  r12.xyz = r12.xyz * r1.zzz;
  r12.xyz = r12.xyz * r8.zzz;
  r13.xyz = cb6[1].www * cb7[11].xyz;
  r14.xyz = r13.xyz * r0.xyz;
  r15.xyz = r11.xyz * r6.yyy + v5.xyz;
  r16.xyz = r11.www * r6.yyy + v6.xyz;
  r15.xyz = r7.www ? v5.xyz : r15.xyz;
  r16.xyz = r7.www ? v6.xyz : r16.xyz;
  r1.w = saturate(dot(r4.xyz, -cb3[7].xyz));
  r4.w = saturate(r3.w);
  r17.xyz = cb3[0].xyz * r4.www;
  r18.xyz = cb3[1].xyz * r1.www;
  r19.xyz = cb6[0].xyz * cb7[9].xyz;
  r20.xyz = r18.xyz * r6.yyy;
  r20.xyz = r17.xyz * r8.xyw + r20.xyz;
  r20.xyz = r19.xyz * r20.xyz + cb1[13].xyz;
  r13.xyz = r13.xyz * r0.xyz + r20.xyz;
  r20.xyz = r15.xyz * r12.xyz;
  r13.xyz = r13.xyz * r9.xyz + r20.xyz;
  r20.xyz = v4.xyz * r1.yyy + cb3[6].xyz;
  r4.w = dot(r20.xyz, r20.xyz);
  r4.w = rsqrt(r4.w);
  r20.xyz = r20.xyz * r4.www;
  r4.w = saturate(dot(-r20.xyz, r4.xyz));
  r20.xyz = v4.xyz * r1.yyy + float3(0,-0.300000012,0);
  r1.y = dot(r20.xyz, r20.xyz);
  r1.y = rsqrt(r1.y);
  r20.xyz = r20.xyz * r1.yyy;
  r1.y = saturate(dot(-r20.xyz, r4.xyz));
  r20.x = log2(r4.w);
  r20.y = log2(r1.y);
  r7.yz = cb7[10].ww * r20.xy;
  r7.yz = exp2(r7.yz);
  r1.y = cb3[11].x + cb3[11].x;
  r20.xyz = cb3[0].xyz * r7.yyy;
  r21.xyz = cb3[1].xyz * r7.zzz;
  r21.xyz = r21.xyz * r1.yyy;
  r22.xyz = r21.xyz * r1.www;
  r22.xyz = r20.xyz * r8.xyw + r22.xyz;
  r23.xyz = cb6[1].xyz * cb7[10].xyz;
  r22.xyz = r23.xyz * r22.xyz;
  r24.xyz = r16.xyz * r7.zzz;
  r24.xyz = r24.xyz * r12.xyz;
  r22.xyz = r22.xyz * r9.xyz + r24.xyz;
  r11.xyz = r11.xyz * r6.yyy + r13.xyz;
  r24.xyz = r11.www * r6.yyy + r22.xyz;
  r11.xyz = r7.www ? r11.xyz : r13.xyz;
  r13.xyz = r7.www ? r24.xyz : r22.xyz;
  r22.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r13.xyz = r22.xxx ? float3(0,0,0) : r13.xyz;
  r11.xyz = r11.xyz * r0.xyz;
  r13.xyz = r13.xyz * r2.xyz;
  r1.xyw = r3.xyz * r1.xxx + float3(1,1,1);
  r1.xyw = saturate(float3(0.5,0.5,0.5) * r1.xyw);
  r1.xyw = cb9[11].yyy * r1.xyw;
  r0.xyz = cb9[11].xxx * r0.xyz + r1.xyw;
  r1.xyw = cb9[11].zzz * r2.xyz;
  r0.xyz = r1.xyw * r23.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r8.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r9.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r12.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r19.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r23.xyz + r0.xyz;
  r1.x = dot(-r5.xyz, r4.xyz);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r14.xyz + r0.xyz;
  r1.xyw = cb9[14].yyy * r19.xyz;
  r0.xyz = r1.xyw * r17.xyz + r0.xyz;
  r1.xyw = cb9[14].zzz * r19.xyz;
  r0.xyz = r1.xyw * r18.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r15.xyz + r0.xyz;
  r1.xyw = cb9[15].xxx * r23.xyz;
  r0.xyz = r1.xyw * r20.xyz + r0.xyz;
  r1.xyw = cb9[15].yyy * r23.xyz;
  r1.xyw = r1.xyw * r21.xyz;
  r0.xyz = r1.xyw * r7.zzz + r0.xyz;
  r1.xyw = cb9[15].zzz * r16.xyz;
  r0.xyz = r1.xyw * r7.zzz + r0.xyz;
  r0.xyz = r22.yyy ? r0.xyz : r11.xyz;
  r1.xyw = r22.yyy ? float3(0,0,0) : r13.xyz;
  r0.xyz = r1.xyw + r0.xyz;
  r2.w = v3.w * r2.w;
  r3.xyz = r10.xyz * r1.zzz;
  r1.z = dot(r5.xyz, r4.xyz);
  r1.z = r1.z + r1.z;
  r4.xyz = r4.xyz * -r1.zzz + r5.xyz;
  r4.xyz = float3(-1,1,1) * r4.xyz;
  r4.xyzw = t6.Sample(s6_s, r4.xyz).xyzw;
  r1.z = r6.z * r6.w;
  r3.w = saturate(0.75 + r3.w);
  r1.z = r3.w * r1.z;
  r1.z = max(cb3[11].y, r1.z);
  r3.w = max(0.00392156886, r4.w);
  r3.w = 0.25 / r3.w;
  r4.xyz = r4.xyz * r3.www;
  r4.xyz = r4.xyz * r4.xyz;
  r4.xyz = r4.xyz * r2.www;
  r3.xyz = r4.xyz * r3.xyz;
  r3.xyz = r3.xyz * r1.zzz;
  r0.xyz = r3.xyz * r2.xyz + r0.xyz;
  r0.w = v1.w * r0.w;
  r1.z = cb5[1].w * cb7[9].w;
  r1.z = cb6[0].w * r1.z;
  r1.xyw = r3.xyz * float3(4,4,4) + r1.xyw;
  r1.x = dot(r1.xyw, float3(0.330000013,0.330000013,0.330000013));
  r1.w = r0.w * r1.z + r1.x;
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
  r0.xyz = r22.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r22.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v2.xyz + r0.xyz;
  r0.w = saturate(v2.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r22.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.xxxx ? r1.xyzw : r0.xyzw;
  return;
}