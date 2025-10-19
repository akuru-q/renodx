#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:21 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[12];
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
  float2 v1 : TEXCOORD1,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : TEXCOORD6,
  float4 v9 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r1.x = t3.Sample(s3_s, r1.xy).x;
  r1.yz = t5.Sample(s5_s, r1.zw).xy;
  r2.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r3.xyzw = cb7[5].xyzw * v0.zwzw;
  r1.w = t3.Sample(s3_s, r3.xy).y;
  r3.xy = t6.Sample(s6_s, r3.zw).xy;
  r4.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
  r5.xyzw = cb7[5].xyzw * v1.xyxy;
  r3.z = t3.Sample(s3_s, r5.xy).z;
  r5.xy = t7.Sample(s7_s, r5.zw).xy;
  r2.w = v3.w * r2.w;
  r3.w = v2.w * r4.w;
  r2.xyz = r2.xyz * r2.xyz + -r0.xyz;
  r0.xyz = r2.www * r2.xyz + r0.xyz;
  r2.xyz = r4.xyz * r4.xyz + -r0.xyz;
  r0.xyz = r3.www * r2.xyz + r0.xyz;
  r1.w = r1.w + -r1.x;
  r1.x = r2.w * r1.w + r1.x;
  r1.w = r3.z + -r1.x;
  r1.x = r3.w * r1.w + r1.x;
  r2.xy = r3.xy + -r1.yz;
  r1.yz = r2.ww * r2.xy + r1.yz;
  r2.xy = r5.xy + -r1.yz;
  r1.yz = r3.ww * r2.xy + r1.yz;
  r1.yz = r1.yz * float2(2,2) + float2(-1,-1);
  r1.w = dot(r1.yz, r1.yz);
  r1.w = 1 + -r1.w;
  r1.w = max(0, r1.w);
  r1.w = sqrt(r1.w);
  r2.xyz = -cb3[5].xyz + float3(1,1,1);
  r3.xyz = v8.yzx * v4.zxy;
  r3.xyz = v4.yzx * v8.zxy + -r3.xyz;
  r3.xyz = v8.www * r3.xyz;
  r4.xyz = v8.xyz * r1.yyy;
  r3.xyz = r1.zzz * r3.xyz + r4.xyz;
  r1.yzw = r1.www * v4.xyz + r3.xyz;
  r2.w = dot(r1.yzw, r1.yzw);
  r2.w = rsqrt(r2.w);
  r1.yzw = r2.www * r1.yzw;
  r2.w = dot(v5.xyz, v5.xyz);
  r2.w = rsqrt(r2.w);
  r3.xy = cb12[29].zw * v9.xy;
  r3.zw = int2(8,4) & asint(cb13[0].xx);
  if (r3.z != 0) {
    r4.xyz = t13.Sample(s13_s, r3.xy).xyw;
  } else {
    r4.xyz = float3(1,1,1);
  }
  r5.xyzw = t14.Sample(s14_s, r3.xy).xyzw;
  r5.xyzw = r5.xyzw / cb1[0].zzzz;
  r3.xy = r4.xy * cb1[9].xz + cb1[9].yw;
  r3.xy = r3.zz ? r3.xy : r4.xy;
  r3.x = r3.x * r3.y;
  r2.xyz = r3.xxx * r2.xyz + cb3[5].xyz;
  r4.xyz = v2.xyz * r4.zzz;
  r6.xyz = r2.xyz * cb1[11].xxx + cb1[11].yyy;
  r3.x = cb1[11].z + cb1[11].w;
  r6.xyz = r6.xyz * r3.xxx;
  r6.xyz = r3.zzz ? r6.xyz : r2.xyz;
  r5.xyz = r5.xyz * r3.yyy + v6.xyz;
  r7.xyz = r5.www * r3.yyy + v7.xyz;
  r3.x = saturate(dot(r1.yzw, -cb3[6].xyz));
  r4.w = saturate(dot(r1.yzw, -cb3[7].xyz));
  r8.xyz = cb3[0].xyz * r3.xxx;
  r9.xyz = cb3[1].xyz * r4.www;
  r10.xyz = cb6[0].xyz * cb7[9].xyz;
  r9.xyz = r9.xyz * r3.yyy;
  r8.xyz = r8.xyz * r2.xyz + r9.xyz;
  r8.xyz = r10.xyz * r8.xyz + cb1[13].xyz;
  r8.xyz = cb7[11].xyz * r0.xyz + r8.xyz;
  r5.xyz = r5.xyz * r6.xyz;
  r5.xyz = r8.xyz * r4.xyz + r5.xyz;
  r8.xyz = v5.xyz * r2.www + cb3[6].xyz;
  r3.x = dot(r8.xyz, r8.xyz);
  r3.x = rsqrt(r3.x);
  r8.xyz = r8.xyz * r3.xxx;
  r3.x = saturate(dot(-r8.xyz, r1.yzw));
  r8.xyz = v5.xyz * r2.www + float3(0,-0.300000012,0);
  r2.w = dot(r8.xyz, r8.xyz);
  r2.w = rsqrt(r2.w);
  r8.xyz = r8.xyz * r2.www;
  r1.y = saturate(dot(-r8.xyz, r1.yzw));
  r3.x = log2(r3.x);
  r3.y = log2(r1.y);
  r1.yz = cb7[10].ww * r3.xy;
  r1.yz = exp2(r1.yz);
  r1.w = cb3[11].x + cb3[11].x;
  r8.xyz = cb3[0].xyz * r1.yyy;
  r9.xyz = cb3[1].xyz * r1.zzz;
  r9.xyz = r9.xyz * r1.www;
  r9.xyz = r9.xyz * r4.www;
  r2.xyz = r8.xyz * r2.xyz + r9.xyz;
  r8.xyz = cb6[1].xyz * cb7[10].xyz;
  r2.xyz = r8.xyz * r2.xyz;
  r1.yzw = r7.xyz * r1.zzz;
  r1.yzw = r1.yzw * r6.xyz;
  r1.yzw = r2.xyz * r4.xyz + r1.yzw;
  r1.xyz = r1.yzw * r1.xxx;
  r0.xyz = r5.xyz * r0.xyz + r1.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r0.xyz, cb1[0].x);

  r2.xyz = r0.xyz + r0.xyz;
  r4.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r4.xyz = r2.xyz * r4.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r2.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r4.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r0.xyz);

  MarkerFunction2(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r4.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r4.xyz + r0.xyz;
  r1.xyz = r3.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r3.zzzz ? r1.xyzw : r0.xyzw;
  return;
}