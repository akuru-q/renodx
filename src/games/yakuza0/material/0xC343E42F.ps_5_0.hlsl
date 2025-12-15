#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:17 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

TextureCube<float4> t6 : register(t6);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

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
  float2 v1 : TEXCOORD1,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float3 v7 : TEXCOORD5,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r2.xy = t7.Sample(s7_s, v1.xy).xy;
  r1.w = v3.w * r1.w;
  r1.xyz = r1.xyz * r1.xyz + -r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r1.x = r2.y * cb1[10].x + cb1[10].y;
  r1.x = r2.x * r1.x;
  r1.yzw = -cb3[5].xyz + float3(1,1,1);
  r2.yzw = r1.xxx * r1.yzw + cb3[5].xyz;
  r1.x = dot(v4.xyz, v4.xyz);
  r1.x = rsqrt(r1.x);
  r3.xyz = v4.xyz * r1.xxx;
  r1.x = dot(v5.xyz, v5.xyz);
  r1.x = rsqrt(r1.x);
  r4.xyz = v5.xyz * r1.xxx;
  r5.xy = cb12[29].zw * v8.xy;
  r5.zw = int2(8,4) & asint(cb13[0].xx);
  if (r5.z != 0) {
    r6.xyz = t13.Sample(s13_s, r5.xy).xyw;
  } else {
    r6.xyz = float3(1,1,1);
  }
  r7.xyzw = t14.Sample(s14_s, r5.xy).xyzw;
  r7.xyzw = r7.xyzw / cb1[0].zzzz;
  r5.xy = r6.xy * cb1[9].xz + cb1[9].yw;
  r5.xy = r5.zz ? r5.xy : r6.xy;
  r3.w = r5.x * r5.y;
  r1.yzw = r3.www * r1.yzw + cb3[5].xyz;
  r6.xyw = v2.xyz * r2.yzw;
  r6.xyz = r6.xyw * r6.zzz;
  r8.xyz = r1.yzw * r2.yzw;
  r9.xyz = r1.yzw * cb1[11].xxx + cb1[11].yyy;
  r10.xyz = r2.yzw * cb1[11].zzz + cb1[11].www;
  r9.xyz = r10.xyz * r9.xyz;
  r8.xyz = r5.zzz ? r9.xyz : r8.xyz;
  r3.w = saturate(dot(r3.xyz, -cb3[6].xyz));
  r4.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r9.xyz = cb3[0].xyz * r3.www;
  r10.xyz = cb3[1].xyz * r4.www;
  r11.xyz = cb6[0].xyz * cb7[9].xyz;
  r10.xyz = r10.xyz * r5.yyy;
  r9.xyz = r9.xyz * r1.yzw + r10.xyz;
  r9.xyz = r11.xyz * r9.xyz + cb1[13].xyz;
  r9.xyz = cb7[11].xyz * r0.xyz + r9.xyz;
  r10.xyz = v6.xyz * r8.xyz;
  r10.xyz = r10.xyz * r2.xxx;
  r9.xyz = r9.xyz * r6.xyz + r10.xyz;
  r10.xyz = v5.xyz * r1.xxx + cb3[6].xyz;
  r1.x = dot(r10.xyz, r10.xyz);
  r1.x = rsqrt(r1.x);
  r10.xyz = r10.xyz * r1.xxx;
  r1.x = saturate(dot(-r10.xyz, r3.xyz));
  r3.w = saturate(dot(-r4.xyz, r3.xyz));
  r10.x = log2(r1.x);
  r10.y = log2(r3.w);
  r10.xy = cb7[10].ww * r10.xy;
  r10.xy = exp2(r10.xy);
  r10.xzw = cb3[0].xyz * r10.xxx;
  r11.xyz = cb3[1].xyz * r10.yyy;
  r11.xyz = r11.xyz * r4.www;
  r1.xyz = r10.xzw * r1.yzw + r11.xyz;
  r10.xzw = cb6[1].xyz * cb7[10].xyz;
  r1.xyz = r10.xzw * r1.xyz;
  r10.xyz = v7.xyz * r10.yyy;
  r8.xyz = r10.xyz * r8.xyz;
  r8.xyz = r8.xyz * r2.xxx;
  r1.xyz = r1.xyz * r6.xyz + r8.xyz;
  r6.xyz = r7.xyz * r5.yyy + r9.xyz;
  r1.xyz = r7.www * r5.yyy + r1.xyz;
  r0.xyz = r6.xyz * r0.xyz + r1.xyz;
  r1.xyz = r2.yzw * r2.xxx;
  r1.w = dot(r4.xyz, r3.xyz);
  r1.w = r1.w + r1.w;
  r2.xyz = r3.xyz * -r1.www + r4.xyz;
  r2.xyz = float3(-1,1,1) * r2.xyz;
  r2.xyzw = t6.Sample(s6_s, r2.xyz).xyzw;
  r1.w = max(0.00392156886, r2.w);
  r1.w = 0.25 / r1.w;
  r2.xyz = r2.xyz * r1.www;
  r2.xyz = r2.xyz * r2.xyz;
  r2.xyz = v4.www * r2.xyz;
  r0.xyz = r2.xyz * r1.xyz + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r0.xyz, cb1[0].x);

  r2.xyz = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r3.xyz = r2.xyz * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r2.xyz * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r3.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.3790642,1.3790642,1.3790642) * r0.xyz);

  MaterialPostTonemap(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r5.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r5.zzzz ? r1.xyzw : r0.xyzw;
  return;
}