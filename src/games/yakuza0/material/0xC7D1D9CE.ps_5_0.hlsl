#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:17 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[8];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[14];
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
  float4 cb7[12];
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
  float4 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r2.xyz = t3.Sample(s3_s, r1.xy).xyz;
  r3.xyzw = t1.Sample(s1_s, v0.xy).xyzw;
  r4.xyz = t4.Sample(s4_s, r1.xy).xyz;
  r5.xyzw = t2.Sample(s2_s, v0.xy).xyzw;
  r1.xyz = t5.Sample(s5_s, r1.xy).xyz;
  r6.xy = t7.Sample(s7_s, v0.zw).xy;
  r1.w = v2.w * r3.w;
  r2.w = v1.w * r5.w;
  r3.xyz = r3.xyz * r3.xyz + -r0.xyz;
  r0.xyz = r1.www * r3.xyz + r0.xyz;
  r3.xyz = r4.xyz + -r2.xyz;
  r2.xyz = r1.www * r3.xyz + r2.xyz;
  r3.xyz = float3(1,1,1) + -r5.xyz;
  r3.xyz = -r3.xyz * r2.www + float3(1,1,1);
  r0.xyz = r3.xyz * r0.xyz;
  r1.xyz = float3(1,1,1) + -r1.xyz;
  r1.xyz = -r1.xyz * r2.www + float3(1,1,1);
  r1.xyz = r1.xyz * r2.xyz;
  r1.w = r6.y * cb1[10].x + cb1[10].y;
  r1.w = r6.x * r1.w;
  r2.xyz = -cb3[5].xyz + float3(1,1,1);
  r3.xyz = r1.www * r2.xyz + cb3[5].xyz;
  r1.w = dot(v3.xyz, v3.xyz);
  r1.w = rsqrt(r1.w);
  r4.xyz = v3.xyz * r1.www;
  r1.w = dot(v4.xyz, v4.xyz);
  r1.w = rsqrt(r1.w);
  r5.xyz = v4.xyz * r1.www;
  r6.yz = cb12[29].zw * v7.xy;
  r7.xy = int2(8,4) & asint(cb13[0].xx);
  if (r7.x != 0) {
    r8.xyz = t13.Sample(s13_s, r6.yz).xyw;
  } else {
    r8.xyz = float3(1,1,1);
  }
  r9.xyzw = t14.Sample(s14_s, r6.yz).xyzw;
  r9.xyzw = r9.xyzw / cb1[0].zzzz;
  r6.yz = r8.xy * cb1[9].xz + cb1[9].yw;
  r6.yz = r7.xx ? r6.yz : r8.xy;
  r2.w = r6.y * r6.z;
  r2.xyz = r2.www * r2.xyz + cb3[5].xyz;
  r8.xyw = v1.xyz * r3.xyz;
  r8.xyz = r8.xyw * r8.zzz;
  r10.xyz = r2.xyz * r3.xyz;
  r11.xyz = r2.xyz * cb1[11].xxx + cb1[11].yyy;
  r3.xyz = r3.xyz * cb1[11].zzz + cb1[11].www;
  r3.xyz = r11.xyz * r3.xyz;
  r3.xyz = r7.xxx ? r3.xyz : r10.xyz;
  r2.w = saturate(dot(r4.xyz, -cb3[6].xyz));
  r3.w = saturate(dot(r4.xyz, -cb3[7].xyz));
  r10.xyz = cb3[0].xyz * r2.www;
  r11.xyz = cb3[1].xyz * r3.www;
  r12.xyz = cb6[0].xyz * cb7[9].xyz;
  r11.xyz = r11.xyz * r6.zzz;
  r10.xyz = r10.xyz * r2.xyz + r11.xyz;
  r10.xyz = r12.xyz * r10.xyz + cb1[13].xyz;
  r10.xyz = cb7[11].xyz * r0.xyz + r10.xyz;
  r11.xyz = v5.xyz * r3.xyz;
  r11.xyz = r11.xyz * r6.xxx;
  r10.xyz = r10.xyz * r8.xyz + r11.xyz;
  r11.xyz = v4.xyz * r1.www + cb3[6].xyz;
  r1.w = dot(r11.xyz, r11.xyz);
  r1.w = rsqrt(r1.w);
  r11.xyz = r11.xyz * r1.www;
  r1.w = saturate(dot(-r11.xyz, r4.xyz));
  r2.w = saturate(dot(-r5.xyz, r4.xyz));
  r4.x = log2(r1.w);
  r4.y = log2(r2.w);
  r4.xy = cb7[10].ww * r4.xy;
  r4.xy = exp2(r4.xy);
  r4.xzw = cb3[0].xyz * r4.xxx;
  r5.xyz = cb3[1].xyz * r4.yyy;
  r5.xyz = r5.xyz * r3.www;
  r2.xyz = r4.xzw * r2.xyz + r5.xyz;
  r4.xzw = cb6[1].xyz * cb7[10].xyz;
  r2.xyz = r4.xzw * r2.xyz;
  r4.xyz = v6.xyz * r4.yyy;
  r3.xyz = r4.xyz * r3.xyz;
  r3.xyz = r3.xyz * r6.xxx;
  r2.xyz = r2.xyz * r8.xyz + r3.xyz;
  r3.xyz = r9.xyz * r6.zzz + r10.xyz;
  r2.xyz = r9.www * r6.zzz + r2.xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = r3.xyz * r0.xyz + r1.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r0.xyz, cb1[0].x);

  r2.xyz = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r3.xyz = r2.xyz * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r2.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r3.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.3790642,1.3790642,1.3790642) * r0.xyz);

  MarkerFunction2(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r2.xyz = v2.xyz + r0.xyz;
  r0.w = saturate(v2.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r7.yyy ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.xxxx ? r1.xyzw : r0.xyzw;
  return;
}