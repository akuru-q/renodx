#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:29:06 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r1.xy = t3.Sample(s3_s, r1.xy).xy;
  r2.xyz = t1.Sample(s1_s, v0.zw).xyz;
  r1.zw = t7.Sample(s7_s, v1.xy).xy;
  r2.xyz = -r2.xyz * r2.xyz + float3(1,1,1);
  r2.xyz = -r2.xyz * v3.www + float3(1,1,1);
  r0.xyz = r2.xyz * r0.xyz;
  r2.x = dot(v4.xyz, v4.xyz);
  r2.x = rsqrt(r2.x);
  r2.yzw = v4.xyz * r2.xxx;
  r3.x = dot(v5.xyz, v5.xyz);
  r3.x = rsqrt(r3.x);
  r3.yzw = v5.xyz * r3.xxx;
  r4.x = dot(r2.yzw, -cb3[6].xyz);
  r4.yz = cb12[29].zw * v8.xy;
  r5.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r6.xyz = t13.Sample(s13_s, r4.yz).xyw;
  } else {
    r6.xyz = float3(1,1,1);
  }
  r7.xy = r6.xy * cb1[9].xz + cb1[9].yw;
  r7.xy = r5.xx ? r7.xy : r6.xy;
  r1.w = r1.w * cb1[10].x + cb1[10].y;
  r1.w = r1.z * r1.w;
  r8.xyz = -cb3[5].xyz + float3(1,1,1);
  r9.xyz = r1.www * r8.xyz + cb3[5].xyz;
  r10.xyzw = t14.Sample(s14_s, r4.yz).xyzw;
  r11.xyzw = r10.xyzw + r10.xyzw;
  r10.xyzw = r10.xyzw / cb1[0].zzzz;
  r10.xyzw = r5.zzzz ? r11.xyzw : r10.xyzw;
  r10.xyzw = r5.yyyy ? r11.xyzw : r10.xyzw;
  r4.yz = r7.xy * cb1[9].xz + cb1[9].yw;
  r4.yz = r5.xx ? r4.yz : r6.xy;
  r1.w = r4.y * r4.z;
  r6.xyw = r1.www * r8.xyz + cb3[5].xyz;
  r8.xyz = v2.xyz * r9.xyz;
  r8.xyz = r8.xyz * r6.zzz;
  r11.xyz = r6.xyw * r9.xyz;
  r12.xyz = r6.xyw * cb1[11].xxx + cb1[11].yyy;
  r13.xyz = r9.xyz * cb1[11].zzz + cb1[11].www;
  r12.xyz = r13.xyz * r12.xyz;
  r11.xyz = r5.xxx ? r12.xyz : r11.xyz;
  r11.xyz = r11.xyz * r1.zzz;
  r11.xyz = r11.xyz * r6.zzz;
  r12.xyz = cb6[1].www * cb7[11].xyz;
  r13.xyz = r12.xyz * r0.xyz;
  r14.xyz = r10.xyz * r4.zzz + v6.xyz;
  r15.xyz = r10.www * r4.zzz + v7.xyz;
  r14.xyz = r5.www ? v6.xyz : r14.xyz;
  r15.xyz = r5.www ? v7.xyz : r15.xyz;
  r1.w = saturate(dot(r2.yzw, -cb3[7].xyz));
  r4.y = saturate(r4.x);
  r16.xyz = cb3[0].xyz * r4.yyy;
  r17.xyz = cb3[1].xyz * r1.www;
  r18.xyz = cb6[0].xyz * cb7[9].xyz;
  r19.xyz = r17.xyz * r4.zzz;
  r19.xyz = r16.xyz * r6.xyw + r19.xyz;
  r19.xyz = r18.xyz * r19.xyz + cb1[13].xyz;
  r12.xyz = r12.xyz * r0.xyz + r19.xyz;
  r19.xyz = r14.xyz * r11.xyz;
  r12.xyz = r12.xyz * r8.xyz + r19.xyz;
  r19.xyz = v5.xyz * r3.xxx + cb3[6].xyz;
  r4.y = dot(r19.xyz, r19.xyz);
  r4.y = rsqrt(r4.y);
  r19.xyz = r19.xyz * r4.yyy;
  r4.y = saturate(dot(-r19.xyz, r2.yzw));
  r19.xyz = v5.xyz * r3.xxx + float3(0,-0.300000012,0);
  r3.x = dot(r19.xyz, r19.xyz);
  r3.x = rsqrt(r3.x);
  r19.xyz = r19.xyz * r3.xxx;
  r3.x = saturate(dot(-r19.xyz, r2.yzw));
  r19.x = log2(r4.y);
  r19.y = log2(r3.x);
  r4.yw = cb7[10].ww * r19.xy;
  r4.yw = exp2(r4.yw);
  r3.x = cb3[11].x + cb3[11].x;
  r19.xyz = cb3[0].xyz * r4.yyy;
  r20.xyz = cb3[1].xyz * r4.www;
  r20.xyz = r20.xyz * r3.xxx;
  r21.xyz = r20.xyz * r1.www;
  r21.xyz = r19.xyz * r6.xyw + r21.xyz;
  r22.xyz = cb6[1].xyz * cb7[10].xyz;
  r21.xyz = r22.xyz * r21.xyz;
  r23.xyz = r15.xyz * r4.www;
  r23.xyz = r23.xyz * r11.xyz;
  r21.xyz = r21.xyz * r8.xyz + r23.xyz;
  r10.xyz = r10.xyz * r4.zzz + r12.xyz;
  r23.xyz = r10.www * r4.zzz + r21.xyz;
  r10.xyz = r5.www ? r10.xyz : r12.xyz;
  r5.yzw = r5.www ? r23.xyz : r21.xyz;
  r12.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r5.yzw = r12.xxx ? float3(0,0,0) : r5.yzw;
  r10.xyz = r10.xyz * r0.xyz;
  r5.yzw = r5.yzw * r1.yyy;
  r21.xyz = v4.xyz * r2.xxx + float3(1,1,1);
  r21.xyz = saturate(float3(0.5,0.5,0.5) * r21.xyz);
  r21.xyz = cb9[11].yyy * r21.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r21.xyz;
  r1.y = cb9[11].z * r1.y;
  r0.xyz = r1.yyy * r22.xyz + r0.xyz;
  r1.y = cb9[11].w * cb7[10].w;
  r0.xyz = r1.yyy * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r6.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r8.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r11.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r18.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r22.xyz + r0.xyz;
  r1.y = dot(-r3.yzw, r2.yzw);
  r1.y = 1 + -r1.y;
  r1.w = r1.y * r1.y;
  r1.w = r1.w * r1.w;
  r1.y = r1.w * r1.y;
  r1.y = r1.y * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.yyy + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r13.xyz + r0.xyz;
  r6.xyz = cb9[14].yyy * r18.xyz;
  r0.xyz = r6.xyz * r16.xyz + r0.xyz;
  r6.xyz = cb9[14].zzz * r18.xyz;
  r0.xyz = r6.xyz * r17.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r14.xyz + r0.xyz;
  r6.xyz = cb9[15].xxx * r22.xyz;
  r0.xyz = r6.xyz * r19.xyz + r0.xyz;
  r6.xyz = cb9[15].yyy * r22.xyz;
  r6.xyz = r6.xyz * r20.xyz;
  r0.xyz = r6.xyz * r4.www + r0.xyz;
  r6.xyz = cb9[15].zzz * r15.xyz;
  r0.xyz = r6.xyz * r4.www + r0.xyz;
  r0.xyz = r12.yyy ? r0.xyz : r10.xyz;
  r4.yzw = r12.yyy ? float3(0,0,0) : r5.yzw;
  r0.xyz = r4.yzw + r0.xyz;
  r1.x = v4.w * r1.x;
  r1.yzw = r9.xyz * r1.zzz;
  r2.x = dot(r3.yzw, r2.yzw);
  r2.x = r2.x + r2.x;
  r2.xyz = r2.yzw * -r2.xxx + r3.yzw;
  r2.xyz = float3(-1,1,1) * r2.xyz;
  r2.xyzw = t6.Sample(s6_s, r2.xyz).xyzw;
  r3.x = r7.x * r7.y;
  r3.y = saturate(0.75 + r4.x);
  r3.x = r3.x * r3.y;
  r3.x = max(cb3[11].y, r3.x);
  r2.w = max(0.00392156886, r2.w);
  r2.w = 0.25 / r2.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = r2.xyz * r2.xyz;
  r2.xyz = r2.xyz * r1.xxx;
  r1.xyz = r2.xyz * r1.yzw;
  r0.xyz = r1.xyz * r3.xxx + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r2.xyz + r2.xyz;
  r5.yzw = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.yzw = r4.xyz * r5.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r4.xyz * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r5.yzw / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MaterialPostTonemap(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r12.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r12.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r12.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r5.xxxx ? r1.xyzw : r0.xyzw;
  return;
}