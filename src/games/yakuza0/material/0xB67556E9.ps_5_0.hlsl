#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:16 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.x = dot(v4.xyz, v4.xyz);
  r1.x = rsqrt(r1.x);
  r2.xyz = v4.xyz * r1.xxx;
  r1.y = dot(v3.xyz, v3.xyz);
  r1.y = rsqrt(r1.y);
  r3.xyz = v3.xyz * r1.yyy;
  r4.xyz = v3.xyz * r1.yyy + cb3[6].xyz;
  r1.z = dot(r4.xyz, r4.xyz);
  r1.z = rsqrt(r1.z);
  r4.xyz = r4.xyz * r1.zzz;
  r1.zw = cb12[29].zw * v7.xy;
  r5.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r6.xy = t13.Sample(s13_s, r1.zw).xy;
  } else {
    r6.xy = float2(1,1);
  }
  r6.zw = r6.xy * cb1[12].xz + cb1[12].yw;
  r6.xy = r5.xx ? r6.zw : r6.xy;
  r3.w = min(r6.x, r6.y);
  r6.xyz = v3.xyz * r1.yyy + cb3[7].xyz;
  r4.w = dot(r6.xyz, r6.xyz);
  r4.w = rsqrt(r4.w);
  r6.xyz = r6.xyz * r4.www;
  r4.w = dot(r3.xyz, r2.xyz);
  r4.w = r4.w + r4.w;
  r7.xyz = r2.xyz * -r4.www + r3.xyz;
  r8.x = saturate(dot(r7.xyz, -cb3[6].xyz));
  r8.y = saturate(dot(r7.xyz, -cb3[7].xyz));
  r7.xy = log2(r8.xy);
  r7.xy = cb7[10].ww * r7.xy;
  r7.xy = exp2(r7.xy);
  r4.w = cb1[0].w * cb7[8].z;
  r6.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r7.xy = r7.xy * r6.ww;
  r4.x = dot(r3.xyz, r4.xyz);
  r4.y = dot(r3.xyz, r6.xyz);
  r4.xy = float2(1,1) + -r4.xy;
  r6.xy = r4.xy * r4.xy;
  r4.z = -cb7[8].z * cb1[0].w + 1;
  r6.xy = r6.xy * r6.xy;
  r6.xy = r6.xy * r4.zz;
  r4.xy = r6.xy * r4.xy + r4.ww;
  r4.xy = r7.xy * r4.xy;
  r6.x = dot(r2.xyz, -cb3[6].xyz);
  r4.z = saturate(r6.x);
  r4.x = r4.x * r4.z;
  r6.y = dot(r2.xyz, -cb3[7].xyz);
  r6.xyz = saturate(r6.yxy);
  r4.y = r6.x * r4.y;
  r7.xyz = cb6[1].xyz * cb7[10].xyz;
  r4.xzw = cb3[0].xyz * r4.xxx;
  r8.xyz = cb3[1].xyz * r4.yyy;
  r4.xyz = r4.xzw * r3.www + r8.xyz;
  r4.w = saturate(dot(r2.xyz, -v5.xyz));
  r8.x = v3.w;
  r8.y = v4.w;
  r8.z = v5.w;
  r9.xyz = r8.xyz * r4.www;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r4.w = saturate(dot(r2.xyz, -v6.xyz));
  r10.x = v0.w;
  r10.y = v1.w;
  r10.z = v6.w;
  r11.xyz = r10.xyz * r4.www;
  r11.xyz = max(float3(0,0,0), r11.xyz);
  r9.xyz = r11.xyz + r9.xyz;
  r11.xyz = v3.xyz * r1.yyy + v5.xyz;
  r4.w = dot(r11.xyz, r11.xyz);
  r4.w = rsqrt(r4.w);
  r11.xyz = r11.xyz * r4.www;
  r12.xyz = v3.xyz * r1.yyy + v6.xyz;
  r1.y = dot(r12.xyz, r12.xyz);
  r1.y = rsqrt(r1.y);
  r12.xyz = r12.xyz * r1.yyy;
  r11.x = saturate(dot(-r11.xyz, r2.xyz));
  r11.y = saturate(dot(-r12.xyz, r2.xyz));
  r6.xw = log2(r11.xy);
  r6.xw = cb7[10].ww * r6.xw;
  r6.xw = exp2(r6.xw);
  r10.xyz = r10.xyz * r6.www;
  r8.xyz = r8.xyz * r6.xxx + r10.xyz;
  r8.xyz = max(float3(0,0,0), r8.xyz);
  r8.xyz = r8.xyz * r7.xyz;
  r8.xyz = min(float3(1,1,1), r8.xyz);
  r9.xyz = r5.yyy ? r9.xyz : float3(0,0,0);
  r8.xyz = r5.yyy ? r8.xyz : float3(0,0,0);
  r10.xyzw = t14.Sample(s14_s, r1.zw).xyzw;
  r11.xyzw = float4(4,4,4,4) * r10.xyzw;
  r12.xyzw = r10.xyzw + r10.xyzw;
  r10.xyzw = r10.xyzw / cb1[0].zzzz;
  r10.xyzw = r5.wwww ? r12.xyzw : r10.xyzw;
  r10.xyzw = r5.zzzz ? r11.xyzw : r10.xyzw;
  r1.yzw = r10.xyz + r9.xyz;
  r5.yzw = r10.www + r8.xyz;
  r2.w = 1;
  r8.x = dot(cb2[80].xyzw, r2.xyzw);
  r8.y = dot(cb2[81].xyzw, r2.xyzw);
  r8.z = dot(cb2[82].xyzw, r2.xyzw);
  r8.w = dot(cb2[83].xyzw, r2.xyzw);
  r8.x = dot(r2.xyzw, r8.xyzw);
  r9.x = dot(cb2[84].xyzw, r2.xyzw);
  r9.y = dot(cb2[85].xyzw, r2.xyzw);
  r9.z = dot(cb2[86].xyzw, r2.xyzw);
  r9.w = dot(cb2[87].xyzw, r2.xyzw);
  r8.y = dot(r2.xyzw, r9.xyzw);
  r9.x = dot(cb2[88].xyzw, r2.xyzw);
  r9.y = dot(cb2[89].xyzw, r2.xyzw);
  r9.z = dot(cb2[90].xyzw, r2.xyzw);
  r9.w = dot(cb2[91].xyzw, r2.xyzw);
  r8.z = dot(r2.xyzw, r9.xyzw);
  r8.xyz = max(float3(0.0625,0.0625,0.0625), r8.xyz);
  r2.w = r2.y * 0.5 + 0.5;
  r9.xyz = -cb3[10].xyz + cb3[4].xyz;
  r9.xyz = r2.www * r9.xyz + cb3[10].xyz;
  r8.xyz = cb2[79].xxx * r8.xyz + r9.xyz;
  r6.xyw = cb3[0].xyz * r6.yyy;
  r9.xyz = cb3[1].xyz * r6.zzz;
  r10.xyz = r6.xyw * r3.www + r9.xyz;
  r10.xyz = r10.xyz + r8.xyz;
  r10.xyz = r10.xyz + r1.yzw;
  r4.xyz = r7.xyz * r4.xyz + r5.yzw;
  r11.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r12.xyz = v4.xyz * r1.xxx + float3(1,1,1);
  r12.xyz = saturate(float3(0.5,0.5,0.5) * r12.xyz);
  r12.xyz = cb9[11].yyy * r12.xyz;
  r12.xyz = cb9[11].xxx * r0.xyz + r12.xyz;
  r12.xyz = cb9[11].zzz * r7.xyz + r12.xyz;
  r12.xyz = cb9[11].www * r4.xxx + r12.xyz;
  r12.xyz = cb9[12].xxx * r3.www + r12.xyz;
  r12.xyz = cb9[12].yyy + r12.xyz;
  r13.xyz = cb6[0].xyz * cb7[9].xyz;
  r12.xyz = cb9[13].xxx * r13.xyz + r12.xyz;
  r12.xyz = cb9[13].yyy * r7.xyz + r12.xyz;
  r1.x = dot(-r3.xyz, r2.xyz);
  r1.x = 1 + -r1.x;
  r2.x = r1.x * r1.x;
  r2.x = r2.x * r2.x;
  r1.x = r2.x * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r2.xyz = cb9[13].zzz * r1.xxx + r12.xyz;
  r2.xyz = cb9[13].www * r8.xyz + r2.xyz;
  r3.xyz = cb9[14].yyy * r13.xyz;
  r2.xyz = r3.xyz * r6.xyw + r2.xyz;
  r3.xyz = cb9[14].zzz * r13.xyz;
  r2.xyz = r3.xyz * r9.xyz + r2.xyz;
  r1.xyz = cb9[14].www * r1.yzw + r2.xyz;
  r2.xyz = cb9[15].xxx * r7.xyz;
  r1.xyz = r2.xyz * r4.xyz + r1.xyz;
  r2.xyz = cb9[15].yyy * r7.xyz;
  r1.xyz = r2.xyz * r4.xyz + r1.xyz;
  r1.xyz = saturate(cb9[15].zzz * r5.yzw + r1.xyz);
  r0.xyz = r10.xyz * r0.xyz;
  r0.xyz = r0.xyz * r13.xyz + r4.xyz;
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