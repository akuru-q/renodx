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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
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
  r4.xyz = v3.xyz * r1.yyy + cb9[4].xyz;
  r1.z = dot(r4.xyz, r4.xyz);
  r1.z = rsqrt(r1.z);
  r4.xyz = r4.xyz * r1.zzz;
  r1.yzw = v3.xyz * r1.yyy + cb9[5].xyz;
  r3.w = dot(r1.yzw, r1.yzw);
  r3.w = rsqrt(r3.w);
  r1.yzw = r3.www * r1.yzw;
  r5.xy = cb12[29].zw * v7.xy;
  r6.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r5.zw = t13.Sample(s13_s, r5.xy).xy;
  } else {
    r5.zw = float2(1,1);
  }
  r7.xy = r5.zw * cb1[12].xz + cb1[12].yw;
  r5.zw = r6.xx ? r7.xy : r5.zw;
  r3.w = min(r5.z, r5.w);
  r5.zw = cb9[6].xy * cb7[10].ww;
  r4.x = saturate(dot(-r4.xyz, r2.xyz));
  r4.x = log2(r4.x);
  r4.x = r5.z * r4.x;
  r4.x = exp2(r4.x);
  r4.yzw = cb6[1].xyz * cb7[10].xyz;
  r7.xyz = cb9[4].www * r4.yzw;
  r7.xyz = r7.xyz * r4.xxx;
  r1.y = saturate(dot(-r1.yzw, r2.xyz));
  r1.y = log2(r1.y);
  r1.y = r5.w * r1.y;
  r1.y = exp2(r1.y);
  r8.xyz = cb9[5].www * r4.yzw;
  r1.yzw = r8.xyz * r1.yyy;
  r1.yzw = cb3[0].xyz * r1.yzw;
  r1.yzw = saturate(r7.xyz * cb3[0].xyz + r1.yzw);
  r4.x = saturate(dot(r2.xyz, -v5.xyz));
  r7.x = v3.w;
  r7.y = v4.w;
  r7.z = v5.w;
  r7.xyz = r7.xyz * r4.xxx;
  r7.xyz = max(float3(0,0,0), r7.xyz);
  r4.x = saturate(dot(r2.xyz, -v6.xyz));
  r8.x = v0.w;
  r8.y = v1.w;
  r8.z = v6.w;
  r8.xyz = r8.xyz * r4.xxx;
  r8.xyz = max(float3(0,0,0), r8.xyz);
  r7.xyz = r8.xyz + r7.xyz;
  r7.xyz = r6.yyy ? r7.xyz : float3(0,0,0);
  r5.xyz = t14.Sample(s14_s, r5.xy).xyz;
  r8.xyz = float3(4,4,4) * r5.xyz;
  r9.xyz = r5.xyz + r5.xyz;
  r5.xyz = r5.xyz / cb1[0].zzz;
  r5.xyz = r6.www ? r9.xyz : r5.xyz;
  r5.xyz = r6.zzz ? r8.xyz : r5.xyz;
  r5.xyz = r7.xyz + r5.xyz;
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
  r6.yzw = max(float3(0.0625,0.0625,0.0625), r7.xyz);
  r1.yzw = v2.zzz * r1.yzw;
  r2.w = saturate(dot(r2.xyz, -cb3[6].xyz));
  r4.x = saturate(dot(r2.xyz, -cb3[7].xyz));
  r5.w = r2.y * 0.5 + 0.5;
  r7.xyz = -cb3[10].xyz + cb3[4].xyz;
  r7.xyz = r5.www * r7.xyz + cb3[10].xyz;
  r6.yzw = cb2[79].xxx * r6.yzw + r7.xyz;
  r7.xyz = cb3[0].xyz * r2.www;
  r8.xyz = cb3[1].xyz * r4.xxx;
  r9.xyz = r7.xyz * r3.www + r8.xyz;
  r9.xyz = r9.xyz + r6.yzw;
  r9.xyz = r9.xyz + r5.xyz;
  r2.w = max(r9.x, r9.y);
  r2.w = max(r2.w, r9.z);
  r2.w = saturate(cb9[6].z + r2.w);
  r10.xyw = r2.www * r1.zwy;
  r1.yzw = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r11.xyz = v4.xyz * r1.xxx + float3(1,1,1);
  r11.xyz = saturate(float3(0.5,0.5,0.5) * r11.xyz);
  r11.xyz = cb9[11].yyy * r11.xyz;
  r11.xyz = cb9[11].xxx * r0.xyz + r11.xyz;
  r11.xyz = cb9[11].zzz * r4.yzw + r11.xyz;
  r11.xyz = cb9[11].www * r10.www + r11.xyz;
  r11.xyz = cb9[12].xxx * r3.www + r11.xyz;
  r11.xyz = cb9[12].yyy + r11.xyz;
  r12.xyz = cb6[0].xyz * cb7[9].xyz;
  r11.xyz = cb9[13].xxx * r12.xyz + r11.xyz;
  r11.xyz = cb9[13].yyy * r4.yzw + r11.xyz;
  r1.x = dot(-r3.xyz, r2.xyz);
  r1.x = 1 + -r1.x;
  r2.x = r1.x * r1.x;
  r2.x = r2.x * r2.x;
  r1.x = r2.x * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r2.xyz = cb9[13].zzz * r1.xxx + r11.xyz;
  r2.xyz = cb9[13].www * r6.yzw + r2.xyz;
  r3.xyz = cb9[14].yyy * r12.xyz;
  r2.xyz = r3.xyz * r7.xyz + r2.xyz;
  r3.xyz = cb9[14].zzz * r12.xyz;
  r2.xyz = r3.xyz * r8.xyz + r2.xyz;
  r2.xyz = cb9[14].www * r5.xyz + r2.xyz;
  r3.xyz = cb9[15].xxx * r4.yzw;
  r2.xyz = r3.xyz * r10.wxy + r2.xyz;
  r3.xyz = cb9[15].yyy * r4.yzw;
  r2.xyz = saturate(r3.xyz * r10.wxy + r2.xyz);
  r0.xyz = r9.xyz * r0.xyz;
  r10.xyz = r0.xyz * r12.xyz + r10.wxy;
  r2.w = 1;
  r2.xyzw = r1.yyyy ? r2.wxyz : r10.wxyz;
  r0.x = cb5[1].w * cb7[9].w;
  r0.x = cb6[0].w * r0.x;
  r0.y = r0.w * r0.x;
  r0.x = -r0.w * r0.x + 1;
  r2.x = saturate(r2.x);
  r0.w = r0.x * r2.x + r0.y;
  r2.xyz = v0.xyz * r2.yzw;
  r3.xyz = cb1[0].xxx * r2.xyz;

  MaterialPreTonemap(r3.xyz, cb1[0].x);

  r4.xyz = log2(r3.xyz);
  r4.xyz = cb1[0].yyy * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r5.xyz = r3.xyz + r3.xyz;
  r6.yzw = r3.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r6.yzw = r5.xyz * r6.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r3.xyz = r3.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r3.xyz = r5.xyz * r3.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r3.xyz = r6.yzw / r3.xyz;
  r3.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r3.xyz;
  r3.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r3.xyz);

  MaterialPostTonemap(r3.xyz);

  r3.xyz = sqrt(r3.xyz);
  r2.xyz = r1.yyy ? r2.xyz : r3.xyz;
  r2.xyz = r1.zzz ? r4.xyz : r2.xyz;
  r3.xyz = v1.xyz + r2.xyz;
  r1.x = saturate(v1.x);
  r4.xyz = cb1[1].xyz + -r2.xyz;
  r2.xyz = r1.xxx * r4.xyz + r2.xyz;
  r1.xzw = r1.www ? r3.xyz : r2.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r1.xzw;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r0.xyz = r1.yyy ? r2.xyz : r1.xzw;
  r1.xyzw = cb1[3].xyzw * r0.xyzw;
  o0.xyzw = r6.xxxx ? r0.xyzw : r1.xyzw;
  return;
}