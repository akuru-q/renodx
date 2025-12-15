#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:10 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t2.Sample(s2_s, v2.xy).xyz;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r0.z = cb7[10].w * r0.z;
  r0.z = max(1, r0.z);
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = rsqrt(r0.w);
  r2.xyz = v4.xyz * r0.www;
  r3.x = dot(v3.xyz, v3.xyz);
  r3.x = rsqrt(r3.x);
  r3.yzw = v3.xyz * r3.xxx;
  r4.xyz = v3.xyz * r3.xxx + cb3[6].xyz;
  r4.w = dot(r4.xyz, r4.xyz);
  r4.w = rsqrt(r4.w);
  r4.xyz = r4.xyz * r4.www;
  r5.xy = cb12[29].zw * v7.xy;
  r6.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r5.zw = t13.Sample(s13_s, r5.xy).xy;
  } else {
    r5.zw = float2(1,1);
  }
  r7.xy = r5.zw * cb1[12].xz + cb1[12].yw;
  r5.zw = r6.xx ? r7.xy : r5.zw;
  r4.w = min(r5.z, r5.w);
  r7.xyz = v3.xyz * r3.xxx + cb3[7].xyz;
  r5.z = dot(r7.xyz, r7.xyz);
  r5.z = rsqrt(r5.z);
  r7.xyz = r7.xyz * r5.zzz;
  r5.z = dot(r3.yzw, r2.xyz);
  r5.z = r5.z + r5.z;
  r8.xyz = r2.xyz * -r5.zzz + r3.yzw;
  r9.x = saturate(dot(r8.xyz, -cb3[6].xyz));
  r9.y = saturate(dot(r8.xyz, -cb3[7].xyz));
  r5.zw = log2(r9.xy);
  r5.zw = r5.zw * r0.zz;
  r5.zw = exp2(r5.zw);
  r7.w = cb1[0].w * cb7[8].z;
  r8.x = r0.z * 0.0397435986 + 0.0856831968;
  r5.zw = r8.xx * r5.zw;
  r4.x = dot(r3.yzw, r4.xyz);
  r4.y = dot(r3.yzw, r7.xyz);
  r4.xy = float2(1,1) + -r4.xy;
  r7.xy = r4.xy * r4.xy;
  r4.z = -cb7[8].z * cb1[0].w + 1;
  r7.xy = r7.xy * r7.xy;
  r7.xy = r7.xy * r4.zz;
  r4.xy = r7.xy * r4.xy + r7.ww;
  r4.xy = r5.zw * r4.xy;
  r7.x = dot(r2.xyz, -cb3[6].xyz);
  r4.z = saturate(r7.x);
  r4.x = r4.x * r4.z;
  r7.y = dot(r2.xyz, -cb3[7].xyz);
  r7.xyz = saturate(r7.yxy);
  r4.y = r7.x * r4.y;
  r8.xyz = cb6[1].xyz * cb7[10].xyz;
  r9.xyz = cb3[0].xyz * r4.xxx;
  r4.xyz = cb3[1].xyz * r4.yyy;
  r4.xyz = r9.xyz * r4.www + r4.xyz;
  r5.z = saturate(dot(r2.xyz, -v5.xyz));
  r9.x = v3.w;
  r9.y = v4.w;
  r9.z = v5.w;
  r10.xyz = r9.xyz * r5.zzz;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r5.z = saturate(dot(r2.xyz, -v6.xyz));
  r11.x = v0.w;
  r11.y = v1.w;
  r11.z = v6.w;
  r12.xyz = r11.xyz * r5.zzz;
  r12.xyz = max(float3(0,0,0), r12.xyz);
  r10.xyz = r12.xyz + r10.xyz;
  r12.xyz = v3.xyz * r3.xxx + v5.xyz;
  r5.z = dot(r12.xyz, r12.xyz);
  r5.z = rsqrt(r5.z);
  r12.xyz = r12.xyz * r5.zzz;
  r13.xyz = v3.xyz * r3.xxx + v6.xyz;
  r3.x = dot(r13.xyz, r13.xyz);
  r3.x = rsqrt(r3.x);
  r13.xyz = r13.xyz * r3.xxx;
  r12.x = saturate(dot(-r12.xyz, r2.xyz));
  r12.y = saturate(dot(-r13.xyz, r2.xyz));
  r5.zw = log2(r12.xy);
  r5.zw = r5.zw * r0.zz;
  r5.zw = exp2(r5.zw);
  r11.xyz = r11.xyz * r5.www;
  r9.xyz = r9.xyz * r5.zzz + r11.xyz;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r9.xyz = r9.xyz * r8.xyz;
  r9.xyz = min(float3(1,1,1), r9.xyz);
  r10.xyz = r6.yyy ? r10.xyz : float3(0,0,0);
  r9.xyz = r6.yyy ? r9.xyz : float3(0,0,0);
  r5.xyzw = t14.Sample(s14_s, r5.xy).xyzw;
  r11.xyzw = float4(4,4,4,4) * r5.xyzw;
  r12.xyzw = r5.xyzw + r5.xyzw;
  r5.xyzw = r5.xyzw / cb1[0].zzzz;
  r5.xyzw = r6.wwww ? r12.xyzw : r5.xyzw;
  r5.xyzw = r6.zzzz ? r11.xyzw : r5.xyzw;
  r5.xyz = r10.xyz + r5.xyz;
  r6.yzw = r9.xyz + r5.www;
  r2.w = 1;
  r9.x = dot(cb2[80].xyzw, r2.xyzw);
  r9.y = dot(cb2[81].xyzw, r2.xyzw);
  r9.z = dot(cb2[82].xyzw, r2.xyzw);
  r9.w = dot(cb2[83].xyzw, r2.xyzw);
  r9.x = dot(r2.xyzw, r9.xyzw);
  r10.x = dot(cb2[84].xyzw, r2.xyzw);
  r10.y = dot(cb2[85].xyzw, r2.xyzw);
  r10.z = dot(cb2[86].xyzw, r2.xyzw);
  r10.w = dot(cb2[87].xyzw, r2.xyzw);
  r9.y = dot(r2.xyzw, r10.xyzw);
  r10.x = dot(cb2[88].xyzw, r2.xyzw);
  r10.y = dot(cb2[89].xyzw, r2.xyzw);
  r10.z = dot(cb2[90].xyzw, r2.xyzw);
  r10.w = dot(cb2[91].xyzw, r2.xyzw);
  r9.z = dot(r2.xyzw, r10.xyzw);
  r9.xyz = max(float3(0.0625,0.0625,0.0625), r9.xyz);
  r0.z = r2.y * 0.5 + 0.5;
  r10.xyz = -cb3[10].xyz + cb3[4].xyz;
  r10.xyz = r0.zzz * r10.xyz + cb3[10].xyz;
  r9.xyz = cb2[79].xxx * r9.xyz + r10.xyz;
  r10.xyz = cb3[0].xyz * r7.yyy;
  r7.xzw = cb3[1].xyz * r7.zzz;
  r11.xyz = r10.xyz * r4.www + r7.xzw;
  r11.xyz = r11.xyz + r9.xyz;
  r11.xyz = r11.xyz + r5.xyz;
  r12.xyzw = int4(64,0x8000,16,4) & asint(cb13[0].xxxx);
  r13.xyz = r11.xyz * r0.yyy;
  r0.z = r7.y * r4.w;
  r2.w = 1 + -r0.y;
  r0.z = r0.z * r2.w + r0.y;
  r11.xyz = r11.xyz * r0.zzz;
  r11.xyz = r12.xxx ? r11.xyz : r13.xyz;
  r4.xyz = r8.xyz * r4.xyz + r6.yzw;
  r13.xyz = v4.xyz * r0.www + float3(1,1,1);
  r13.xyz = saturate(float3(0.5,0.5,0.5) * r13.xyz);
  r13.xyz = cb9[11].yyy * r13.xyz;
  r13.xyz = cb9[11].xxx * r1.xyz + r13.xyz;
  r0.z = cb9[11].z * r0.x;
  r13.xyz = r0.zzz * r8.xyz + r13.xyz;
  r13.xyz = cb9[11].www * r4.xxx + r13.xyz;
  r13.xyz = cb9[12].xxx * r4.www + r13.xyz;
  r0.yzw = cb9[12].yyy * r0.yyy + r13.xyz;
  r13.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r13.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r8.xyz + r0.yzw;
  r2.x = dot(-r3.yzw, r2.xyz);
  r2.x = 1 + -r2.x;
  r2.y = r2.x * r2.x;
  r2.y = r2.y * r2.y;
  r2.x = r2.y * r2.x;
  r2.x = r2.x * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r2.xxx + r0.yzw;
  r0.yzw = cb9[13].www * r9.xyz + r0.yzw;
  r2.xyz = cb9[14].yyy * r13.xyz;
  r0.yzw = r2.xyz * r10.xyz + r0.yzw;
  r2.xyz = cb9[14].zzz * r13.xyz;
  r0.yzw = r2.xyz * r7.xzw + r0.yzw;
  r0.yzw = cb9[14].www * r5.xyz + r0.yzw;
  r2.xyz = cb9[15].xxx * r8.xyz;
  r0.yzw = r2.xyz * r4.xyz + r0.yzw;
  r2.xyz = cb9[15].yyy * r8.xyz;
  r0.yzw = r2.xyz * r4.xyz + r0.yzw;
  r0.yzw = saturate(cb9[15].zzz * r6.yzw + r0.yzw);
  r1.xyz = r11.xyz * r1.xyz;
  r2.xyz = r4.xyz * r0.xxx;
  r1.xyz = r1.xyz * r13.xyz + r2.xyz;
  r0.xyz = r12.yyy ? r0.yzw : r1.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r2.w = r1.w * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r1.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r1.xyz, cb1[0].x);

  r3.xyz = log2(r1.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r1.xyz + r1.xyz;
  r5.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.xyz * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.xyz = r1.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.xyz = r4.xyz * r1.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.xyz = r5.xyz / r1.xyz;
  r1.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.xyz;
  r1.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.xyz);

  MaterialPostTonemap(r1.xyz);

  r1.xyz = sqrt(r1.xyz);
  r0.xyz = r12.yyy ? r0.xyz : r1.xyz;
  r0.xyz = r12.zzz ? r3.xyz : r0.xyz;
  r1.xyz = v1.xyz + r0.xyz;
  r3.x = saturate(v1.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r0.xyz = r12.www ? r1.xyz : r0.xyz;
  r1.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r1.xyz = cb9[12].www * v0.xyz + r1.xyz;
  r2.xyz = r12.yyy ? r1.xyz : r0.xyz;
  r0.x = r1.w * r0.w + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r6.xxxx ? r2.xyzw : r0.xyzw;
  return;
}