#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:05 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s5_s : register(s5);

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
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r2.xyz = t3.Sample(s3_s, r1.xy).xyz;
  r1.xy = t5.Sample(s5_s, r1.zw).xy;
  r3.xyz = t1.Sample(s1_s, v0.zw).xyz;
  r3.xyz = r3.xyz * r3.xyz;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r1.z = dot(r1.xy, r1.xy);
  r1.z = 1 + -r1.z;
  r1.z = max(0, r1.z);
  r1.z = sqrt(r1.z);
  r4.xyz = -cb3[5].xyz + float3(1,1,1);
  r5.xyz = v7.yzx * v3.zxy;
  r5.xyz = v3.yzx * v7.zxy + -r5.xyz;
  r5.xyz = v7.www * r5.xyz;
  r6.xyz = v7.xyz * r1.xxx;
  r1.xyw = r1.yyy * r5.xyz + r6.xyz;
  r1.xyz = r1.zzz * v3.xyz + r1.xyw;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r1.w = dot(v4.xyz, v4.xyz);
  r1.w = rsqrt(r1.w);
  r5.xyz = v4.xyz * r1.www;
  r6.xy = cb12[29].zw * v8.xy;
  r6.zw = int2(8,4) & asint(cb13[0].xx);
  if (r6.z != 0) {
    r7.xyz = t13.Sample(s13_s, r6.xy).xyw;
  } else {
    r7.xyz = float3(1,1,1);
  }
  r8.xyzw = t14.Sample(s14_s, r6.xy).xyzw;
  r8.xyzw = r8.xyzw / cb1[0].zzzz;
  r6.xy = r7.xy * cb1[9].xz + cb1[9].yw;
  r6.xy = r6.zz ? r6.xy : r7.xy;
  r2.w = r6.x * r6.y;
  r4.xyz = r2.www * r4.xyz + cb3[5].xyz;
  r7.xyz = v1.xyz * r7.zzz;
  r9.xyz = r4.xyz * cb1[11].xxx + cb1[11].yyy;
  r2.w = cb1[11].z + cb1[11].w;
  r9.xyz = r9.xyz * r2.www;
  r9.xyz = r6.zzz ? r9.xyz : r4.xyz;
  r2.w = saturate(dot(r1.xyz, -cb3[6].xyz));
  r3.w = saturate(dot(r1.xyz, -cb3[7].xyz));
  r10.xyz = cb3[0].xyz * r2.www;
  r11.xyz = cb3[1].xyz * r3.www;
  r12.xyz = cb6[0].xyz * cb7[9].xyz;
  r11.xyz = r11.xyz * r6.yyy;
  r10.xyz = r10.xyz * r4.xyz + r11.xyz;
  r10.xyz = r12.xyz * r10.xyz + cb1[13].xyz;
  r10.xyz = cb7[11].xyz * r0.xyz + r10.xyz;
  r11.xyz = v5.xyz * r9.xyz;
  r10.xyz = r10.xyz * r7.xyz + r11.xyz;
  r11.xyz = v4.xyz * r1.www + cb3[6].xyz;
  r1.w = dot(r11.xyz, r11.xyz);
  r1.w = rsqrt(r1.w);
  r11.xyz = r11.xyz * r1.www;
  r1.w = saturate(dot(-r11.xyz, r1.xyz));
  r1.x = saturate(dot(-r5.xyz, r1.xyz));
  r5.x = log2(r1.w);
  r5.y = log2(r1.x);
  r1.xy = cb7[10].ww * r5.xy;
  r1.xy = exp2(r1.xy);
  r1.xzw = cb3[0].xyz * r1.xxx;
  r5.xyz = cb3[1].xyz * r1.yyy;
  r5.xyz = r5.xyz * r3.www;
  r1.xzw = r1.xzw * r4.xyz + r5.xyz;
  r4.xyz = cb6[1].xyz * cb7[10].xyz;
  r1.xzw = r4.xyz * r1.xzw;
  r4.xyz = v6.xyz * r1.yyy;
  r4.xyz = r4.xyz * r9.xyz;
  r1.xyz = r1.xzw * r7.xyz + r4.xyz;
  r4.xyz = r8.xyz * r6.yyy + r10.xyz;
  r1.xyz = r8.www * r6.yyy + r1.xyz;
  r1.xyz = r1.xyz * r2.xyz;
  r0.xyz = r4.xyz * r0.xyz + r1.xyz;
  r0.xyz = r3.xyz * v2.www + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r0.xyz = cb9[0].xyz + r0.xyz;
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
  r1.xyz = r6.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r6.zzzz ? r1.xyzw : r0.xyzw;
  return;
}