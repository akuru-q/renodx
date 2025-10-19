#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:07 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

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
  float4 v1 : TEXCOORD1,
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r1.x = t3.Sample(s3_s, r1.xy).y;
  r1.yz = t5.Sample(s5_s, r1.zw).xy;
  r2.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r2.xyz = r2.xyz * r2.xyz;
  r3.xyz = t2.Sample(s2_s, v1.xy).xyz;
  r4.xy = t7.Sample(s7_s, v1.zw).xy;
  r1.w = v3.w * r2.w;
  r1.yz = r1.yz * float2(2,2) + float2(-1,-1);
  r2.w = dot(r1.yz, r1.yz);
  r2.w = 1 + -r2.w;
  r2.w = max(0, r2.w);
  r2.w = sqrt(r2.w);
  r3.w = r4.y * cb1[10].x + cb1[10].y;
  r3.w = r4.x * r3.w;
  r4.yzw = -cb3[5].xyz + float3(1,1,1);
  r5.xyz = r3.www * r4.yzw + cb3[5].xyz;
  r6.xyz = v8.yzx * v4.zxy;
  r6.xyz = v4.yzx * v8.zxy + -r6.xyz;
  r6.xyz = v8.www * r6.xyz;
  r7.xyz = v8.xyz * r1.yyy;
  r6.xyz = r1.zzz * r6.xyz + r7.xyz;
  r6.xyz = r2.www * v4.xyz + r6.xyz;
  r1.y = dot(r6.xyz, r6.xyz);
  r1.y = rsqrt(r1.y);
  r6.xyz = r6.xyz * r1.yyy;
  r1.y = dot(v5.xyz, v5.xyz);
  r1.y = rsqrt(r1.y);
  r7.xyz = v5.xyz * r1.yyy;
  r8.xy = cb12[29].zw * v9.xy;
  r8.zw = int2(8,4) & asint(cb13[0].xx);
  if (r8.z != 0) {
    r9.xyz = t13.Sample(s13_s, r8.xy).xyw;
  } else {
    r9.xyz = float3(1,1,1);
  }
  r10.xyzw = t14.Sample(s14_s, r8.xy).xyzw;
  r10.xyzw = r10.xyzw / cb1[0].zzzz;
  r8.xy = r9.xy * cb1[9].xz + cb1[9].yw;
  r8.xy = r8.zz ? r8.xy : r9.xy;
  r1.z = r8.x * r8.y;
  r4.yzw = r1.zzz * r4.yzw + cb3[5].xyz;
  r9.xyw = v2.xyz * r5.xyz;
  r9.xyz = r9.xyw * r9.zzz;
  r11.xyz = r4.yzw * r5.xyz;
  r12.xyz = r4.yzw * cb1[11].xxx + cb1[11].yyy;
  r5.xyz = r5.xyz * cb1[11].zzz + cb1[11].www;
  r5.xyz = r12.xyz * r5.xyz;
  r5.xyz = r8.zzz ? r5.xyz : r11.xyz;
  r1.z = saturate(dot(r6.xyz, -cb3[6].xyz));
  r2.w = saturate(dot(r6.xyz, -cb3[7].xyz));
  r11.xyz = cb3[0].xyz * r1.zzz;
  r12.xyz = cb3[1].xyz * r2.www;
  r13.xyz = cb6[0].xyz * cb7[9].xyz;
  r12.xyz = r12.xyz * r8.yyy;
  r11.xyz = r11.xyz * r4.yzw + r12.xyz;
  r11.xyz = r13.xyz * r11.xyz + cb1[13].xyz;
  r11.xyz = cb7[11].xyz * r0.xyz + r11.xyz;
  r12.xyz = v6.xyz * r5.xyz;
  r12.xyz = r12.xyz * r4.xxx;
  r11.xyz = r11.xyz * r9.xyz + r12.xyz;
  r12.xyz = v5.xyz * r1.yyy + cb3[6].xyz;
  r1.y = dot(r12.xyz, r12.xyz);
  r1.y = rsqrt(r1.y);
  r12.xyz = r12.xyz * r1.yyy;
  r1.y = saturate(dot(-r12.xyz, r6.xyz));
  r1.z = saturate(dot(-r7.xyz, r6.xyz));
  r6.x = log2(r1.y);
  r6.y = log2(r1.z);
  r1.yz = cb7[10].ww * r6.xy;
  r1.yz = exp2(r1.yz);
  r6.xyz = cb3[0].xyz * r1.yyy;
  r7.xyz = cb3[1].xyz * r1.zzz;
  r7.xyz = r7.xyz * r2.www;
  r4.yzw = r6.xyz * r4.yzw + r7.xyz;
  r6.xyz = cb6[1].xyz * cb7[10].xyz;
  r4.yzw = r6.xyz * r4.yzw;
  r6.xyz = v7.xyz * r1.zzz;
  r5.xyz = r6.xyz * r5.xyz;
  r5.xyz = r5.xyz * r4.xxx;
  r4.xyz = r4.yzw * r9.xyz + r5.xyz;
  r5.xyz = r10.xyz * r8.yyy + r11.xyz;
  r4.xyz = r10.www * r8.yyy + r4.xyz;
  r1.xyz = r4.xyz * r1.xxx;
  r0.xyz = r5.xyz * r0.xyz + r1.xyz;
  r0.xyz = r2.xyz * r1.www + r0.xyz;
  r0.xyz = r3.xyz * v2.www + r0.xyz;
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
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r8.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r8.zzzz ? r1.xyzw : r0.xyzw;
  return;
}