#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:51 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t2 : register(t2);

TextureCube<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[11];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[92];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[13];
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
  float4 cb7[11];
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
  float4 v0 : COLOR0,
  float4 v1 : COLOR1,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t2.Sample(s2_s, v2.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xy = t5.Sample(s5_s, v2.xy).xy;
  r2.zw = t6.Sample(s6_s, v2.zw).xy;
  r2.zw = float2(-0.5,-0.5) + r2.zw;
  r2.zw = r0.zz * r2.zw + float2(0.5,0.5);
  r3.xy = cmp(r2.xy < float2(0.5,0.5));
  r3.zw = r2.xy * r2.zw;
  r3.zw = r3.zw + r3.zw;
  r2.xyzw = float4(1,1,1,1) + -r2.xyzw;
  r2.xy = r2.xy + r2.xy;
  r2.xy = -r2.xy * r2.zw + float2(1,1);
  r2.xy = r3.xy ? r3.zw : r2.xy;
  r3.xyz = t4.Sample(s4_s, v2.zw).xyz;
  r3.xyz = float3(1,1,1) + -r3.xyz;
  r3.xyz = -r3.xyz * r0.zzz + float3(1,1,1);
  r3.xyz = r3.xyz * r0.xxx;
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r0.x = dot(r2.xy, r2.xy);
  r0.x = 1 + -r0.x;
  r0.x = max(0, r0.x);
  r0.x = sqrt(r0.x);
  r4.xyz = v5.yzx * v4.zxy;
  r4.xyz = v4.yzx * v5.zxy + -r4.xyz;
  r4.xyz = v5.www * r4.xyz;
  r2.xzw = v5.xyz * r2.xxx;
  r2.xyz = r2.yyy * r4.xyz + r2.xzw;
  r2.xyz = r0.xxx * v4.xyz + r2.xyz;
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = rsqrt(r0.x);
  r4.xyz = r2.xyz * r0.xxx;
  r2.w = dot(v3.xyz, v3.xyz);
  r2.w = rsqrt(r2.w);
  r5.xyz = v3.xyz * r2.www;
  r6.xyz = v3.xyz * r2.www + cb3[6].xyz;
  r3.w = dot(r6.xyz, r6.xyz);
  r3.w = rsqrt(r3.w);
  r6.xyz = r6.xyz * r3.www;
  r3.w = dot(r5.xyz, r4.xyz);
  r3.w = r3.w + r3.w;
  r7.xyz = r4.xyz * -r3.www + r5.xyz;
  r3.w = dot(r7.xyz, r7.xyz);
  r3.w = rsqrt(r3.w);
  r8.xyz = r7.xyz * r3.www;
  r8.xyz = float3(-1,1,1) * r8.xyz;
  r8.xyzw = t1.Sample(s1_s, r8.xyz).xyzw;
  r3.w = max(0.00392156886, r8.w);
  r3.w = 0.25 / r3.w;
  r8.xyz = r8.xyz * r3.www;
  r8.xyz = r8.xyz * r8.xyz;
  r1.xyz = r8.xyz * r0.www + r1.xyz;
  r8.xy = cb7[6].xy * v2.xy;
  r8.xyzw = t7.Sample(s7_s, r8.xy).xyzw;
  r9.xyz = r8.xyz * r8.xyz;
  r8.xyz = -r8.xyz * r8.xyz + float3(1,1,1);
  r0.zw = float2(1,1) + -r0.zy;
  r8.xyz = r8.xyz * r0.zzz;
  r0.z = 1 + -r8.w;
  r8.xyz = r8.xyz * r0.zzz + r9.xyz;
  r1.xyz = r8.xyz * r1.xyz;
  r8.xyzw = r2.yxyz * r0.xxxx + float4(0.100000001,1,1,1);
  r8.x = saturate(r8.x);
  r0.xz = cb7[6].wz + float2(2,2.5);
  r2.x = dot(-r5.xyz, v4.xyz);
  r2.x = saturate(1 + -r2.x);
  r2.y = dot(-r5.xyz, r4.xyz);
  r2.y = 1 + -r2.y;
  r2.z = saturate(r2.y);
  r2.x = r2.x * r2.z;
  r2.x = log2(r2.x);
  r0.x = r2.x * r0.x;
  r0.x = exp2(r0.x);
  r0.x = r0.x * r0.z;
  r0.x = r0.x * r8.x;
  r9.xyzw = int4(4096,8,1,0x4000) & asint(cb13[0].xxxx);
  r0.z = cb9[9].w * r2.x;
  r0.z = exp2(r0.z);
  r0.z = cb9[9].z * r0.z;
  r0.z = r0.z * r8.x;
  r0.xz = r0.xz * r0.yy;
  r0.x = r9.x ? r0.z : r0.x;
  r0.x = r0.x * cb9[2].x + 1;
  r1.xyz = r1.xyz * r0.xxx;
  r0.xz = cb12[29].zw * v8.xy;
  if (r9.y != 0) {
    r2.xz = t13.Sample(s13_s, r0.xz).xy;
  } else {
    r2.xz = float2(1,1);
  }
  r10.xy = r2.xz * cb1[12].xz + cb1[12].yw;
  r2.xz = r9.yy ? r10.xy : r2.xz;
  r3.w = min(r2.x, r2.z);
  r10.xyz = v3.xyz * r2.www + cb3[7].xyz;
  r5.w = dot(r10.xyz, r10.xyz);
  r5.w = rsqrt(r5.w);
  r10.xyz = r10.xyz * r5.www;
  r11.x = saturate(dot(r7.xyz, -cb3[6].xyz));
  r11.y = saturate(dot(r7.xyz, -cb3[7].xyz));
  r7.xy = log2(r11.xy);
  r7.xy = cb7[10].ww * r7.xy;
  r7.xy = exp2(r7.xy);
  r5.w = cb1[0].w * cb7[8].z;
  r6.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r7.xy = r7.xy * r6.ww;
  r6.x = dot(r5.xyz, r6.xyz);
  r6.y = dot(r5.xyz, r10.xyz);
  r5.xy = float2(1,1) + -r6.xy;
  r6.xy = r5.xy * r5.xy;
  r5.z = -cb7[8].z * cb1[0].w + 1;
  r6.xy = r6.xy * r6.xy;
  r6.xy = r6.xy * r5.zz;
  r5.xy = r6.xy * r5.xy + r5.ww;
  r5.xy = r7.xy * r5.xy;
  r6.x = dot(r4.xyz, -cb3[6].xyz);
  r5.z = saturate(r6.x);
  r5.x = r5.x * r5.z;
  r6.y = dot(r4.xyz, -cb3[7].xyz);
  r6.xyz = saturate(r6.yxy);
  r5.y = r6.x * r5.y;
  r7.xyz = cb6[1].xyz * cb7[10].xyz;
  r5.xzw = cb3[0].xyz * r5.xxx;
  r10.xyz = cb3[1].xyz * r5.yyy;
  r5.xyz = r5.xzw * r3.www + r10.xyz;
  r5.w = saturate(dot(r4.xyz, -v6.xyz));
  r10.x = v3.w;
  r10.y = v4.w;
  r10.z = v6.w;
  r11.xyz = r10.xyz * r5.www;
  r11.xyz = max(float3(0,0,0), r11.xyz);
  r5.w = saturate(dot(r4.xyz, -v7.xyz));
  r12.x = v0.w;
  r12.y = v1.w;
  r12.z = v7.w;
  r13.xyz = r12.xyz * r5.www;
  r13.xyz = max(float3(0,0,0), r13.xyz);
  r11.xyz = r13.xyz + r11.xyz;
  r13.xyz = v3.xyz * r2.www + v6.xyz;
  r5.w = dot(r13.xyz, r13.xyz);
  r5.w = rsqrt(r5.w);
  r13.xyz = r13.xyz * r5.www;
  r14.xyz = v3.xyz * r2.www + v7.xyz;
  r2.w = dot(r14.xyz, r14.xyz);
  r2.w = rsqrt(r2.w);
  r14.xyz = r14.xyz * r2.www;
  r13.x = saturate(dot(-r13.xyz, r4.xyz));
  r13.y = saturate(dot(-r14.xyz, r4.xyz));
  r6.xw = log2(r13.xy);
  r6.xw = cb7[10].ww * r6.xw;
  r6.xw = exp2(r6.xw);
  r12.xyz = r12.xyz * r6.www;
  r10.xyz = r10.xyz * r6.xxx + r12.xyz;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r10.xyz = r10.xyz * r7.xyz;
  r10.xyz = min(float3(1,1,1), r10.xyz);
  r11.xyz = r9.zzz ? r11.xyz : float3(0,0,0);
  r10.xyz = r9.zzz ? r10.xyz : float3(0,0,0);
  r12.xyzw = t14.Sample(s14_s, r0.xz).xyzw;
  r13.xyzw = float4(4,4,4,4) * r12.xyzw;
  r14.xyzw = int4(8192,64,0x8000,16) & asint(cb13[0].xxxx);
  r15.xyzw = r12.xyzw + r12.xyzw;
  r12.xyzw = r12.xyzw / cb1[0].zzzz;
  r12.xyzw = r14.xxxx ? r15.xyzw : r12.xyzw;
  r12.xyzw = r9.wwww ? r13.xyzw : r12.xyzw;
  r9.xzw = r12.xyz + r11.xyz;
  r10.xyz = r12.www + r10.xyz;
  r4.w = 1;
  r11.x = dot(cb2[80].xyzw, r4.xyzw);
  r11.y = dot(cb2[81].xyzw, r4.xyzw);
  r11.z = dot(cb2[82].xyzw, r4.xyzw);
  r11.w = dot(cb2[83].xyzw, r4.xyzw);
  r11.x = dot(r4.xyzw, r11.xyzw);
  r12.x = dot(cb2[84].xyzw, r4.xyzw);
  r12.y = dot(cb2[85].xyzw, r4.xyzw);
  r12.z = dot(cb2[86].xyzw, r4.xyzw);
  r12.w = dot(cb2[87].xyzw, r4.xyzw);
  r11.y = dot(r4.xyzw, r12.xyzw);
  r12.x = dot(cb2[88].xyzw, r4.xyzw);
  r12.y = dot(cb2[89].xyzw, r4.xyzw);
  r12.z = dot(cb2[90].xyzw, r4.xyzw);
  r12.w = dot(cb2[91].xyzw, r4.xyzw);
  r11.z = dot(r4.xyzw, r12.xyzw);
  r4.xzw = max(float3(0.0625,0.0625,0.0625), r11.xyz);
  r0.x = r4.y * 0.5 + 0.5;
  r11.xyz = -cb3[10].xyz + cb3[4].xyz;
  r11.xyz = r0.xxx * r11.xyz + cb3[10].xyz;
  r4.xyz = cb2[79].xxx * r4.xzw + r11.xyz;
  r11.xyz = cb3[0].xyz * r6.yyy;
  r6.xzw = cb3[1].xyz * r6.zzz;
  r12.xyz = r11.xyz * r3.www + r6.xzw;
  r12.xyz = r12.xyz + r4.xyz;
  r12.xyz = r12.xyz + r9.xzw;
  r13.xyz = r12.xyz * r0.yyy;
  r0.x = r6.y * r3.w;
  r0.x = r0.x * r0.w + r0.y;
  r0.xzw = r12.xyz * r0.xxx;
  r0.xzw = r14.yyy ? r0.xzw : r13.xyz;
  r5.xyz = r7.xyz * r5.xyz + r10.xyz;
  r8.xyz = saturate(float3(0.5,0.5,0.5) * r8.yzw);
  r8.xyz = cb9[11].yyy * r8.xyz;
  r8.xyz = cb9[11].xxx * r1.xyz + r8.xyz;
  r12.xyz = cb9[11].zzz * r3.xyz;
  r8.xyz = r12.xyz * r7.xyz + r8.xyz;
  r8.xyz = cb9[11].www * r5.xxx + r8.xyz;
  r2.z = cb9[12].y * r2.z;
  r8.xyz = cb9[12].xxx * r2.xxx + r8.xyz;
  r2.xzw = r2.zzz * r0.yyy + r8.xyz;
  r8.xyz = cb6[0].xyz * cb7[9].xyz;
  r2.xzw = cb9[13].xxx * r8.xyz + r2.xzw;
  r2.xzw = cb9[13].yyy * r7.xyz + r2.xzw;
  r0.y = r2.y * r2.y;
  r0.y = r0.y * r0.y;
  r0.y = r0.y * r2.y;
  r0.y = r0.y * 0.972222209 + 0.027777778;
  r2.xyz = cb9[13].zzz * r0.yyy + r2.xzw;
  r2.xyz = cb9[13].www * r4.xyz + r2.xyz;
  r4.xyz = cb9[14].yyy * r8.xyz;
  r2.xyz = r4.xyz * r11.xyz + r2.xyz;
  r4.xyz = cb9[14].zzz * r8.xyz;
  r2.xyz = r4.xyz * r6.xzw + r2.xyz;
  r2.xyz = cb9[14].www * r9.xzw + r2.xyz;
  r4.xyz = cb9[15].xxx * r7.xyz;
  r2.xyz = r4.xyz * r5.xyz + r2.xyz;
  r4.xyz = cb9[15].yyy * r7.xyz;
  r2.xyz = r4.xyz * r5.xyz + r2.xyz;
  r2.xyz = saturate(cb9[15].zzz * r10.xyz + r2.xyz);
  r0.xyz = r0.xzw * r1.xyz;
  r1.xyz = r5.xyz * r3.xyz;
  r0.xyz = r0.xyz * r8.xyz + r1.xyz;
  r0.xyz = r14.zzz ? r2.xyz : r0.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r1.w = r1.w * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
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
  r0.xyz = r14.zzz ? r0.xyz : r2.xyz;
  r0.xyz = r14.www ? r3.xyz : r0.xyz;
  r0.w = 4 & asint(cb13[0].x);
  r2.xyz = v1.xyz + r0.xyz;
  r2.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r2.www * r3.xyz + r0.xyz;
  r0.xyz = r0.www ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r14.zzz ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r9.yyyy ? r1.xyzw : r0.xyzw;
  return;
}