#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:51 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

TextureCube<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = t0.Sample(s0_s, v2.xy).w;
  r0.y = dot(v4.xyz, v4.xyz);
  r0.y = rsqrt(r0.y);
  r1.xyz = v4.xyz * r0.yyy;
  r0.z = dot(v3.xyz, v3.xyz);
  r0.z = rsqrt(r0.z);
  r2.xyz = v3.xyz * r0.zzz;
  r3.xyz = v3.xyz * r0.zzz + cb3[6].xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = dot(r2.xyz, r1.xyz);
  r0.w = r0.w + r0.w;
  r4.xyz = r1.xyz * -r0.www + r2.xyz;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = rsqrt(r0.w);
  r5.xyz = r4.xyz * r0.www;
  r5.xyz = float3(-1,1,1) * r5.xyz;
  r5.xyzw = t1.Sample(s1_s, r5.xyz).xyzw;
  r0.w = max(0.00392156886, r5.w);
  r0.w = 0.25 / r0.w;
  r5.xyz = r5.xyz * r0.www;
  r5.xyz = r5.xyz * r5.xyz;
  r6.xy = cb12[29].zw * v7.xy;
  r7.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r7.x != 0) {
    r6.zw = t13.Sample(s13_s, r6.xy).xy;
  } else {
    r6.zw = float2(1,1);
  }
  r8.xy = r6.zw * cb1[12].xz + cb1[12].yw;
  r6.zw = r7.xx ? r8.xy : r6.zw;
  r0.w = min(r6.z, r6.w);
  r8.xyz = v3.xyz * r0.zzz + cb3[7].xyz;
  r2.w = dot(r8.xyz, r8.xyz);
  r2.w = rsqrt(r2.w);
  r8.xyz = r8.xyz * r2.www;
  r9.x = saturate(dot(r4.xyz, -cb3[6].xyz));
  r9.y = saturate(dot(r4.xyz, -cb3[7].xyz));
  r4.xy = log2(r9.xy);
  r4.xy = cb7[10].ww * r4.xy;
  r4.xy = exp2(r4.xy);
  r2.w = cb1[0].w * cb7[8].z;
  r3.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r4.xy = r4.xy * r3.ww;
  r3.x = dot(r2.xyz, r3.xyz);
  r3.y = dot(r2.xyz, r8.xyz);
  r3.xy = float2(1,1) + -r3.xy;
  r3.zw = r3.xy * r3.xy;
  r4.z = -cb7[8].z * cb1[0].w + 1;
  r3.zw = r3.zw * r3.zw;
  r3.zw = r3.zw * r4.zz;
  r3.xy = r3.zw * r3.xy + r2.ww;
  r3.xy = r4.xy * r3.xy;
  r4.x = dot(r1.xyz, -cb3[6].xyz);
  r2.w = saturate(r4.x);
  r2.w = r3.x * r2.w;
  r4.y = dot(r1.xyz, -cb3[7].xyz);
  r3.xzw = saturate(r4.yxy);
  r3.x = r3.y * r3.x;
  r4.xyz = cb6[1].xyz * cb7[10].xyz;
  r8.xyz = cb3[0].xyz * r2.www;
  r9.xyz = cb3[1].xyz * r3.xxx;
  r8.xyz = r8.xyz * r0.www + r9.xyz;
  r2.w = saturate(dot(r1.xyz, -v5.xyz));
  r9.x = v3.w;
  r9.y = v4.w;
  r9.z = v5.w;
  r10.xyz = r9.xyz * r2.www;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r2.w = saturate(dot(r1.xyz, -v6.xyz));
  r11.x = v0.w;
  r11.y = v1.w;
  r11.z = v6.w;
  r12.xyz = r11.xyz * r2.www;
  r12.xyz = max(float3(0,0,0), r12.xyz);
  r10.xyz = r12.xyz + r10.xyz;
  r12.xyz = v3.xyz * r0.zzz + v5.xyz;
  r2.w = dot(r12.xyz, r12.xyz);
  r2.w = rsqrt(r2.w);
  r12.xyz = r12.xyz * r2.www;
  r13.xyz = v3.xyz * r0.zzz + v6.xyz;
  r0.z = dot(r13.xyz, r13.xyz);
  r0.z = rsqrt(r0.z);
  r13.xyz = r13.xyz * r0.zzz;
  r3.x = saturate(dot(-r12.xyz, r1.xyz));
  r3.y = saturate(dot(-r13.xyz, r1.xyz));
  r3.xy = log2(r3.xy);
  r3.xy = cb7[10].ww * r3.xy;
  r3.xy = exp2(r3.xy);
  r11.xyz = r11.xyz * r3.yyy;
  r9.xyz = r9.xyz * r3.xxx + r11.xyz;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r9.xyz = r9.xyz * r4.xyz;
  r9.xyz = min(float3(1,1,1), r9.xyz);
  r10.xyz = r7.yyy ? r10.xyz : float3(0,0,0);
  r9.xyz = r7.yyy ? r9.xyz : float3(0,0,0);
  r11.xyzw = t14.Sample(s14_s, r6.xy).xyzw;
  r12.xyzw = float4(4,4,4,4) * r11.xyzw;
  r13.xyzw = r11.xyzw + r11.xyzw;
  r11.xyzw = r11.xyzw / cb1[0].zzzz;
  r11.xyzw = r7.wwww ? r13.xyzw : r11.xyzw;
  r11.xyzw = r7.zzzz ? r12.xyzw : r11.xyzw;
  r7.yzw = r11.xyz + r10.xyz;
  r9.xyz = r11.www + r9.xyz;
  r1.w = 1;
  r10.x = dot(cb2[80].xyzw, r1.xyzw);
  r10.y = dot(cb2[81].xyzw, r1.xyzw);
  r10.z = dot(cb2[82].xyzw, r1.xyzw);
  r10.w = dot(cb2[83].xyzw, r1.xyzw);
  r10.x = dot(r1.xyzw, r10.xyzw);
  r11.x = dot(cb2[84].xyzw, r1.xyzw);
  r11.y = dot(cb2[85].xyzw, r1.xyzw);
  r11.z = dot(cb2[86].xyzw, r1.xyzw);
  r11.w = dot(cb2[87].xyzw, r1.xyzw);
  r10.y = dot(r1.xyzw, r11.xyzw);
  r11.x = dot(cb2[88].xyzw, r1.xyzw);
  r11.y = dot(cb2[89].xyzw, r1.xyzw);
  r11.z = dot(cb2[90].xyzw, r1.xyzw);
  r11.w = dot(cb2[91].xyzw, r1.xyzw);
  r10.z = dot(r1.xyzw, r11.xyzw);
  r10.xyz = max(float3(0.0625,0.0625,0.0625), r10.xyz);
  r0.z = r1.y * 0.5 + 0.5;
  r11.xyz = -cb3[10].xyz + cb3[4].xyz;
  r11.xyz = r0.zzz * r11.xyz + cb3[10].xyz;
  r10.xyz = cb2[79].xxx * r10.xyz + r11.xyz;
  r3.xyz = cb3[0].xyz * r3.zzz;
  r11.xyz = cb3[1].xyz * r3.www;
  r12.xyz = r3.xyz * r0.www + r11.xyz;
  r12.xyz = r12.xyz + r10.xyz;
  r12.xyz = r12.xyz + r7.yzw;
  r8.xyz = r4.xyz * r8.xyz + r9.xyz;
  r13.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r0.yzw = v4.xyz * r0.yyy + float3(1,1,1);
  r0.yzw = saturate(float3(0.5,0.5,0.5) * r0.yzw);
  r0.yzw = cb9[11].yyy * r0.yzw;
  r0.yzw = cb9[11].xxx * r5.xyz + r0.yzw;
  r0.yzw = cb9[11].zzz * r4.xyz + r0.yzw;
  r0.yzw = cb9[11].www * r8.xxx + r0.yzw;
  r0.yzw = cb9[12].xxx * r6.zzz + r0.yzw;
  r0.yzw = cb9[12].yyy * r6.www + r0.yzw;
  r6.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r6.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r4.xyz + r0.yzw;
  r1.x = dot(-r2.xyz, r1.xyz);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r1.xxx + r0.yzw;
  r0.yzw = cb9[13].www * r10.xyz + r0.yzw;
  r1.xyz = cb9[14].yyy * r6.xyz;
  r0.yzw = r1.xyz * r3.xyz + r0.yzw;
  r1.xyz = cb9[14].zzz * r6.xyz;
  r0.yzw = r1.xyz * r11.xyz + r0.yzw;
  r0.yzw = cb9[14].www * r7.yzw + r0.yzw;
  r1.xyz = cb9[15].xxx * r4.xyz;
  r0.yzw = r1.xyz * r8.xyz + r0.yzw;
  r1.xyz = cb9[15].yyy * r4.xyz;
  r0.yzw = r1.xyz * r8.xyz + r0.yzw;
  r0.yzw = saturate(cb9[15].zzz * r9.xyz + r0.yzw);
  r1.xyz = r12.xyz * r5.xyz;
  r1.xyz = r1.xyz * r6.xyz + r8.xyz;
  r0.yzw = r13.xxx ? r0.yzw : r1.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.x;
  r0.xyz = v0.xyz * r0.yzw;
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
  r0.xyz = r13.xxx ? r0.xyz : r2.xyz;
  r0.xyz = r13.yyy ? r3.xyz : r0.xyz;
  r2.xyz = v1.xyz + r0.xyz;
  r0.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r0.xyz = r13.zzz ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r13.xxx ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.xxxx ? r1.xyzw : r0.xyzw;
  return;
}