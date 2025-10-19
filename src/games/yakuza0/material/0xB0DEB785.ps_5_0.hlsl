#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:29:02 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s6_s : register(s6);

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
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r1.xyz = r1.xyz * r1.xyz + -r0.xyz;
  r0.xyz = v2.www * r1.xyz + r0.xyz;
  r1.x = r1.w + -r0.w;
  r0.w = v2.w * r1.x + r0.w;
  r1.x = dot(v3.xyz, v3.xyz);
  r1.x = rsqrt(r1.x);
  r1.yzw = v3.xyz * r1.xxx;
  r2.x = dot(v4.xyz, v4.xyz);
  r2.x = rsqrt(r2.x);
  r2.yzw = v4.xyz * r2.xxx;
  r3.x = dot(r1.yzw, -cb3[6].xyz);
  r3.yz = cb12[29].zw * v7.xy;
  r4.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r4.x != 0) {
    r5.xyz = t13.Sample(s13_s, r3.yz).xyw;
  } else {
    r5.xyz = float3(1,1,1);
  }
  r6.xy = r5.xy * cb1[9].xz + cb1[9].yw;
  r6.xy = r4.xx ? r6.xy : r5.xy;
  r7.xyz = -cb3[5].xyz + float3(1,1,1);
  r8.xyzw = t14.Sample(s14_s, r3.yz).xyzw;
  r9.xyzw = r8.xyzw + r8.xyzw;
  r8.xyzw = r8.xyzw / cb1[0].zzzz;
  r8.xyzw = r4.zzzz ? r9.xyzw : r8.xyzw;
  r8.xyzw = r4.yyyy ? r9.xyzw : r8.xyzw;
  r3.yz = r6.xy * cb1[9].xz + cb1[9].yw;
  r3.yz = r4.xx ? r3.yz : r5.xy;
  r3.y = r3.y * r3.z;
  r5.xyw = r3.yyy * r7.xyz + cb3[5].xyz;
  r7.xyz = v1.xyz * r5.zzz;
  r9.xyz = r5.xyw * cb1[11].xxx + cb1[11].yyy;
  r3.y = cb1[11].z + cb1[11].w;
  r9.xyz = r9.xyz * r3.yyy;
  r9.xyz = r4.xxx ? r9.xyz : r5.xyw;
  r9.xyz = r9.xyz * r5.zzz;
  r10.xyz = cb6[1].www * cb7[11].xyz;
  r11.xyz = r10.xyz * r0.xyz;
  r12.xyz = r8.xyz * r3.zzz + v5.xyz;
  r13.xyz = r8.www * r3.zzz + v6.xyz;
  r12.xyz = r4.www ? v5.xyz : r12.xyz;
  r13.xyz = r4.www ? v6.xyz : r13.xyz;
  r3.y = saturate(dot(r1.yzw, -cb3[7].xyz));
  r3.w = saturate(r3.x);
  r14.xyz = cb3[0].xyz * r3.www;
  r15.xyz = cb3[1].xyz * r3.yyy;
  r16.xyz = cb6[0].xyz * cb7[9].xyz;
  r17.xyz = r15.xyz * r3.zzz;
  r17.xyz = r14.xyz * r5.xyw + r17.xyz;
  r17.xyz = r16.xyz * r17.xyz + cb1[13].xyz;
  r10.xyz = r10.xyz * r0.xyz + r17.xyz;
  r17.xyz = r12.xyz * r9.xyz;
  r10.xyz = r10.xyz * r7.xyz + r17.xyz;
  r17.xyz = v4.xyz * r2.xxx + cb3[6].xyz;
  r3.w = dot(r17.xyz, r17.xyz);
  r3.w = rsqrt(r3.w);
  r17.xyz = r17.xyz * r3.www;
  r3.w = saturate(dot(-r17.xyz, r1.yzw));
  r17.xyz = v4.xyz * r2.xxx + float3(0,-0.300000012,0);
  r2.x = dot(r17.xyz, r17.xyz);
  r2.x = rsqrt(r2.x);
  r17.xyz = r17.xyz * r2.xxx;
  r2.x = saturate(dot(-r17.xyz, r1.yzw));
  r17.x = log2(r3.w);
  r17.y = log2(r2.x);
  r4.yz = cb7[10].ww * r17.xy;
  r4.yz = exp2(r4.yz);
  r2.x = cb3[11].x + cb3[11].x;
  r17.xyz = cb3[0].xyz * r4.yyy;
  r18.xyz = cb3[1].xyz * r4.zzz;
  r18.xyz = r18.xyz * r2.xxx;
  r19.xyz = r18.xyz * r3.yyy;
  r19.xyz = r17.xyz * r5.xyw + r19.xyz;
  r20.xyz = cb6[1].xyz * cb7[10].xyz;
  r19.xyz = r20.xyz * r19.xyz;
  r21.xyz = r13.xyz * r4.zzz;
  r21.xyz = r21.xyz * r9.xyz;
  r19.xyz = r19.xyz * r7.xyz + r21.xyz;
  r8.xyz = r8.xyz * r3.zzz + r10.xyz;
  r3.yzw = r8.www * r3.zzz + r19.xyz;
  r8.xyz = r4.www ? r8.xyz : r10.xyz;
  r3.yzw = r4.www ? r3.yzw : r19.xyz;
  r10.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r3.yzw = r10.xxx ? float3(0,0,0) : r3.yzw;
  r8.xyz = r8.xyz * r0.xyz;
  r3.yzw = r3.yzw * r0.www;
  r19.xyz = v3.xyz * r1.xxx + float3(1,1,1);
  r19.xyz = saturate(float3(0.5,0.5,0.5) * r19.xyz);
  r19.xyz = cb9[11].yyy * r19.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r19.xyz;
  r1.x = cb9[11].z * r0.w;
  r0.xyz = r1.xxx * r20.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r5.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r7.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r9.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r16.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r20.xyz + r0.xyz;
  r1.x = dot(-r2.yzw, r1.yzw);
  r1.x = 1 + -r1.x;
  r2.x = r1.x * r1.x;
  r2.x = r2.x * r2.x;
  r1.x = r2.x * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r11.xyz + r0.xyz;
  r5.xyz = cb9[14].yyy * r16.xyz;
  r0.xyz = r5.xyz * r14.xyz + r0.xyz;
  r5.xyz = cb9[14].zzz * r16.xyz;
  r0.xyz = r5.xyz * r15.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r12.xyz + r0.xyz;
  r5.xyz = cb9[15].xxx * r20.xyz;
  r0.xyz = r5.xyz * r17.xyz + r0.xyz;
  r5.xyz = cb9[15].yyy * r20.xyz;
  r5.xyz = r5.xyz * r18.xyz;
  r0.xyz = r5.xyz * r4.zzz + r0.xyz;
  r5.xyz = cb9[15].zzz * r13.xyz;
  r0.xyz = r5.xyz * r4.zzz + r0.xyz;
  r0.xyz = r10.yyy ? r0.xyz : r8.xyz;
  r3.yzw = r10.yyy ? float3(0,0,0) : r3.yzw;
  r0.xyz = r3.yzw + r0.xyz;
  r0.w = v3.w * r0.w;
  r1.x = dot(r2.yzw, r1.yzw);
  r1.x = r1.x + r1.x;
  r1.xyz = r1.yzw * -r1.xxx + r2.yzw;
  r1.xyz = float3(-1,1,1) * r1.xyz;
  r1.xyzw = t6.Sample(s6_s, r1.xyz).xyzw;
  r2.x = r6.x * r6.y;
  r2.y = saturate(0.75 + r3.x);
  r2.x = r2.x * r2.y;
  r2.x = max(cb3[11].y, r2.x);
  r1.w = max(0.00392156886, r1.w);
  r1.w = 0.25 / r1.w;
  r1.xyz = r1.xyz * r1.www;
  r1.xyz = r1.xyz * r1.xyz;
  r1.xyz = r1.xyz * r0.www;
  r0.xyz = r1.xyz * r2.xxx + r0.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r1.w = cb6[0].w * r0.w;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.yzw = r2.xyz + r2.xyz;
  r5.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.yzw * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r4.yzw * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r5.xyz / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MarkerFunction2(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r10.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r10.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v2.xyz + r0.xyz;
  r0.w = saturate(v2.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r10.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r4.xxxx ? r1.xyzw : r0.xyzw;
  return;
}