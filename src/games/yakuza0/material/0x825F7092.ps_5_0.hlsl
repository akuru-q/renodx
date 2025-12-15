#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:12 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

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
  float4 cb9[12];
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t2.Sample(s2_s, v2.xy).xyz;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xy = t5.Sample(s5_s, v2.xy).xy;
  r2.zw = cb7[7].xy * v2.xy;
  r3.xy = t6.Sample(s6_s, r2.zw).xy;
  r3.xy = float2(-0.5,-0.5) + r3.xy;
  r3.xy = r0.zz * r3.xy + float2(0.5,0.5);
  r3.zw = cmp(r2.xy < float2(0.5,0.5));
  r4.xy = r3.xy * r2.xy;
  r4.xy = r4.xy + r4.xy;
  r2.xy = float2(1,1) + -r2.xy;
  r2.xy = r2.xy + r2.xy;
  r3.xy = float2(1,1) + -r3.xy;
  r2.xy = -r2.xy * r3.xy + float2(1,1);
  r2.xy = r3.zw ? r4.xy : r2.xy;
  r3.xyz = t4.Sample(s4_s, r2.zw).xyz;
  r3.xyz = float3(1,1,1) + -r3.xyz;
  r3.xyz = -r3.xyz * r0.zzz + float3(1,1,1);
  r3.xyz = r3.xyz * r0.xxx;
  r0.xw = t1.Sample(s1_s, v2.xy).xy;
  r0.xw = r0.xw + -r2.xy;
  r0.xw = v2.zz * r0.xw + r2.xy;
  r0.xw = r0.xw * float2(2,2) + float2(-1,-1);
  r2.x = dot(r0.xw, r0.xw);
  r2.x = 1 + -r2.x;
  r2.x = max(0, r2.x);
  r2.x = sqrt(r2.x);
  r2.yzw = v5.yzx * v4.zxy;
  r2.yzw = v4.yzx * v5.zxy + -r2.yzw;
  r2.yzw = v5.www * r2.yzw;
  r4.xyz = v5.xyz * r0.xxx;
  r2.yzw = r0.www * r2.yzw + r4.xyz;
  r2.xyz = r2.xxx * v4.xyz + r2.yzw;
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = rsqrt(r0.x);
  r4.xyz = r2.xyz * r0.xxx;
  r0.w = dot(v3.xyz, v3.xyz);
  r0.w = rsqrt(r0.w);
  r2.xzw = v3.xyz * r0.www;
  r5.xyz = v3.xyz * r0.www + cb3[6].xyz;
  r3.w = dot(r5.xyz, r5.xyz);
  r3.w = rsqrt(r3.w);
  r5.xyz = r5.xyz * r3.www;
  r6.xy = cb7[6].xy * v2.xy;
  r6.xyzw = t7.Sample(s7_s, r6.xy).xyzw;
  r7.xyz = r6.xyz * r6.xyz;
  r6.xyz = -r6.xyz * r6.xyz + float3(1,1,1);
  r0.z = 1 + -r0.z;
  r6.xyz = r6.xyz * r0.zzz;
  r0.z = 1 + -r6.w;
  r6.xyz = r6.xyz * r0.zzz + r7.xyz;
  r1.xyz = r6.xyz * r1.xyz;
  r0.x = saturate(r2.y * r0.x + 0.100000001);
  r6.xy = cb7[6].wz + float2(2,2.5);
  r0.z = dot(-r2.xzw, v4.xyz);
  r0.z = saturate(1 + -r0.z);
  r2.y = dot(-r2.xzw, r4.xyz);
  r2.y = saturate(1 + -r2.y);
  r0.z = r2.y * r0.z;
  r0.z = log2(r0.z);
  r0.z = r6.x * r0.z;
  r0.z = exp2(r0.z);
  r0.z = r0.z * r6.y;
  r0.x = r0.z * r0.x;
  r0.x = r0.x * r0.y;
  r0.x = r0.x * cb9[0].x + 1;
  r1.xyz = r1.xyz * r0.xxx;
  r0.xz = cb12[29].zw * v8.xy;
  r6.xyz = int3(8,1,4) & asint(cb13[0].xxx);
  if (r6.x != 0) {
    r7.xy = t13.Sample(s13_s, r0.xz).xy;
  } else {
    r7.xy = float2(1,1);
  }
  r7.zw = r7.xy * cb1[12].xz + cb1[12].yw;
  r7.xy = r6.xx ? r7.zw : r7.xy;
  r2.y = min(r7.x, r7.y);
  r7.xyz = v3.xyz * r0.www + cb3[7].xyz;
  r3.w = dot(r7.xyz, r7.xyz);
  r3.w = rsqrt(r3.w);
  r7.xyz = r7.xyz * r3.www;
  r3.w = dot(r2.xzw, r4.xyz);
  r3.w = r3.w + r3.w;
  r8.xyz = r4.xyz * -r3.www + r2.xzw;
  r9.x = saturate(dot(r8.xyz, -cb3[6].xyz));
  r9.y = saturate(dot(r8.xyz, -cb3[7].xyz));
  r9.xy = log2(r9.xy);
  r9.xy = cb7[10].ww * r9.xy;
  r9.xy = exp2(r9.xy);
  r3.w = cb1[0].w * cb7[8].z;
  r5.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r9.xy = r9.xy * r5.ww;
  r5.x = dot(r2.xzw, r5.xyz);
  r5.y = dot(r2.xzw, r7.xyz);
  r5.xy = float2(1,1) + -r5.xy;
  r7.xy = r5.xy * r5.xy;
  r5.z = -cb7[8].z * cb1[0].w + 1;
  r7.xy = r7.xy * r7.xy;
  r7.xy = r7.xy * r5.zz;
  r5.xy = r7.xy * r5.xy + r3.ww;
  r5.xy = r9.xy * r5.xy;
  r7.x = dot(r4.xyz, -cb3[6].xyz);
  r6.w = saturate(r7.x);
  r5.x = r6.w * r5.x;
  r7.y = dot(r4.xyz, -cb3[7].xyz);
  r7.yzw = saturate(r7.yxy);
  r5.y = r7.y * r5.y;
  r9.xyz = float3(1,0,0) * r2.wxz;
  r9.xyz = r2.zwx * float3(0,0,1) + -r9.xyz;
  r10.xyz = cb9[10].www * float3(0,1,0) + r2.xzw;
  r9.xyz = r9.xyz * cb9[10].zzz + r10.xyz;
  r6.w = dot(r9.xyz, r9.xyz);
  r6.w = rsqrt(r6.w);
  r9.xyz = r9.xyz * r6.www;
  r6.w = saturate(dot(r4.xyz, -r9.xyz));
  r7.y = cb9[10].y * cb7[10].w;
  r6.w = log2(r6.w);
  r6.w = r7.y * r6.w;
  r6.w = exp2(r6.w);
  r9.xyz = v3.xyz * r0.www + r8.xyz;
  r7.y = dot(r9.xyz, r9.xyz);
  r7.y = rsqrt(r7.y);
  r9.xyz = r9.xyz * r7.yyy;
  r7.y = dot(r8.xyz, r8.xyz);
  r7.y = rsqrt(r7.y);
  r10.xyz = r8.xyz * r7.yyy;
  r10.w = 1;
  r11.x = dot(cb2[80].xyzw, r10.xyzw);
  r11.y = dot(cb2[81].xyzw, r10.xyzw);
  r11.z = dot(cb2[82].xyzw, r10.xyzw);
  r11.w = dot(cb2[83].xyzw, r10.xyzw);
  r11.x = dot(r10.xyzw, r11.xyzw);
  r12.x = dot(cb2[84].xyzw, r10.xyzw);
  r12.y = dot(cb2[85].xyzw, r10.xyzw);
  r12.z = dot(cb2[86].xyzw, r10.xyzw);
  r12.w = dot(cb2[87].xyzw, r10.xyzw);
  r11.y = dot(r10.xyzw, r12.xyzw);
  r12.x = dot(cb2[88].xyzw, r10.xyzw);
  r12.y = dot(cb2[89].xyzw, r10.xyzw);
  r12.z = dot(cb2[90].xyzw, r10.xyzw);
  r12.w = dot(cb2[91].xyzw, r10.xyzw);
  r11.z = dot(r10.xyzw, r12.xyzw);
  r10.xyz = max(float3(0.0625,0.0625,0.0625), r11.xyz);
  r10.xyz = log2(r10.xyz);
  r10.xyz = cb9[11].yyy * r10.xyz;
  r10.xyz = exp2(r10.xyz);
  r10.xyz = cb9[11].xxx * r10.xyz;
  r7.y = dot(r2.xzw, r9.xyz);
  r7.y = 1 + -r7.y;
  r8.w = r7.y * r7.y;
  r8.w = r8.w * r8.w;
  r8.w = r8.w * r5.z;
  r7.y = r8.w * r7.y + r3.w;
  r7.y = r7.y * r5.w;
  r9.xyz = cb6[1].xyz * cb7[10].xyz;
  r11.xyz = cb3[0].xyz * r5.xxx;
  r12.xyz = cb3[1].xyz * r5.yyy;
  r11.xyz = r11.xyz * r2.yyy + r12.xyz;
  r11.xyz = cb9[10].xxx * r6.www + r11.xyz;
  r10.xyz = r10.xyz * r7.yyy + r11.xyz;
  if (r6.y != 0) {
    r5.x = saturate(dot(r4.xyz, -v6.xyz));
    r11.x = v3.w;
    r11.y = v4.w;
    r11.z = v6.w;
    r12.xyz = r11.xyz * r5.xxx;
    r12.xyz = max(float3(0,0,0), r12.xyz);
    r5.y = saturate(dot(r4.xyz, -v7.xyz));
    r13.x = v0.w;
    r13.y = v1.w;
    r13.z = v7.w;
    r14.xyz = r13.xyz * r5.yyy;
    r14.xyz = max(float3(0,0,0), r14.xyz);
    r12.xyz = r14.xyz + r12.xyz;
    r14.xyz = v3.xyz * r0.www + v6.xyz;
    r6.y = dot(r14.xyz, r14.xyz);
    r6.y = rsqrt(r6.y);
    r14.xyz = r14.xyz * r6.yyy;
    r15.xyz = v3.xyz * r0.www + v7.xyz;
    r0.w = dot(r15.xyz, r15.xyz);
    r0.w = rsqrt(r0.w);
    r15.xyz = r15.xyz * r0.www;
    r16.x = saturate(dot(r8.xyz, -v6.xyz));
    r16.y = saturate(dot(r8.xyz, -v7.xyz));
    r6.yw = log2(r16.xy);
    r6.yw = cb7[10].ww * r6.yw;
    r6.yw = exp2(r6.yw);
    r6.yw = r6.yw * r5.ww;
    r8.x = dot(r2.xzw, r14.xyz);
    r8.y = dot(r2.xzw, r15.xyz);
    r2.xz = float2(1,1) + -r8.xy;
    r8.xy = r2.xz * r2.xz;
    r8.xy = r8.xy * r8.xy;
    r5.zw = r8.xy * r5.zz;
    r2.xz = r5.zw * r2.xz + r3.ww;
    r2.xz = r6.yw * r2.xz;
    r0.w = r2.x * r5.x;
    r2.x = r2.z * r5.y;
    r2.xzw = r13.xyz * r2.xxx;
    r2.xzw = r11.xyz * r0.www + r2.xzw;
    r2.xzw = max(float3(0,0,0), r2.xzw);
    r2.xzw = r2.xzw * r9.xyz;
    r2.xzw = min(float3(1,1,1), r2.xzw);
  } else {
    r12.xyz = float3(0,0,0);
    r2.xzw = float3(0,0,0);
  }
  r5.xyzw = t14.Sample(s14_s, r0.xz).xyzw;
  r5.xyzw = r5.xyzw / cb1[0].zzzz;
  r0.xzw = r12.xyz + r5.xyz;
  r2.xzw = r5.www + r2.xzw;
  r4.w = 1;
  r5.x = dot(cb2[80].xyzw, r4.xyzw);
  r5.y = dot(cb2[81].xyzw, r4.xyzw);
  r5.z = dot(cb2[82].xyzw, r4.xyzw);
  r5.w = dot(cb2[83].xyzw, r4.xyzw);
  r5.x = dot(r4.xyzw, r5.xyzw);
  r8.x = dot(cb2[84].xyzw, r4.xyzw);
  r8.y = dot(cb2[85].xyzw, r4.xyzw);
  r8.z = dot(cb2[86].xyzw, r4.xyzw);
  r8.w = dot(cb2[87].xyzw, r4.xyzw);
  r5.y = dot(r4.xyzw, r8.xyzw);
  r8.x = dot(cb2[88].xyzw, r4.xyzw);
  r8.y = dot(cb2[89].xyzw, r4.xyzw);
  r8.z = dot(cb2[90].xyzw, r4.xyzw);
  r8.w = dot(cb2[91].xyzw, r4.xyzw);
  r5.z = dot(r4.xyzw, r8.xyzw);
  r4.xyz = max(float3(0.0625,0.0625,0.0625), r5.xyz);
  r5.xy = saturate(r7.xx * float2(0.75,-0.75) + float2(0.25,0.25));
  r5.yzw = cb3[10].xyz * r5.yyy;
  r5.xyz = cb3[4].xyz * r5.xxx + r5.yzw;
  r4.xyz = cb2[79].xxx * r4.xyz + r5.xyz;
  r5.xyz = cb3[0].xyz * r7.zzz;
  r7.xyz = cb3[1].xyz * r7.www;
  r5.xyz = r5.xyz * r2.yyy + r7.xyz;
  r4.xyz = r5.xyz + r4.xyz;
  r0.xzw = r4.xyz + r0.xzw;
  r0.xyz = r0.xzw * r0.yyy;
  r2.xyz = r9.xyz * r10.xyz + r2.xzw;
  r0.xyz = r0.xyz * r1.xyz;
  r1.xyz = cb6[0].xyz * cb7[9].xyz;
  r2.xyz = r2.xyz * r3.xyz;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r1.w = r1.w * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r0.xyz, cb1[0].x);

  r2.xyz = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r3.xyz = r2.xyz * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r2.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r3.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r0.xyz);

  MaterialPostTonemap(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r2.xyz = v1.xyz + r0.xyz;
  r0.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r6.zzz ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r6.xxxx ? r1.xyzw : r0.xyzw;
  return;
}