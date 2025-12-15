#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:20 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s5_s : register(s5);

SamplerState s3_s : register(s3);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = t2.Sample(s2_s, v2.xy).yz;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xyz = t3.Sample(s3_s, v2.xy).xyz;
  r0.zw = t5.Sample(s5_s, v2.xy).xy;
  r0.y = cb7[10].w * r0.y;
  r0.y = max(1, r0.y);
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r2.w = dot(r0.zw, r0.zw);
  r2.w = 1 + -r2.w;
  r2.w = max(0, r2.w);
  r2.w = sqrt(r2.w);
  r3.xyz = v5.yzx * v4.zxy;
  r3.xyz = v4.yzx * v5.zxy + -r3.xyz;
  r3.xyz = v5.www * r3.xyz;
  r4.xyz = v5.xyz * r0.zzz;
  r3.xyz = r0.www * r3.xyz + r4.xyz;
  r3.xyz = r2.www * v4.xyz + r3.xyz;
  r0.z = dot(r3.xyz, r3.xyz);
  r0.z = rsqrt(r0.z);
  r4.xyz = r3.xyz * r0.zzz;
  r0.w = dot(v3.xyz, v3.xyz);
  r0.w = rsqrt(r0.w);
  r5.xyz = v3.xyz * r0.www;
  r6.xyz = v3.xyz * r0.www + cb3[6].xyz;
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
  r9.xyz = v3.xyz * r0.www + cb3[7].xyz;
  r3.w = dot(r9.xyz, r9.xyz);
  r3.w = rsqrt(r3.w);
  r9.xyz = r9.xyz * r3.www;
  r3.w = dot(r5.xyz, r4.xyz);
  r3.w = r3.w + r3.w;
  r10.xyz = r4.xyz * -r3.www + r5.xyz;
  r11.x = saturate(dot(r10.xyz, -cb3[6].xyz));
  r11.y = saturate(dot(r10.xyz, -cb3[7].xyz));
  r7.zw = log2(r11.xy);
  r7.zw = r7.zw * r0.yy;
  r7.zw = exp2(r7.zw);
  r3.w = cb1[0].w * cb7[8].z;
  r5.w = r0.y * 0.0397435986 + 0.0856831968;
  r7.zw = r7.zw * r5.ww;
  r6.x = dot(r5.xyz, r6.xyz);
  r6.y = dot(r5.xyz, r9.xyz);
  r6.xy = float2(1,1) + -r6.xy;
  r6.zw = r6.xy * r6.xy;
  r5.w = -cb7[8].z * cb1[0].w + 1;
  r6.zw = r6.zw * r6.zw;
  r6.zw = r6.zw * r5.ww;
  r6.xy = r6.zw * r6.xy + r3.ww;
  r6.xy = r7.zw * r6.xy;
  r9.x = dot(r4.xyz, -cb3[6].xyz);
  r3.w = saturate(r9.x);
  r3.w = r6.x * r3.w;
  r9.y = dot(r4.xyz, -cb3[7].xyz);
  r6.xzw = saturate(r9.yxy);
  r5.w = r6.y * r6.x;
  r9.xyz = cb6[1].xyz * cb7[10].xyz;
  r10.xyz = cb3[0].xyz * r3.www;
  r11.xyz = cb3[1].xyz * r5.www;
  r10.xyz = r10.xyz * r2.www + r11.xyz;
  r3.w = saturate(dot(r4.xyz, -v6.xyz));
  r11.x = v3.w;
  r11.y = v4.w;
  r11.z = v6.w;
  r12.xyz = r11.xyz * r3.www;
  r12.xyz = max(float3(0,0,0), r12.xyz);
  r3.w = saturate(dot(r4.xyz, -v7.xyz));
  r13.x = v0.w;
  r13.y = v1.w;
  r13.z = v7.w;
  r14.xyz = r13.xyz * r3.www;
  r14.xyz = max(float3(0,0,0), r14.xyz);
  r12.xyz = r14.xyz + r12.xyz;
  r14.xyz = v3.xyz * r0.www + v6.xyz;
  r3.w = dot(r14.xyz, r14.xyz);
  r3.w = rsqrt(r3.w);
  r14.xyz = r14.xyz * r3.www;
  r15.xyz = v3.xyz * r0.www + v7.xyz;
  r0.w = dot(r15.xyz, r15.xyz);
  r0.w = rsqrt(r0.w);
  r15.xyz = r15.xyz * r0.www;
  r6.x = saturate(dot(-r14.xyz, r4.xyz));
  r6.y = saturate(dot(-r15.xyz, r4.xyz));
  r6.xy = log2(r6.xy);
  r0.yw = r6.xy * r0.yy;
  r0.yw = exp2(r0.yw);
  r13.xyz = r13.xyz * r0.www;
  r11.xyz = r11.xyz * r0.yyy + r13.xyz;
  r11.xyz = max(float3(0,0,0), r11.xyz);
  r11.xyz = r11.xyz * r9.xyz;
  r11.xyz = min(float3(1,1,1), r11.xyz);
  r12.xyz = r8.yyy ? r12.xyz : float3(0,0,0);
  r11.xyz = r8.yyy ? r11.xyz : float3(0,0,0);
  r7.xyzw = t14.Sample(s14_s, r7.xy).xyzw;
  r13.xyzw = float4(4,4,4,4) * r7.xyzw;
  r14.xyzw = r7.xyzw + r7.xyzw;
  r7.xyzw = r7.xyzw / cb1[0].zzzz;
  r7.xyzw = r8.wwww ? r14.xyzw : r7.xyzw;
  r7.xyzw = r8.zzzz ? r13.xyzw : r7.xyzw;
  r7.xyz = r12.xyz + r7.xyz;
  r8.yzw = r11.xyz + r7.www;
  r4.w = 1;
  r11.x = dot(cb2[80].xyzw, r4.xyzw);
  r11.y = dot(cb2[81].xyzw, r4.xyzw);
  r11.z = dot(cb2[82].xyzw, r4.xyzw);
  r11.w = dot(cb2[83].xyzw, r4.xyzw);
  r11.x = dot(r4.xyzw, r11.xyzw);
  r12.x = dot(cb2[84].xyzw, r4.xyzw);
  r12.y = dot(cb2[85].xyzw, r4.xyzw);
  r12.z = dot(cb2[86].xyzw, r4.xyzw);
  r12.w = dot(cb2[87].xyzw, r4.xyzw);
  r11.y = dot(r4.xyzw, r12.xyzw);
  r12.x = dot(cb2[88].xyzw, r4.xyzw);
  r12.y = dot(cb2[89].xyzw, r4.xyzw);
  r12.z = dot(cb2[90].xyzw, r4.xyzw);
  r12.w = dot(cb2[91].xyzw, r4.xyzw);
  r11.z = dot(r4.xyzw, r12.xyzw);
  r11.xyz = max(float3(0.0625,0.0625,0.0625), r11.xyz);
  r0.y = r4.y * 0.5 + 0.5;
  r12.xyz = -cb3[10].xyz + cb3[4].xyz;
  r12.xyz = r0.yyy * r12.xyz + cb3[10].xyz;
  r11.xyz = cb2[79].xxx * r11.xyz + r12.xyz;
  r12.xyz = cb3[0].xyz * r6.zzz;
  r6.xyw = cb3[1].xyz * r6.www;
  r13.xyz = r12.xyz * r2.www + r6.xyw;
  r13.xyz = r13.xyz + r11.xyz;
  r13.xyz = r13.xyz + r7.xyz;
  r14.xyzw = int4(64,0x8000,16,4) & asint(cb13[0].xxxx);
  r15.xyz = r13.xyz * r0.xxx;
  r0.y = r6.z * r2.w;
  r0.w = 1 + -r0.x;
  r0.y = r0.y * r0.w + r0.x;
  r13.xyz = r13.xyz * r0.yyy;
  r13.xyz = r14.xxx ? r13.xyz : r15.xyz;
  r10.xyz = r9.xyz * r10.xyz + r8.yzw;
  r0.yzw = r3.xyz * r0.zzz + float3(1,1,1);
  r0.yzw = saturate(float3(0.5,0.5,0.5) * r0.yzw);
  r0.yzw = cb9[11].yyy * r0.yzw;
  r0.yzw = cb9[11].xxx * r1.xyz + r0.yzw;
  r3.xyz = cb9[11].zzz * r2.xyz;
  r0.yzw = r3.xyz * r9.xyz + r0.yzw;
  r0.yzw = cb9[11].www * r10.xxx + r0.yzw;
  r0.yzw = cb9[12].xxx * r2.www + r0.yzw;
  r0.xyz = cb9[12].yyy * r0.xxx + r0.yzw;
  r3.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.xyz = cb9[13].xxx * r3.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r9.xyz + r0.xyz;
  r0.w = dot(-r5.xyz, r4.xyz);
  r0.w = 1 + -r0.w;
  r2.w = r0.w * r0.w;
  r2.w = r2.w * r2.w;
  r0.w = r2.w * r0.w;
  r0.w = r0.w * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r0.www + r0.xyz;
  r0.xyz = cb9[13].www * r11.xyz + r0.xyz;
  r4.xyz = cb9[14].yyy * r3.xyz;
  r0.xyz = r4.xyz * r12.xyz + r0.xyz;
  r4.xyz = cb9[14].zzz * r3.xyz;
  r0.xyz = r4.xyz * r6.xyw + r0.xyz;
  r0.xyz = cb9[14].www * r7.xyz + r0.xyz;
  r4.xyz = cb9[15].xxx * r9.xyz;
  r0.xyz = r4.xyz * r10.xyz + r0.xyz;
  r4.xyz = cb9[15].yyy * r9.xyz;
  r0.xyz = r4.xyz * r10.xyz + r0.xyz;
  r0.xyz = saturate(cb9[15].zzz * r8.yzw + r0.xyz);
  r1.xyz = r13.xyz * r1.xyz;
  r2.xyz = r10.xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = r14.yyy ? r0.xyz : r1.xyz;
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
  r0.xyz = r14.yyy ? r0.xyz : r1.xyz;
  r0.xyz = r14.zzz ? r3.xyz : r0.xyz;
  r1.xyz = v1.xyz + r0.xyz;
  r3.x = saturate(v1.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r0.xyz = r14.www ? r1.xyz : r0.xyz;
  r1.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r1.xyz = cb9[12].www * v0.xyz + r1.xyz;
  r2.xyz = r14.yyy ? r1.xyz : r0.xyz;
  r0.x = r1.w * r0.w + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r8.xxxx ? r2.xyzw : r0.xyzw;
  return;
}