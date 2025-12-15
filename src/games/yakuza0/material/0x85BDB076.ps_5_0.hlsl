#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:12 2025
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
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
  r2.w = dot(v3.xyz, v3.xyz);
  r2.w = rsqrt(r2.w);
  r4.xyz = v3.xyz * r2.www;
  r5.xyz = v3.xyz * r2.www + cb9[4].xyz;
  r4.w = dot(r5.xyz, r5.xyz);
  r4.w = rsqrt(r4.w);
  r5.xyz = r5.xyz * r4.www;
  r6.xyz = v3.xyz * r2.www + cb9[5].xyz;
  r2.w = dot(r6.xyz, r6.xyz);
  r2.w = rsqrt(r2.w);
  r6.xyz = r6.xyz * r2.www;
  r7.xy = cb12[29].zw * v8.xy;
  r8.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r8.x != 0) {
    r7.zw = t13.Sample(s13_s, r7.xy).xy;
  } else {
    r7.zw = float2(1,1);
  }
  r9.xy = r7.zw * cb1[12].xz + cb1[12].yw;
  r7.zw = r8.xx ? r9.xy : r7.zw;
  r2.w = min(r7.z, r7.w);
  r7.zw = cb9[6].xy * r0.zz;
  r0.z = saturate(dot(-r5.xyz, r3.xyz));
  r0.z = log2(r0.z);
  r0.z = r7.z * r0.z;
  r0.z = exp2(r0.z);
  r5.xyz = cb6[1].xyz * cb7[10].xyz;
  r9.xyz = cb9[4].www * r5.xyz;
  r9.xyz = r9.xyz * r0.zzz;
  r0.z = saturate(dot(-r6.xyz, r3.xyz));
  r0.z = log2(r0.z);
  r0.z = r7.w * r0.z;
  r0.z = exp2(r0.z);
  r6.xyz = cb9[5].www * r5.xyz;
  r6.xyz = r6.xyz * r0.zzz;
  r6.xyz = cb3[0].xyz * r6.xyz;
  r6.xyz = saturate(r9.xyz * cb3[0].xyz + r6.xyz);
  r0.z = saturate(dot(r3.xyz, -v6.xyz));
  r9.x = v3.w;
  r9.y = v4.w;
  r9.z = v6.w;
  r9.xyz = r9.xyz * r0.zzz;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r0.z = saturate(dot(r3.xyz, -v7.xyz));
  r10.x = v0.w;
  r10.y = v1.w;
  r10.z = v7.w;
  r10.xyz = r10.xyz * r0.zzz;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r9.xyz = r10.xyz + r9.xyz;
  r9.xyz = r8.yyy ? r9.xyz : float3(0,0,0);
  r7.xyz = t14.Sample(s14_s, r7.xy).xyz;
  r10.xyz = float3(4,4,4) * r7.xyz;
  r11.xyz = r7.xyz + r7.xyz;
  r7.xyz = r7.xyz / cb1[0].zzz;
  r7.xyz = r8.www ? r11.xyz : r7.xyz;
  r7.xyz = r8.zzz ? r10.xyz : r7.xyz;
  r7.xyz = r9.xyz + r7.xyz;
  r3.w = 1;
  r9.x = dot(cb2[80].xyzw, r3.xyzw);
  r9.y = dot(cb2[81].xyzw, r3.xyzw);
  r9.z = dot(cb2[82].xyzw, r3.xyzw);
  r9.w = dot(cb2[83].xyzw, r3.xyzw);
  r9.x = dot(r3.xyzw, r9.xyzw);
  r10.x = dot(cb2[84].xyzw, r3.xyzw);
  r10.y = dot(cb2[85].xyzw, r3.xyzw);
  r10.z = dot(cb2[86].xyzw, r3.xyzw);
  r10.w = dot(cb2[87].xyzw, r3.xyzw);
  r9.y = dot(r3.xyzw, r10.xyzw);
  r10.x = dot(cb2[88].xyzw, r3.xyzw);
  r10.y = dot(cb2[89].xyzw, r3.xyzw);
  r10.z = dot(cb2[90].xyzw, r3.xyzw);
  r10.w = dot(cb2[91].xyzw, r3.xyzw);
  r9.z = dot(r3.xyzw, r10.xyzw);
  r8.yzw = max(float3(0.0625,0.0625,0.0625), r9.xyz);
  r6.xyz = v2.zzz * r6.xyz;
  r0.z = saturate(dot(r3.xyz, -cb3[6].xyz));
  r3.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r4.w = r3.y * 0.5 + 0.5;
  r9.xyz = -cb3[10].xyz + cb3[4].xyz;
  r9.xyz = r4.www * r9.xyz + cb3[10].xyz;
  r8.yzw = cb2[79].xxx * r8.yzw + r9.xyz;
  r9.xyz = cb3[0].xyz * r0.zzz;
  r10.xyz = cb3[1].xyz * r3.www;
  r11.xyz = r9.xyz * r2.www + r10.xyz;
  r11.xyz = r11.xyz + r8.yzw;
  r11.xyz = r11.xyz + r7.xyz;
  r12.xyzw = int4(64,0x8000,16,4) & asint(cb13[0].xxxx);
  r13.xyz = r11.xyz * r0.yyy;
  r0.z = r0.z * r2.w;
  r3.w = 1 + -r0.y;
  r0.z = r0.z * r3.w + r0.y;
  r11.xyz = r11.xyz * r0.zzz;
  r11.xyz = r12.xxx ? r11.xyz : r13.xyz;
  r0.z = max(r11.x, r11.y);
  r0.z = max(r0.z, r11.z);
  r0.z = saturate(cb9[6].z + r0.z);
  r6.xyw = r6.yzx * r0.zzz;
  r2.xyz = r2.xyz * r0.www + float3(1,1,1);
  r2.xyz = saturate(float3(0.5,0.5,0.5) * r2.xyz);
  r2.xyz = cb9[11].yyy * r2.xyz;
  r2.xyz = cb9[11].xxx * r1.xyz + r2.xyz;
  r0.z = cb9[11].z * r0.x;
  r2.xyz = r0.zzz * r5.xyz + r2.xyz;
  r2.xyz = cb9[11].www * r6.www + r2.xyz;
  r2.xyz = cb9[12].xxx * r2.www + r2.xyz;
  r0.yzw = cb9[12].yyy * r0.yyy + r2.xyz;
  r2.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r2.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r5.xyz + r0.yzw;
  r2.w = dot(-r4.xyz, r3.xyz);
  r2.w = 1 + -r2.w;
  r3.x = r2.w * r2.w;
  r3.x = r3.x * r3.x;
  r2.w = r3.x * r2.w;
  r2.w = r2.w * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r2.www + r0.yzw;
  r0.yzw = cb9[13].www * r8.yzw + r0.yzw;
  r3.xyz = cb9[14].yyy * r2.xyz;
  r0.yzw = r3.xyz * r9.xyz + r0.yzw;
  r3.xyz = cb9[14].zzz * r2.xyz;
  r0.yzw = r3.xyz * r10.xyz + r0.yzw;
  r0.yzw = cb9[14].www * r7.xyz + r0.yzw;
  r3.xyz = cb9[15].xxx * r5.xyz;
  r0.yzw = r3.xyz * r6.wxy + r0.yzw;
  r3.xyz = cb9[15].yyy * r5.xyz;
  r3.xyz = saturate(r3.xyz * r6.wxy + r0.yzw);
  r0.yzw = r11.xyz * r1.xyz;
  r1.xyz = r6.wxy * r0.xxx;
  r6.xyz = r0.yzw * r2.xyz + r1.xyz;
  r3.w = 1;
  r0.xyzw = r12.yyyy ? r3.wxyz : r6.wxyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.y = r1.w * r1.x;
  r1.x = -r1.w * r1.x + 1;
  r0.x = saturate(r0.x);
  r1.w = r1.x * r0.x + r1.y;
  r0.xyz = v0.xyz * r0.yzw;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r2.xyz, cb1[0].x);

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

  MaterialPostTonemap(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r12.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r12.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v1.xyz + r0.xyz;
  r0.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r0.xyz = r12.www ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r12.yyy ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r8.xxxx ? r1.xyzw : r0.xyzw;
  return;
}