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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
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
  r5.xyz = v3.xyz * r2.www + cb3[6].xyz;
  r4.w = dot(r5.xyz, r5.xyz);
  r4.w = rsqrt(r4.w);
  r5.xyz = r5.xyz * r4.www;
  r6.xyzw = r2.yxyz * r0.wwww + float4(0.100000001,1,1,1);
  r6.x = saturate(r6.x);
  r2.xy = cb7[6].wz + float2(2,2.5);
  r0.w = dot(-r4.xyz, v4.xyz);
  r0.w = saturate(1 + -r0.w);
  r2.z = dot(-r4.xyz, r3.xyz);
  r4.x = 1 + -r2.z;
  r4.y = saturate(r4.x);
  r0.w = r4.y * r0.w;
  r0.w = log2(r0.w);
  r2.x = r2.x * r0.w;
  r2.x = exp2(r2.x);
  r2.x = r2.x * r2.y;
  r2.x = r2.x * r6.x;
  r2.x = r2.x * r0.y;
  r7.xyzw = int4(4096,8,1,0x4000) & asint(cb13[0].xxxx);
  r0.w = cb9[9].w * r0.w;
  r0.w = exp2(r0.w);
  r0.w = cb9[9].z * r0.w;
  r0.w = r0.w * r6.x;
  r0.w = r0.w * r0.y;
  r0.w = r7.x ? r0.w : r2.x;
  r0.w = r0.w * cb9[2].x + 1;
  r1.xyz = r1.xyz * r0.www;
  r2.xy = cb12[29].zw * v8.xy;
  if (r7.y != 0) {
    r4.yz = t13.Sample(s13_s, r2.xy).xy;
  } else {
    r4.yz = float2(1,1);
  }
  r8.xy = r4.yz * cb1[12].xz + cb1[12].yw;
  r4.yz = r7.yy ? r8.xy : r4.yz;
  r0.w = min(r4.y, r4.z);
  r4.y = dot(-r5.xyz, r3.xyz);
  r4.y = max(0, r4.y);
  r4.z = min(1, r4.y);
  r4.z = log2(r4.z);
  r4.z = r4.z * r0.z;
  r4.z = exp2(r4.z);
  r5.xyz = cb6[1].xyz * cb7[10].xyz;
  r8.xyz = r5.xyz * r4.zzz;
  r8.xyz = cb3[0].xyz * r8.xyz;
  r2.z = saturate(r2.z);
  r2.z = 1 + -r2.z;
  r2.z = r2.z * r2.z;
  r2.z = r4.y * r2.z;
  r4.yzw = r8.xyz * r0.www + r2.zzz;
  r2.z = saturate(dot(r3.xyz, -v6.xyz));
  r8.x = v3.w;
  r8.y = v4.w;
  r8.z = v6.w;
  r9.xyz = r8.xyz * r2.zzz;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r2.z = saturate(dot(r3.xyz, -v7.xyz));
  r10.x = v0.w;
  r10.y = v1.w;
  r10.z = v7.w;
  r11.xyz = r10.xyz * r2.zzz;
  r11.xyz = max(float3(0,0,0), r11.xyz);
  r9.xyz = r11.xyz + r9.xyz;
  r11.xyz = v3.xyz * r2.www + v6.xyz;
  r2.z = dot(r11.xyz, r11.xyz);
  r2.z = rsqrt(r2.z);
  r11.xyz = r11.xyz * r2.zzz;
  r12.xyz = v3.xyz * r2.www + v7.xyz;
  r2.z = dot(r12.xyz, r12.xyz);
  r2.z = rsqrt(r2.z);
  r12.xyz = r12.xyz * r2.zzz;
  r11.x = saturate(dot(-r11.xyz, r3.xyz));
  r11.y = saturate(dot(-r12.xyz, r3.xyz));
  r2.zw = log2(r11.xy);
  r2.zw = r2.zw * r0.zz;
  r2.zw = exp2(r2.zw);
  r10.xyz = r10.xyz * r2.www;
  r8.xyz = r8.xyz * r2.zzz + r10.xyz;
  r8.xyz = max(float3(0,0,0), r8.xyz);
  r8.xyz = r8.xyz * r5.xyz;
  r8.xyz = min(float3(1,1,1), r8.xyz);
  r9.xyz = r7.zzz ? r9.xyz : float3(0,0,0);
  r8.xyz = r7.zzz ? r8.xyz : float3(0,0,0);
  r2.xyzw = t14.Sample(s14_s, r2.xy).xyzw;
  r10.xyzw = float4(4,4,4,4) * r2.xyzw;
  r11.xyzw = int4(8192,64,0x8000,16) & asint(cb13[0].xxxx);
  r12.xyzw = r2.xyzw + r2.xyzw;
  r2.xyzw = r2.xyzw / cb1[0].zzzz;
  r2.xyzw = r11.xxxx ? r12.xyzw : r2.xyzw;
  r2.xyzw = r7.wwww ? r10.xyzw : r2.xyzw;
  r2.xyz = r9.xyz + r2.xyz;
  r7.xzw = r8.xyz + r2.www;
  r3.w = 1;
  r8.x = dot(cb2[80].xyzw, r3.xyzw);
  r8.y = dot(cb2[81].xyzw, r3.xyzw);
  r8.z = dot(cb2[82].xyzw, r3.xyzw);
  r8.w = dot(cb2[83].xyzw, r3.xyzw);
  r8.x = dot(r3.xyzw, r8.xyzw);
  r9.x = dot(cb2[84].xyzw, r3.xyzw);
  r9.y = dot(cb2[85].xyzw, r3.xyzw);
  r9.z = dot(cb2[86].xyzw, r3.xyzw);
  r9.w = dot(cb2[87].xyzw, r3.xyzw);
  r8.y = dot(r3.xyzw, r9.xyzw);
  r9.x = dot(cb2[88].xyzw, r3.xyzw);
  r9.y = dot(cb2[89].xyzw, r3.xyzw);
  r9.z = dot(cb2[90].xyzw, r3.xyzw);
  r9.w = dot(cb2[91].xyzw, r3.xyzw);
  r8.z = dot(r3.xyzw, r9.xyzw);
  r8.xyz = max(float3(0.0625,0.0625,0.0625), r8.xyz);
  r0.z = saturate(dot(r3.xyz, -cb3[6].xyz));
  r2.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r3.x = r3.y * 0.5 + 0.5;
  r3.yzw = -cb3[10].xyz + cb3[4].xyz;
  r3.xyz = r3.xxx * r3.yzw + cb3[10].xyz;
  r3.xyz = cb2[79].xxx * r8.xyz + r3.xyz;
  r8.xyz = cb3[0].xyz * r0.zzz;
  r9.xyz = cb3[1].xyz * r2.www;
  r10.xyz = r8.xyz * r0.www + r9.xyz;
  r10.xyz = r10.xyz + r3.xyz;
  r10.xyz = r10.xyz + r2.xyz;
  r12.xyz = r10.xyz * r0.yyy;
  r0.z = r0.z * r0.w;
  r2.w = 1 + -r0.y;
  r0.z = r0.z * r2.w + r0.y;
  r10.xyz = r10.xyz * r0.zzz;
  r10.xyz = r11.yyy ? r10.xyz : r12.xyz;
  r4.yzw = r7.xzw + r4.yzw;
  r6.xyz = saturate(float3(0.5,0.5,0.5) * r6.yzw);
  r6.xyz = cb9[11].yyy * r6.xyz;
  r6.xyz = cb9[11].xxx * r1.xyz + r6.xyz;
  r0.z = cb9[11].z * r0.x;
  r6.xyz = r0.zzz * r5.xyz + r6.xyz;
  r6.xyz = cb9[11].www * r4.yyy + r6.xyz;
  r6.xyz = cb9[12].xxx * r0.www + r6.xyz;
  r0.yzw = cb9[12].yyy * r0.yyy + r6.xyz;
  r6.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r6.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r5.xyz + r0.yzw;
  r2.w = r4.x * r4.x;
  r2.w = r2.w * r2.w;
  r2.w = r2.w * r4.x;
  r2.w = r2.w * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r2.www + r0.yzw;
  r0.yzw = cb9[13].www * r3.xyz + r0.yzw;
  r3.xyz = cb9[14].yyy * r6.xyz;
  r0.yzw = r3.xyz * r8.xyz + r0.yzw;
  r3.xyz = cb9[14].zzz * r6.xyz;
  r0.yzw = r3.xyz * r9.xyz + r0.yzw;
  r0.yzw = cb9[14].www * r2.xyz + r0.yzw;
  r2.xyz = cb9[15].xxx * r5.xyz;
  r0.yzw = r2.xyz * r4.yzw + r0.yzw;
  r2.xyz = cb9[15].yyy * r5.xyz;
  r0.yzw = r2.xyz * r4.yzw + r0.yzw;
  r0.yzw = saturate(cb9[15].zzz * r7.xzw + r0.yzw);
  r1.xyz = r10.xyz * r1.xyz;
  r2.xyz = r4.yzw * r0.xxx;
  r1.xyz = r1.xyz * r6.xyz + r2.xyz;
  r0.xyz = r11.zzz ? r0.yzw : r1.xyz;
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
  r0.xyz = r11.zzz ? r0.xyz : r2.xyz;
  r0.xyz = r11.www ? r3.xyz : r0.xyz;
  r0.w = 4 & asint(cb13[0].x);
  r2.xyz = v1.xyz + r0.xyz;
  r2.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r2.www * r3.xyz + r0.xyz;
  r0.xyz = r0.www ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r11.zzz ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.yyyy ? r1.xyzw : r0.xyzw;
  return;
}