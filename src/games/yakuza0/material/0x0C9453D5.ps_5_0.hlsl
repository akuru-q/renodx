#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:50 2025
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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
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
  r1.zw = cb12[29].zw * v7.xy;
  r4.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r4.x != 0) {
    r5.xy = t13.Sample(s13_s, r1.zw).xy;
  } else {
    r5.xy = float2(1,1);
  }
  r5.zw = r5.xy * cb1[12].xz + cb1[12].yw;
  r5.xy = r4.xx ? r5.zw : r5.xy;
  r3.w = min(r5.x, r5.y);
  r5.z = saturate(dot(r2.xyz, -v5.xyz));
  r6.x = v3.w;
  r6.y = v4.w;
  r6.z = v5.w;
  r7.xyz = r6.xyz * r5.zzz;
  r7.xyz = max(float3(0,0,0), r7.xyz);
  r5.z = saturate(dot(r2.xyz, -v6.xyz));
  r8.x = v0.w;
  r8.y = v1.w;
  r8.z = v6.w;
  r9.xyz = r8.xyz * r5.zzz;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r7.xyz = r9.xyz + r7.xyz;
  r9.xyz = v3.xyz * r1.yyy + v5.xyz;
  r5.z = dot(r9.xyz, r9.xyz);
  r5.z = rsqrt(r5.z);
  r9.xyz = r9.xyz * r5.zzz;
  r10.xyz = v3.xyz * r1.yyy + v6.xyz;
  r1.y = dot(r10.xyz, r10.xyz);
  r1.y = rsqrt(r1.y);
  r10.xyz = r10.xyz * r1.yyy;
  r9.x = saturate(dot(-r9.xyz, r2.xyz));
  r9.y = saturate(dot(-r10.xyz, r2.xyz));
  r5.zw = log2(r9.xy);
  r5.zw = cb7[10].ww * r5.zw;
  r5.zw = exp2(r5.zw);
  r8.xyz = r8.xyz * r5.www;
  r6.xyz = r6.xyz * r5.zzz + r8.xyz;
  r6.xyz = max(float3(0,0,0), r6.xyz);
  r8.xyz = cb6[1].xyz * cb7[10].xyz;
  r6.xyz = r8.xyz * r6.xyz;
  r6.xyz = min(float3(1,1,1), r6.xyz);
  r7.xyz = r4.yyy ? r7.xyz : float3(0,0,0);
  r6.xyz = r4.yyy ? r6.xyz : float3(0,0,0);
  r8.xyzw = t14.Sample(s14_s, r1.zw).xyzw;
  r9.xyzw = float4(4,4,4,4) * r8.xyzw;
  r10.xyzw = r8.xyzw + r8.xyzw;
  r8.xyzw = r8.xyzw / cb1[0].zzzz;
  r8.xyzw = r4.wwww ? r10.xyzw : r8.xyzw;
  r8.xyzw = r4.zzzz ? r9.xyzw : r8.xyzw;
  r1.yzw = r8.xyz + r7.xyz;
  r4.yzw = r8.www + r6.xyz;
  r2.w = 1;
  r6.x = dot(cb2[80].xyzw, r2.xyzw);
  r6.y = dot(cb2[81].xyzw, r2.xyzw);
  r6.z = dot(cb2[82].xyzw, r2.xyzw);
  r6.w = dot(cb2[83].xyzw, r2.xyzw);
  r6.x = dot(r2.xyzw, r6.xyzw);
  r7.x = dot(cb2[84].xyzw, r2.xyzw);
  r7.y = dot(cb2[85].xyzw, r2.xyzw);
  r7.z = dot(cb2[86].xyzw, r2.xyzw);
  r7.w = dot(cb2[87].xyzw, r2.xyzw);
  r6.y = dot(r2.xyzw, r7.xyzw);
  r7.x = dot(cb2[88].xyzw, r2.xyzw);
  r7.y = dot(cb2[89].xyzw, r2.xyzw);
  r7.z = dot(cb2[90].xyzw, r2.xyzw);
  r7.w = dot(cb2[91].xyzw, r2.xyzw);
  r6.z = dot(r2.xyzw, r7.xyzw);
  r6.xyz = max(float3(0.0625,0.0625,0.0625), r6.xyz);
  r2.w = saturate(dot(r2.xyz, -cb3[6].xyz));
  r5.z = saturate(dot(r2.xyz, -cb3[7].xyz));
  r5.w = r2.y * 0.5 + 0.5;
  r7.xyz = -cb3[10].xyz + cb3[4].xyz;
  r7.xyz = r5.www * r7.xyz + cb3[10].xyz;
  r6.xyz = cb2[79].xxx * r6.xyz + r7.xyz;
  r7.xyz = cb3[0].xyz * r2.www;
  r8.xyz = cb3[1].xyz * r5.zzz;
  r9.xyz = r7.xyz * r3.www + r8.xyz;
  r9.xyz = r9.xyz + r6.xyz;
  r9.xyz = r9.xyz + r1.yzw;
  r10.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r11.xyz = v4.xyz * r1.xxx + float3(1,1,1);
  r11.xyz = saturate(float3(0.5,0.5,0.5) * r11.xyz);
  r11.xyz = cb9[11].yyy * r11.xyz;
  r11.xyz = cb9[11].xxx * r0.xyz + r11.xyz;
  r5.xzw = cb9[12].xxx * r5.xxx + r11.xyz;
  r5.xyz = cb9[12].yyy * r5.yyy + r5.xzw;
  r11.xyz = cb6[0].xyz * cb7[9].xyz;
  r5.xyz = cb9[13].xxx * r11.xyz + r5.xyz;
  r1.x = dot(-r3.xyz, r2.xyz);
  r1.x = 1 + -r1.x;
  r2.x = r1.x * r1.x;
  r2.x = r2.x * r2.x;
  r1.x = r2.x * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r2.xyz = cb9[13].zzz * r1.xxx + r5.xyz;
  r2.xyz = cb9[13].www * r6.xyz + r2.xyz;
  r3.xyz = cb9[14].yyy * r11.xyz;
  r2.xyz = r3.xyz * r7.xyz + r2.xyz;
  r3.xyz = cb9[14].zzz * r11.xyz;
  r2.xyz = r3.xyz * r8.xyz + r2.xyz;
  r1.xyz = saturate(cb9[14].www * r1.yzw + r2.xyz);
  r0.xyz = r9.xyz * r0.xyz;
  r0.xyz = r0.xyz * r11.xyz + r4.yzw;
  r0.xyz = r10.xxx ? r1.xyz : r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r2.w = r1.x * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r1.yzw = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r1.yzw, cb1[0].x);

  r3.xyz = log2(r1.yzw);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.yzw = r1.yzw + r1.yzw;
  r5.xyz = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.yzw * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.yzw = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.yzw = r4.yzw * r1.yzw + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.yzw = r5.xyz / r1.yzw;
  r1.yzw = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.yzw;
  r1.yzw = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.yzw);

  MaterialPostTonemap(r1.yzw);

  r1.yzw = sqrt(r1.yzw);
  r0.xyz = r10.xxx ? r0.xyz : r1.yzw;
  r0.xyz = r10.yyy ? r3.xyz : r0.xyz;
  r1.yzw = v1.xyz + r0.xyz;
  r3.x = saturate(v1.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r0.xyz = r10.zzz ? r1.yzw : r0.xyz;
  r1.yzw = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r1.yzw = cb9[12].www * v0.xyz + r1.yzw;
  r2.xyz = r10.xxx ? r1.yzw : r0.xyz;
  r0.x = r0.w * r1.x + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r4.xxxx ? r2.xyzw : r0.xyzw;
  return;
}