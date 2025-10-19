#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:11 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s3_s : register(s3);

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

cbuffer cb9 : register(b9)
{
  float4 cb9[1];
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xy = cb7[4].xy * v0.xy;
  r1.x = t3.Sample(s3_s, r1.xy).y;
  r2.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r1.y = v2.w * r2.w;
  r2.xyz = -r2.xyz * r2.xyz + float3(1,1,1);
  r1.yzw = -r2.xyz * r1.yyy + float3(1,1,1);
  r0.xyz = r1.yzw * r0.xyz;
  r1.yzw = -cb3[5].xyz + float3(1,1,1);
  r2.x = dot(v3.xyz, v3.xyz);
  r2.x = rsqrt(r2.x);
  r2.xyz = v3.xyz * r2.xxx;
  r2.w = dot(v4.xyz, v4.xyz);
  r2.w = rsqrt(r2.w);
  r3.xyz = v4.xyz * r2.www;
  r4.xy = cb12[29].zw * v7.xy;
  r4.zw = int2(8,4) & asint(cb13[0].xx);
  if (r4.z != 0) {
    r5.xyz = t13.Sample(s13_s, r4.xy).xyw;
  } else {
    r5.xyz = float3(1,1,1);
  }
  r6.xyzw = t14.Sample(s14_s, r4.xy).xyzw;
  r6.xyzw = r6.xyzw / cb1[0].zzzz;
  r4.xy = r5.xy * cb1[9].xz + cb1[9].yw;
  r4.xy = r4.zz ? r4.xy : r5.xy;
  r3.w = r4.x * r4.y;
  r1.yzw = r3.www * r1.yzw + cb3[5].xyz;
  r5.xyz = v1.xyz * r5.zzz;
  r7.xyz = r1.yzw * cb1[11].xxx + cb1[11].yyy;
  r3.w = cb1[11].z + cb1[11].w;
  r7.xyz = r7.xyz * r3.www;
  r7.xyz = r4.zzz ? r7.xyz : r1.yzw;
  r8.xyz = cb7[11].xyz * cb9[0].xxx + cb9[0].yyy;
  r3.w = saturate(dot(r2.xyz, -cb3[6].xyz));
  r4.x = saturate(dot(r2.xyz, -cb3[7].xyz));
  r9.xyz = cb3[0].xyz * r3.www;
  r10.xyz = cb3[1].xyz * r4.xxx;
  r11.xyz = cb6[0].xyz * cb7[9].xyz;
  r10.xyz = r10.xyz * r4.yyy;
  r9.xyz = r9.xyz * r1.yzw + r10.xyz;
  r9.xyz = r11.xyz * r9.xyz + cb1[13].xyz;
  r8.xyz = r8.xyz * r0.xyz + r9.xyz;
  r9.xyz = v5.xyz * r7.xyz;
  r8.xyz = r8.xyz * r5.xyz + r9.xyz;
  r9.xyz = v4.xyz * r2.www + cb3[6].xyz;
  r2.w = dot(r9.xyz, r9.xyz);
  r2.w = rsqrt(r2.w);
  r9.xyz = r9.xyz * r2.www;
  r2.w = saturate(dot(-r9.xyz, r2.xyz));
  r2.x = saturate(dot(-r3.xyz, r2.xyz));
  r3.x = log2(r2.w);
  r3.y = log2(r2.x);
  r2.xy = cb7[10].ww * r3.xy;
  r2.xy = exp2(r2.xy);
  r2.xzw = cb3[0].xyz * r2.xxx;
  r3.xyz = cb3[1].xyz * r2.yyy;
  r3.xyz = r3.xyz * r4.xxx;
  r1.yzw = r2.xzw * r1.yzw + r3.xyz;
  r2.xzw = cb6[1].xyz * cb7[10].xyz;
  r1.yzw = r2.xzw * r1.yzw;
  r2.xyz = v6.xyz * r2.yyy;
  r2.xyz = r2.xyz * r7.xyz;
  r1.yzw = r1.yzw * r5.xyz + r2.xyz;
  r2.xyz = r6.xyz * r4.yyy + r8.xyz;
  r1.yzw = r6.www * r4.yyy + r1.yzw;
  r1.xyz = r1.yzw * r1.xxx;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
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
  r0.xyz = r4.www ? r2.xyz : r0.xyz;
  r1.xyz = cb9[0].zzz + r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r4.zzzz ? r1.xyzw : r0.xyzw;
  return;
}