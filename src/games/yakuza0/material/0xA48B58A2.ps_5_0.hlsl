#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:29:01 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

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
  float4 cb9[15];
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = t5.Sample(s5_s, v2.xy).xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r1.z = dot(r1.xy, r1.xy);
  r1.z = 1 + -r1.z;
  r1.z = max(0, r1.z);
  r1.z = sqrt(r1.z);
  r2.xyz = v5.yzx * v4.zxy;
  r2.xyz = v4.yzx * v5.zxy + -r2.xyz;
  r2.xyz = v5.www * r2.xyz;
  r3.xyz = v5.xyz * r1.xxx;
  r1.xyw = r1.yyy * r2.xyz + r3.xyz;
  r1.xyz = r1.zzz * v4.xyz + r1.xyw;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = rsqrt(r1.w);
  r2.xyz = r1.xyz * r1.www;
  r3.x = dot(v3.xyz, v3.xyz);
  r3.x = rsqrt(r3.x);
  r3.yzw = v3.xyz * r3.xxx;
  r4.xyzw = t7.Sample(s7_s, v2.zw).xyzw;
  r5.xyz = r4.xyz * r4.xyz;
  r4.xyz = -r4.xyz * r4.xyz + float3(1,1,1);
  r4.w = 1 + -r4.w;
  r4.xyz = r4.xyz * r4.www + r5.xyz;
  r0.xyz = r4.xyz * r0.xyz;
  r4.xy = cb12[29].zw * v8.xy;
  r5.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r4.zw = t13.Sample(s13_s, r4.xy).xy;
  } else {
    r4.zw = float2(1,1);
  }
  r6.xy = r4.zw * cb1[12].xz + cb1[12].yw;
  r4.zw = r5.xx ? r6.xy : r4.zw;
  r6.x = min(r4.z, r4.w);
  r6.y = saturate(dot(r2.xyz, -v6.xyz));
  r7.x = v3.w;
  r7.y = v4.w;
  r7.z = v6.w;
  r6.yzw = r7.xyz * r6.yyy;
  r6.yzw = max(float3(0,0,0), r6.yzw);
  r7.w = saturate(dot(r2.xyz, -v7.xyz));
  r8.x = v0.w;
  r8.y = v1.w;
  r8.z = v7.w;
  r9.xyz = r8.xyz * r7.www;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r6.yzw = r9.xyz + r6.yzw;
  r9.xyz = v3.xyz * r3.xxx + v6.xyz;
  r7.w = dot(r9.xyz, r9.xyz);
  r7.w = rsqrt(r7.w);
  r9.xyz = r9.xyz * r7.www;
  r10.xyz = v3.xyz * r3.xxx + v7.xyz;
  r3.x = dot(r10.xyz, r10.xyz);
  r3.x = rsqrt(r3.x);
  r10.xyz = r10.xyz * r3.xxx;
  r9.x = saturate(dot(-r9.xyz, r2.xyz));
  r9.y = saturate(dot(-r10.xyz, r2.xyz));
  r9.xy = log2(r9.xy);
  r9.xy = cb7[10].ww * r9.xy;
  r9.xy = exp2(r9.xy);
  r8.xyz = r9.yyy * r8.xyz;
  r7.xyz = r7.xyz * r9.xxx + r8.xyz;
  r7.xyz = max(float3(0,0,0), r7.xyz);
  r8.xyz = cb6[1].xyz * cb7[10].xyz;
  r7.xyz = r8.xyz * r7.xyz;
  r7.xyz = min(float3(1,1,1), r7.xyz);
  r6.yzw = r5.yyy ? r6.yzw : float3(0,0,0);
  r7.xyz = r5.yyy ? r7.xyz : float3(0,0,0);
  r8.xyzw = t14.Sample(s14_s, r4.xy).xyzw;
  r9.xyzw = float4(4,4,4,4) * r8.xyzw;
  r10.xyzw = r8.xyzw + r8.xyzw;
  r8.xyzw = r8.xyzw / cb1[0].zzzz;
  r8.xyzw = r5.wwww ? r10.xyzw : r8.xyzw;
  r8.xyzw = r5.zzzz ? r9.xyzw : r8.xyzw;
  r5.yzw = r8.xyz + r6.yzw;
  r6.yzw = r8.www + r7.xyz;
  r2.w = 1;
  r7.x = dot(cb2[80].xyzw, r2.xyzw);
  r7.y = dot(cb2[81].xyzw, r2.xyzw);
  r7.z = dot(cb2[82].xyzw, r2.xyzw);
  r7.w = dot(cb2[83].xyzw, r2.xyzw);
  r7.x = dot(r2.xyzw, r7.xyzw);
  r8.x = dot(cb2[84].xyzw, r2.xyzw);
  r8.y = dot(cb2[85].xyzw, r2.xyzw);
  r8.z = dot(cb2[86].xyzw, r2.xyzw);
  r8.w = dot(cb2[87].xyzw, r2.xyzw);
  r7.y = dot(r2.xyzw, r8.xyzw);
  r8.x = dot(cb2[88].xyzw, r2.xyzw);
  r8.y = dot(cb2[89].xyzw, r2.xyzw);
  r8.z = dot(cb2[90].xyzw, r2.xyzw);
  r8.w = dot(cb2[91].xyzw, r2.xyzw);
  r7.z = dot(r2.xyzw, r8.xyzw);
  r7.xyz = max(float3(0.0625,0.0625,0.0625), r7.xyz);
  r2.w = saturate(dot(r2.xyz, -cb3[6].xyz));
  r3.x = saturate(dot(r2.xyz, -cb3[7].xyz));
  r4.x = r2.y * 0.5 + 0.5;
  r8.xyz = -cb3[10].xyz + cb3[4].xyz;
  r8.xyz = r4.xxx * r8.xyz + cb3[10].xyz;
  r7.xyz = cb2[79].xxx * r7.xyz + r8.xyz;
  r8.xyz = cb3[0].xyz * r2.www;
  r9.xyz = cb3[1].xyz * r3.xxx;
  r10.xyz = r8.xyz * r6.xxx + r9.xyz;
  r10.xyz = r10.xyz + r7.xyz;
  r10.xyz = r10.xyz + r5.yzw;
  r11.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r1.xyz = r1.xyz * r1.www + float3(1,1,1);
  r1.xyz = saturate(float3(0.5,0.5,0.5) * r1.xyz);
  r1.xyz = cb9[11].yyy * r1.xyz;
  r1.xyz = cb9[11].xxx * r0.xyz + r1.xyz;
  r1.xyz = cb9[12].xxx * r4.zzz + r1.xyz;
  r1.xyz = cb9[12].yyy * r4.www + r1.xyz;
  r4.xyz = cb6[0].xyz * cb7[9].xyz;
  r1.xyz = cb9[13].xxx * r4.xyz + r1.xyz;
  r1.w = dot(-r3.yzw, r2.xyz);
  r1.w = 1 + -r1.w;
  r2.x = r1.w * r1.w;
  r2.x = r2.x * r2.x;
  r1.w = r2.x * r1.w;
  r1.w = r1.w * 0.972222209 + 0.027777778;
  r1.xyz = cb9[13].zzz * r1.www + r1.xyz;
  r1.xyz = cb9[13].www * r7.xyz + r1.xyz;
  r2.xyz = cb9[14].yyy * r4.xyz;
  r1.xyz = r2.xyz * r8.xyz + r1.xyz;
  r2.xyz = cb9[14].zzz * r4.xyz;
  r1.xyz = r2.xyz * r9.xyz + r1.xyz;
  r1.xyz = saturate(cb9[14].www * r5.yzw + r1.xyz);
  r0.xyz = r10.xyz * r0.xyz;
  r0.xyz = r0.xyz * r4.xyz + r6.yzw;
  r0.xyz = r11.xxx ? r1.xyz : r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r2.xyz, cb1[0].x);

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

  MarkerFunction2(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r11.xxx ? r0.xyz : r2.xyz;
  r0.xyz = r11.yyy ? r3.xyz : r0.xyz;
  r2.xyz = v1.xyz + r0.xyz;
  r0.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r0.xyz = r11.zzz ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r11.xxx ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r5.xxxx ? r1.xyzw : r0.xyzw;
  return;
}