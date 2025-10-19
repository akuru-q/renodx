#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:06 2025
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
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
  r3.xyz = r2.xyz * r0.www;
  r2.x = dot(v3.xyz, v3.xyz);
  r2.x = rsqrt(r2.x);
  r4.xyz = v3.xyz * r2.xxx;
  r5.xyz = v3.xyz * r2.xxx + cb3[6].xyz;
  r2.z = dot(r5.xyz, r5.xyz);
  r2.z = rsqrt(r2.z);
  r5.xyz = r5.xyz * r2.zzz;
  r0.w = saturate(r2.y * r0.w + 0.100000001);
  r2.yz = cb7[6].wz + float2(2,2.5);
  r2.w = dot(-r4.xyz, v4.xyz);
  r2.w = saturate(1 + -r2.w);
  r4.w = dot(-r4.xyz, r3.xyz);
  r4.w = saturate(1 + -r4.w);
  r2.w = r4.w * r2.w;
  r2.w = log2(r2.w);
  r2.y = r2.y * r2.w;
  r2.y = exp2(r2.y);
  r2.y = r2.y * r2.z;
  r0.w = r2.y * r0.w;
  r0.w = r0.w * r0.y;
  r0.w = r0.w * cb9[0].x + 1;
  r1.xyz = r1.xyz * r0.www;
  r2.yz = cb12[29].zw * v8.xy;
  r6.xyz = int3(8,1,4) & asint(cb13[0].xxx);
  if (r6.x != 0) {
    r7.xy = t13.Sample(s13_s, r2.yz).xy;
  } else {
    r7.xy = float2(1,1);
  }
  r7.zw = r7.xy * cb1[12].xz + cb1[12].yw;
  r7.xy = r6.xx ? r7.zw : r7.xy;
  r0.w = min(r7.x, r7.y);
  r7.xyz = v3.xyz * r2.xxx + cb3[7].xyz;
  r2.w = dot(r7.xyz, r7.xyz);
  r2.w = rsqrt(r2.w);
  r7.xyz = r7.xyz * r2.www;
  r2.w = dot(r4.xyz, r3.xyz);
  r2.w = r2.w + r2.w;
  r8.xyz = r3.xyz * -r2.www + r4.xyz;
  r9.x = saturate(dot(r8.xyz, -cb3[6].xyz));
  r9.y = saturate(dot(r8.xyz, -cb3[7].xyz));
  r9.xy = log2(r9.xy);
  r9.xy = r9.xy * r0.zz;
  r9.xy = exp2(r9.xy);
  r2.w = cb1[0].w * cb7[8].z;
  r4.w = r0.z * 0.0397435986 + 0.0856831968;
  r9.xy = r9.xy * r4.ww;
  r5.x = dot(r4.xyz, r5.xyz);
  r5.y = dot(r4.xyz, r7.xyz);
  r5.xy = float2(1,1) + -r5.xy;
  r5.zw = r5.xy * r5.xy;
  r6.w = -cb7[8].z * cb1[0].w + 1;
  r5.zw = r5.zw * r5.zw;
  r5.zw = r5.zw * r6.ww;
  r5.xy = r5.zw * r5.xy + r2.ww;
  r5.xy = r9.xy * r5.xy;
  r7.x = dot(r3.xyz, -cb3[6].xyz);
  r5.z = saturate(r7.x);
  r5.x = r5.x * r5.z;
  r7.y = dot(r3.xyz, -cb3[7].xyz);
  r7.yzw = saturate(r7.yxy);
  r5.y = r7.y * r5.y;
  r9.xyz = float3(1,0,0) * r4.zxy;
  r9.xyz = r4.yzx * float3(0,0,1) + -r9.xyz;
  r10.xyz = cb9[10].www * float3(0,1,0) + r4.xyz;
  r9.xyz = r9.xyz * cb9[10].zzz + r10.xyz;
  r5.z = dot(r9.xyz, r9.xyz);
  r5.z = rsqrt(r5.z);
  r9.xyz = r9.xyz * r5.zzz;
  r5.z = saturate(dot(r3.xyz, -r9.xyz));
  r5.w = cb9[10].y * r0.z;
  r5.z = log2(r5.z);
  r5.z = r5.w * r5.z;
  r5.z = exp2(r5.z);
  r9.xyz = v3.xyz * r2.xxx + r8.xyz;
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
  r5.w = dot(r4.xyz, r9.xyz);
  r5.w = 1 + -r5.w;
  r7.y = r5.w * r5.w;
  r7.y = r7.y * r7.y;
  r7.y = r7.y * r6.w;
  r5.w = r7.y * r5.w + r2.w;
  r5.w = r5.w * r4.w;
  r9.xyz = cb6[1].xyz * cb7[10].xyz;
  r11.xyz = cb3[0].xyz * r5.xxx;
  r12.xyz = cb3[1].xyz * r5.yyy;
  r11.xyz = r11.xyz * r0.www + r12.xyz;
  r5.xyz = cb9[10].xxx * r5.zzz + r11.xyz;
  r5.xyz = r10.xyz * r5.www + r5.xyz;
  if (r6.y != 0) {
    r5.w = saturate(dot(r3.xyz, -v6.xyz));
    r10.x = v3.w;
    r10.y = v4.w;
    r10.z = v6.w;
    r11.xyz = r10.xyz * r5.www;
    r11.xyz = max(float3(0,0,0), r11.xyz);
    r6.y = saturate(dot(r3.xyz, -v7.xyz));
    r12.x = v0.w;
    r12.y = v1.w;
    r12.z = v7.w;
    r13.xyz = r12.xyz * r6.yyy;
    r13.xyz = max(float3(0,0,0), r13.xyz);
    r11.xyz = r13.xyz + r11.xyz;
    r13.xyz = v3.xyz * r2.xxx + v6.xyz;
    r7.y = dot(r13.xyz, r13.xyz);
    r7.y = rsqrt(r7.y);
    r13.xyz = r13.xyz * r7.yyy;
    r14.xyz = v3.xyz * r2.xxx + v7.xyz;
    r2.x = dot(r14.xyz, r14.xyz);
    r2.x = rsqrt(r2.x);
    r14.xyz = r14.xyz * r2.xxx;
    r15.x = saturate(dot(r8.xyz, -v6.xyz));
    r15.y = saturate(dot(r8.xyz, -v7.xyz));
    r8.xy = log2(r15.xy);
    r8.xy = r8.xy * r0.zz;
    r8.xy = exp2(r8.xy);
    r8.xy = r8.xy * r4.ww;
    r13.x = dot(r4.xyz, r13.xyz);
    r13.y = dot(r4.xyz, r14.xyz);
    r4.xy = float2(1,1) + -r13.xy;
    r4.zw = r4.xy * r4.xy;
    r4.zw = r4.zw * r4.zw;
    r4.zw = r4.zw * r6.ww;
    r2.xw = r4.zw * r4.xy + r2.ww;
    r2.xw = r8.xy * r2.xw;
    r0.z = r2.x * r5.w;
    r2.x = r2.w * r6.y;
    r4.xyz = r12.xyz * r2.xxx;
    r4.xyz = r10.xyz * r0.zzz + r4.xyz;
    r4.xyz = max(float3(0,0,0), r4.xyz);
    r4.xyz = r4.xyz * r9.xyz;
    r4.xyz = min(float3(1,1,1), r4.xyz);
  } else {
    r11.xyz = float3(0,0,0);
    r4.xyz = float3(0,0,0);
  }
  r2.xyzw = t14.Sample(s14_s, r2.yz).xyzw;
  r2.xyzw = r2.xyzw / cb1[0].zzzz;
  r2.xyz = r11.xyz + r2.xyz;
  r4.xyz = r4.xyz + r2.www;
  r3.w = 1;
  r8.x = dot(cb2[80].xyzw, r3.xyzw);
  r8.y = dot(cb2[81].xyzw, r3.xyzw);
  r8.z = dot(cb2[82].xyzw, r3.xyzw);
  r8.w = dot(cb2[83].xyzw, r3.xyzw);
  r8.x = dot(r3.xyzw, r8.xyzw);
  r10.x = dot(cb2[84].xyzw, r3.xyzw);
  r10.y = dot(cb2[85].xyzw, r3.xyzw);
  r10.z = dot(cb2[86].xyzw, r3.xyzw);
  r10.w = dot(cb2[87].xyzw, r3.xyzw);
  r8.y = dot(r3.xyzw, r10.xyzw);
  r10.x = dot(cb2[88].xyzw, r3.xyzw);
  r10.y = dot(cb2[89].xyzw, r3.xyzw);
  r10.z = dot(cb2[90].xyzw, r3.xyzw);
  r10.w = dot(cb2[91].xyzw, r3.xyzw);
  r8.z = dot(r3.xyzw, r10.xyzw);
  r3.xyz = max(float3(0.0625,0.0625,0.0625), r8.xyz);
  r6.yw = saturate(r7.xx * float2(0.75,-0.75) + float2(0.25,0.25));
  r8.xyz = cb3[10].xyz * r6.www;
  r8.xyz = cb3[4].xyz * r6.yyy + r8.xyz;
  r3.xyz = cb2[79].xxx * r3.xyz + r8.xyz;
  r7.xyz = cb3[0].xyz * r7.zzz;
  r8.xyz = cb3[1].xyz * r7.www;
  r7.xyz = r7.xyz * r0.www + r8.xyz;
  r3.xyz = r7.xyz + r3.xyz;
  r2.xyz = r3.xyz + r2.xyz;
  r0.yzw = r2.xyz * r0.yyy;
  r2.xyz = r9.xyz * r5.xyz + r4.xyz;
  r0.yzw = r0.yzw * r1.xyz;
  r1.xyz = cb6[0].xyz * cb7[9].xyz;
  r2.xyz = r2.xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xyz + r2.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r1.w = r1.w * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r0.xyz, cb1[0].x);

  r2.xyz = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r3.xyz = r2.xyz * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r2.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r3.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r0.xyz);

  MarkerFunction2(r0.xyz);

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