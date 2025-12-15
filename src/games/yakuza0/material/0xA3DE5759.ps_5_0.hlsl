#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:29:01 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture3D<float4> t12 : register(t12);

Texture2D<float4> t7 : register(t7);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s12_s : register(s12);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = t3.Sample(s3_s, v0.zw).xy;
  r1.zw = t5.Sample(s5_s, v1.xy).xy;
  r2.xy = t7.Sample(s7_s, v1.zw).xy;
  r1.zw = r1.zw * float2(2,2) + float2(-1,-1);
  r2.z = dot(r1.zw, r1.zw);
  r2.z = 1 + -r2.z;
  r2.z = max(0, r2.z);
  r2.z = sqrt(r2.z);
  r3.xyz = v8.yzx * v4.zxy;
  r3.xyz = v4.yzx * v8.zxy + -r3.xyz;
  r3.xyz = v8.www * r3.xyz;
  r4.xyz = v8.xyz * r1.zzz;
  r3.xyz = r1.www * r3.xyz + r4.xyz;
  r3.xyz = r2.zzz * v4.xyz + r3.xyz;
  r1.z = dot(r3.xyz, r3.xyz);
  r1.z = rsqrt(r1.z);
  r4.xyz = r3.xyz * r1.zzz;
  r1.w = dot(v5.xyz, v5.xyz);
  r1.w = rsqrt(r1.w);
  r5.xyz = v5.xyz * r1.www;
  r2.z = dot(r4.xyz, -cb3[6].xyz);
  r6.xy = cb12[29].zw * v9.xy;
  r7.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r7.x != 0) {
    r8.xyz = t13.Sample(s13_s, r6.xy).xyw;
  } else {
    r8.xyz = float3(1,1,1);
  }
  r6.zw = r8.xy * cb1[9].xz + cb1[9].yw;
  r6.zw = r7.xx ? r6.zw : r8.xy;
  r2.y = r2.y * cb1[10].x + cb1[10].y;
  r2.y = r2.x * r2.y;
  r9.xyz = -cb3[5].xyz + float3(1,1,1);
  r10.xyz = r2.yyy * r9.xyz + cb3[5].xyz;
  r11.xyzw = t14.Sample(s14_s, r6.xy).xyzw;
  r12.xyzw = r11.xyzw + r11.xyzw;
  r11.xyzw = r11.xyzw / cb1[0].zzzz;
  r11.xyzw = r7.zzzz ? r12.xyzw : r11.xyzw;
  r11.xyzw = r7.yyyy ? r12.xyzw : r11.xyzw;
  r2.yw = r6.zw * cb1[9].xz + cb1[9].yw;
  r2.yw = r7.xx ? r2.yw : r8.xy;
  r2.y = r2.y * r2.w;
  r8.xyw = r2.yyy * r9.xyz + cb3[5].xyz;
  r9.xyz = v2.xyz * r10.xyz;
  r9.xyz = r9.xyz * r8.zzz;
  r12.xyz = r8.xyw * r10.xyz;
  r13.xyz = r8.xyw * cb1[11].xxx + cb1[11].yyy;
  r14.xyz = r10.xyz * cb1[11].zzz + cb1[11].www;
  r13.xyz = r14.xyz * r13.xyz;
  r12.xyz = r7.xxx ? r13.xyz : r12.xyz;
  r12.xyz = r12.xyz * r2.xxx;
  r12.xyz = r12.xyz * r8.zzz;
  r13.xyz = cb6[1].www * cb7[11].xyz;
  r14.xyz = r13.xyz * r0.xyz;
  r15.xyz = r11.xyz * r2.www + v6.xyz;
  r16.xyz = r11.www * r2.www + v7.xyz;
  r15.xyz = r7.www ? v6.xyz : r15.xyz;
  r16.xyz = r7.www ? v7.xyz : r16.xyz;
  r2.y = saturate(dot(r4.xyz, -cb3[7].xyz));
  r3.w = saturate(r2.z);
  r17.xyz = cb3[0].xyz * r3.www;
  r18.xyz = cb3[1].xyz * r2.yyy;
  r19.xyz = cb6[0].xyz * cb7[9].xyz;
  r20.xyz = r18.xyz * r2.www;
  r20.xyz = r17.xyz * r8.xyw + r20.xyz;
  r20.xyz = r19.xyz * r20.xyz + cb1[13].xyz;
  r13.xyz = r13.xyz * r0.xyz + r20.xyz;
  r20.xyz = r15.xyz * r12.xyz;
  r13.xyz = r13.xyz * r9.xyz + r20.xyz;
  r20.xyz = v5.xyz * r1.www + cb3[6].xyz;
  r3.w = dot(r20.xyz, r20.xyz);
  r3.w = rsqrt(r3.w);
  r20.xyz = r20.xyz * r3.www;
  r3.w = saturate(dot(-r20.xyz, r4.xyz));
  r20.xyz = v5.xyz * r1.www + float3(0,-0.300000012,0);
  r1.w = dot(r20.xyz, r20.xyz);
  r1.w = rsqrt(r1.w);
  r20.xyz = r20.xyz * r1.www;
  r1.w = saturate(dot(-r20.xyz, r4.xyz));
  r6.x = log2(r3.w);
  r6.y = log2(r1.w);
  r6.xy = cb7[10].ww * r6.xy;
  r6.xy = exp2(r6.xy);
  r1.w = cb3[11].x + cb3[11].x;
  r20.xyz = cb3[0].xyz * r6.xxx;
  r21.xyz = cb3[1].xyz * r6.yyy;
  r21.xyz = r21.xyz * r1.www;
  r22.xyz = r21.xyz * r2.yyy;
  r22.xyz = r20.xyz * r8.xyw + r22.xyz;
  r23.xyz = cb6[1].xyz * cb7[10].xyz;
  r22.xyz = r23.xyz * r22.xyz;
  r24.xyz = r16.xyz * r6.yyy;
  r24.xyz = r24.xyz * r12.xyz;
  r22.xyz = r22.xyz * r9.xyz + r24.xyz;
  r11.xyz = r11.xyz * r2.www + r13.xyz;
  r24.xyz = r11.www * r2.www + r22.xyz;
  r11.xyz = r7.www ? r11.xyz : r13.xyz;
  r7.yzw = r7.www ? r24.xyz : r22.xyz;
  r13.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r7.yzw = r13.xxx ? float3(0,0,0) : r7.yzw;
  r11.xyz = r11.xyz * r0.xyz;
  r7.yzw = r7.yzw * r1.yyy;
  r3.xyz = r3.xyz * r1.zzz + float3(1,1,1);
  r3.xyz = saturate(float3(0.5,0.5,0.5) * r3.xyz);
  r3.xyz = cb9[11].yyy * r3.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r3.xyz;
  r1.y = cb9[11].z * r1.y;
  r0.xyz = r1.yyy * r23.xyz + r0.xyz;
  r1.y = cb9[11].w * cb7[10].w;
  r0.xyz = r1.yyy * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r8.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r9.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r12.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r19.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r23.xyz + r0.xyz;
  r1.y = dot(-r5.xyz, r4.xyz);
  r1.y = 1 + -r1.y;
  r1.z = r1.y * r1.y;
  r1.z = r1.z * r1.z;
  r1.y = r1.z * r1.y;
  r1.y = r1.y * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.yyy + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r14.xyz + r0.xyz;
  r1.yzw = cb9[14].yyy * r19.xyz;
  r0.xyz = r1.yzw * r17.xyz + r0.xyz;
  r1.yzw = cb9[14].zzz * r19.xyz;
  r0.xyz = r1.yzw * r18.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r15.xyz + r0.xyz;
  r1.yzw = cb9[15].xxx * r23.xyz;
  r0.xyz = r1.yzw * r20.xyz + r0.xyz;
  r1.yzw = cb9[15].yyy * r23.xyz;
  r1.yzw = r1.yzw * r21.xyz;
  r0.xyz = r1.yzw * r6.yyy + r0.xyz;
  r1.yzw = cb9[15].zzz * r16.xyz;
  r0.xyz = r1.yzw * r6.yyy + r0.xyz;
  r0.xyz = r13.yyy ? r0.xyz : r11.xyz;
  r1.yzw = r13.yyy ? float3(0,0,0) : r7.yzw;
  r0.xyz = r1.yzw + r0.xyz;
  r1.x = v4.w * r1.x;
  r1.yzw = r10.xyz * r2.xxx;
  r3.x = v5.w;
  r3.y = v6.w;
  r3.z = v7.w;
  r2.xyw = cb7[6].xxx * r3.xyz;
  r3.xyzw = t12.Sample(s12_s, r2.xyw).xyzw;
  r3.xyzw = r3.xyzw * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r2.xyw = r3.xyz + -r3.www;
  r2.xyw = r2.xyw * cb7[6].yyy + r4.xyz;
  r3.x = dot(r2.xyw, r2.xyw);
  r3.x = rsqrt(r3.x);
  r2.xyw = r3.xxx * r2.xyw;
  r3.x = dot(r5.xyz, r2.xyw);
  r3.x = r3.x + r3.x;
  r2.xyw = r2.xyw * -r3.xxx + r5.xyz;
  r2.xyw = float3(-1,1,1) * r2.xyw;
  r3.xyzw = t6.Sample(s6_s, r2.xyw).xyzw;
  r2.x = r6.z * r6.w;
  r2.y = saturate(0.75 + r2.z);
  r2.x = r2.x * r2.y;
  r2.x = max(cb3[11].y, r2.x);
  r2.y = max(0.00392156886, r3.w);
  r2.y = 0.25 / r2.y;
  r2.yzw = r3.xyz * r2.yyy;
  r2.yzw = r2.yzw * r2.yzw;
  r2.yzw = r2.yzw * r1.xxx;
  r1.xyz = r2.yzw * r1.yzw;
  r0.xyz = r1.xyz * r2.xxx + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r2.xyz, cb1[0].x);

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

  MaterialPostTonemap(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r13.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r13.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r13.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.xxxx ? r1.xyzw : r0.xyzw;
  return;
}