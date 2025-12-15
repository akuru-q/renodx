#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:21 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s5_s : register(s5);

SamplerState s2_s : register(s2);

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
  r0.z = cb7[10].w * r0.z;
  r0.z = max(1, r0.z);
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r2.xy, r2.xy);
  r0.w = 1 + -r0.w;
  r0.w = max(0, r0.w);
  r0.w = sqrt(r0.w);
  r3.xyz = v5.yzx * v4.zxy;
  r3.xyz = v4.yzx * v5.zxy + -r3.xyz;
  r3.xyz = v5.www * r3.xyz;
  r2.xzw = v5.xyz * r2.xxx;
  r2.xyz = r2.yyy * r3.xyz + r2.xzw;
  r2.xyz = r0.www * v4.xyz + r2.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = dot(v3.xyz, v3.xyz);
  r0.w = rsqrt(r0.w);
  r3.xyz = v3.xyz * r0.www;
  r4.xyz = v3.xyz * r0.www + cb3[6].xyz;
  r3.w = dot(r4.xyz, r4.xyz);
  r3.w = rsqrt(r3.w);
  r4.xyz = r4.xyz * r3.www;
  r5.xy = cb12[29].zw * v8.xy;
  r6.xyz = int3(8,1,4) & asint(cb13[0].xxx);
  if (r6.x != 0) {
    r5.zw = t13.Sample(s13_s, r5.xy).xy;
  } else {
    r5.zw = float2(1,1);
  }
  r7.xy = r5.zw * cb1[12].xz + cb1[12].yw;
  r5.zw = r6.xx ? r7.xy : r5.zw;
  r3.w = min(r5.z, r5.w);
  r7.xyz = v3.xyz * r0.www + cb3[7].xyz;
  r4.w = dot(r7.xyz, r7.xyz);
  r4.w = rsqrt(r4.w);
  r7.xyz = r7.xyz * r4.www;
  r4.w = dot(r3.xyz, r2.xyz);
  r4.w = r4.w + r4.w;
  r8.xyz = r2.xyz * -r4.www + r3.xyz;
  r9.x = saturate(dot(r8.xyz, -cb3[6].xyz));
  r9.y = saturate(dot(r8.xyz, -cb3[7].xyz));
  r5.zw = log2(r9.xy);
  r5.zw = r5.zw * r0.zz;
  r5.zw = exp2(r5.zw);
  r4.w = cb1[0].w * cb7[8].z;
  r6.w = r0.z * 0.0397435986 + 0.0856831968;
  r5.zw = r6.ww * r5.zw;
  r4.x = dot(r3.xyz, r4.xyz);
  r4.y = dot(r3.xyz, r7.xyz);
  r4.xy = float2(1,1) + -r4.xy;
  r7.xy = r4.xy * r4.xy;
  r4.z = -cb7[8].z * cb1[0].w + 1;
  r7.xy = r7.xy * r7.xy;
  r7.xy = r7.xy * r4.zz;
  r4.xy = r7.xy * r4.xy + r4.ww;
  r4.xy = r5.zw * r4.xy;
  r7.x = dot(r2.xyz, -cb3[6].xyz);
  r5.z = saturate(r7.x);
  r4.x = r5.z * r4.x;
  r7.y = dot(r2.xyz, -cb3[7].xyz);
  r7.yzw = saturate(r7.yxy);
  r4.y = r7.y * r4.y;
  r9.xyz = float3(1,0,0) * r3.zxy;
  r9.xyz = r3.yzx * float3(0,0,1) + -r9.xyz;
  r10.xyz = cb9[10].www * float3(0,1,0) + r3.xyz;
  r9.xyz = r9.xyz * cb9[10].zzz + r10.xyz;
  r5.z = dot(r9.xyz, r9.xyz);
  r5.z = rsqrt(r5.z);
  r9.xyz = r9.xyz * r5.zzz;
  r5.z = saturate(dot(r2.xyz, -r9.xyz));
  r5.w = cb9[10].y * r0.z;
  r5.z = log2(r5.z);
  r5.z = r5.w * r5.z;
  r5.z = exp2(r5.z);
  r9.xyz = v3.xyz * r0.www + r8.xyz;
  r5.w = dot(r9.xyz, r9.xyz);
  r5.w = rsqrt(r5.w);
  r9.xyz = r9.xyz * r5.www;
  r5.w = dot(r8.xyz, r8.xyz);
  r5.w = rsqrt(r5.w);
  r10.xyz = r8.xyz * r5.www;
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
  r5.w = dot(r3.xyz, r9.xyz);
  r5.w = 1 + -r5.w;
  r7.y = r5.w * r5.w;
  r7.y = r7.y * r7.y;
  r7.y = r7.y * r4.z;
  r5.w = r7.y * r5.w + r4.w;
  r5.w = r6.w * r5.w;
  r9.xyz = cb6[1].xyz * cb7[10].xyz;
  r11.xyz = cb3[0].xyz * r4.xxx;
  r12.xyz = cb3[1].xyz * r4.yyy;
  r11.xyz = r11.xyz * r3.www + r12.xyz;
  r11.xyz = cb9[10].xxx * r5.zzz + r11.xyz;
  r10.xyz = r10.xyz * r5.www + r11.xyz;
  if (r6.y != 0) {
    r4.x = saturate(dot(r2.xyz, -v6.xyz));
    r11.x = v3.w;
    r11.y = v4.w;
    r11.z = v6.w;
    r12.xyz = r11.xyz * r4.xxx;
    r12.xyz = max(float3(0,0,0), r12.xyz);
    r4.y = saturate(dot(r2.xyz, -v7.xyz));
    r13.x = v0.w;
    r13.y = v1.w;
    r13.z = v7.w;
    r14.xyz = r13.xyz * r4.yyy;
    r14.xyz = max(float3(0,0,0), r14.xyz);
    r12.xyz = r14.xyz + r12.xyz;
    r14.xyz = v3.xyz * r0.www + v6.xyz;
    r5.z = dot(r14.xyz, r14.xyz);
    r5.z = rsqrt(r5.z);
    r14.xyz = r14.xyz * r5.zzz;
    r15.xyz = v3.xyz * r0.www + v7.xyz;
    r0.w = dot(r15.xyz, r15.xyz);
    r0.w = rsqrt(r0.w);
    r15.xyz = r15.xyz * r0.www;
    r16.x = saturate(dot(r8.xyz, -v6.xyz));
    r16.y = saturate(dot(r8.xyz, -v7.xyz));
    r5.zw = log2(r16.xy);
    r0.zw = r5.zw * r0.zz;
    r0.zw = exp2(r0.zw);
    r0.zw = r0.zw * r6.ww;
    r8.x = dot(r3.xyz, r14.xyz);
    r8.y = dot(r3.xyz, r15.xyz);
    r3.xy = float2(1,1) + -r8.xy;
    r5.zw = r3.xy * r3.xy;
    r5.zw = r5.zw * r5.zw;
    r5.zw = r5.zw * r4.zz;
    r3.xy = r5.zw * r3.xy + r4.ww;
    r0.zw = r3.xy * r0.zw;
    r0.zw = r0.zw * r4.xy;
    r3.xyz = r13.xyz * r0.www;
    r3.xyz = r11.xyz * r0.zzz + r3.xyz;
    r3.xyz = max(float3(0,0,0), r3.xyz);
    r3.xyz = r3.xyz * r9.xyz;
    r3.xyz = min(float3(1,1,1), r3.xyz);
  } else {
    r12.xyz = float3(0,0,0);
    r3.xyz = float3(0,0,0);
  }
  r4.xyzw = t14.Sample(s14_s, r5.xy).xyzw;
  r4.xyzw = r4.xyzw / cb1[0].zzzz;
  r4.xyz = r12.xyz + r4.xyz;
  r3.xyz = r4.www + r3.xyz;
  r2.w = 1;
  r5.x = dot(cb2[80].xyzw, r2.xyzw);
  r5.y = dot(cb2[81].xyzw, r2.xyzw);
  r5.z = dot(cb2[82].xyzw, r2.xyzw);
  r5.w = dot(cb2[83].xyzw, r2.xyzw);
  r5.x = dot(r2.xyzw, r5.xyzw);
  r8.x = dot(cb2[84].xyzw, r2.xyzw);
  r8.y = dot(cb2[85].xyzw, r2.xyzw);
  r8.z = dot(cb2[86].xyzw, r2.xyzw);
  r8.w = dot(cb2[87].xyzw, r2.xyzw);
  r5.y = dot(r2.xyzw, r8.xyzw);
  r8.x = dot(cb2[88].xyzw, r2.xyzw);
  r8.y = dot(cb2[89].xyzw, r2.xyzw);
  r8.z = dot(cb2[90].xyzw, r2.xyzw);
  r8.w = dot(cb2[91].xyzw, r2.xyzw);
  r5.z = dot(r2.xyzw, r8.xyzw);
  r2.xyz = max(float3(0.0625,0.0625,0.0625), r5.xyz);
  r0.zw = saturate(r7.xx * float2(0.75,-0.75) + float2(0.25,0.25));
  r5.xyz = cb3[10].xyz * r0.www;
  r5.xyz = cb3[4].xyz * r0.zzz + r5.xyz;
  r2.xyz = cb2[79].xxx * r2.xyz + r5.xyz;
  r5.xyz = cb3[0].xyz * r7.zzz;
  r7.xyz = cb3[1].xyz * r7.www;
  r5.xyz = r5.xyz * r3.www + r7.xyz;
  r2.xyz = r5.xyz + r2.xyz;
  r2.xyz = r2.xyz + r4.xyz;
  r0.yzw = r2.xyz * r0.yyy;
  r2.xyz = r9.xyz * r10.xyz + r3.xyz;
  r0.yzw = r0.yzw * r1.xyz;
  r1.xyz = cb6[0].xyz * cb7[9].xyz;
  r2.xyz = r2.xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xyz + r2.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r2.w = r1.w * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r0.xyz, cb1[0].x);

  r1.xyz = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r3.xyz = r1.xyz * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r1.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r3.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r0.xyz);

  MaterialPostTonemap(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r1.xyz = v1.xyz + r0.xyz;
  r3.x = saturate(v1.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r2.xyz = r6.zzz ? r1.xyz : r0.xyz;
  r0.x = r1.w * r0.w + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r6.xxxx ? r2.xyzw : r0.xyzw;
  return;
}