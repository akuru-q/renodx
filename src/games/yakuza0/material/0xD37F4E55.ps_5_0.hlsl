#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:18 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

TextureCube<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s6_s : register(s6);

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
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r1.xy = t3.Sample(s3_s, r1.xy).xy;
  r1.zw = t5.Sample(s5_s, r1.zw).xy;
  r2.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r3.xyzw = cb7[5].xyzw * v0.zwzw;
  r3.xy = t4.Sample(s4_s, r3.xy).xy;
  r3.zw = t6.Sample(s6_s, r3.zw).xy;
  r2.w = v2.w * r2.w;
  r3.xy = r3.xy + -r1.xy;
  r1.xy = r2.ww * r3.xy + r1.xy;
  r2.xyz = r2.xyz * r2.xyz + -r0.xyz;
  r0.xyz = r2.www * r2.xyz + r0.xyz;
  r2.xy = r3.zw + -r1.zw;
  r1.zw = r2.ww * r2.xy + r1.zw;
  r1.zw = r1.zw * float2(2,2) + float2(-1,-1);
  r2.x = dot(r1.zw, r1.zw);
  r2.x = 1 + -r2.x;
  r2.x = max(0, r2.x);
  r2.x = sqrt(r2.x);
  r2.yzw = -cb3[5].xyz + float3(1,1,1);
  r3.xyz = v7.yzx * v3.zxy;
  r3.xyz = v3.yzx * v7.zxy + -r3.xyz;
  r3.xyz = v7.www * r3.xyz;
  r4.xyz = v7.xyz * r1.zzz;
  r3.xyz = r1.www * r3.xyz + r4.xyz;
  r3.xyz = r2.xxx * v3.xyz + r3.xyz;
  r1.z = dot(r3.xyz, r3.xyz);
  r1.z = rsqrt(r1.z);
  r3.xyz = r3.xyz * r1.zzz;
  r1.z = dot(v4.xyz, v4.xyz);
  r1.z = rsqrt(r1.z);
  r4.xyz = v4.xyz * r1.zzz;
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
  r1.w = r5.x * r5.y;
  r2.xyz = r1.www * r2.yzw + cb3[5].xyz;
  r6.xyz = v1.xyz * r6.zzz;
  r8.xyz = r2.xyz * cb1[11].xxx + cb1[11].yyy;
  r1.w = cb1[11].z + cb1[11].w;
  r8.xyz = r8.xyz * r1.www;
  r8.xyz = r5.zzz ? r8.xyz : r2.xyz;
  r1.w = saturate(dot(r3.xyz, -cb3[6].xyz));
  r2.w = saturate(dot(r3.xyz, -cb3[7].xyz));
  r9.xyz = cb3[0].xyz * r1.www;
  r10.xyz = cb3[1].xyz * r2.www;
  r11.xyz = cb6[0].xyz * cb7[9].xyz;
  r10.xyz = r10.xyz * r5.yyy;
  r9.xyz = r9.xyz * r2.xyz + r10.xyz;
  r9.xyz = r11.xyz * r9.xyz + cb1[13].xyz;
  r9.xyz = cb7[11].xyz * r0.xyz + r9.xyz;
  r10.xyz = v5.xyz * r8.xyz;
  r9.xyz = r9.xyz * r6.xyz + r10.xyz;
  r10.xyz = v4.xyz * r1.zzz + cb3[6].xyz;
  r1.z = dot(r10.xyz, r10.xyz);
  r1.z = rsqrt(r1.z);
  r10.xyz = r10.xyz * r1.zzz;
  r1.z = saturate(dot(-r10.xyz, r3.xyz));
  r1.w = saturate(dot(-r4.xyz, r3.xyz));
  r10.x = log2(r1.z);
  r10.y = log2(r1.w);
  r1.zw = cb7[10].ww * r10.xy;
  r1.zw = exp2(r1.zw);
  r10.xyz = cb3[0].xyz * r1.zzz;
  r11.xyz = cb3[1].xyz * r1.www;
  r11.xyz = r11.xyz * r2.www;
  r2.xyz = r10.xyz * r2.xyz + r11.xyz;
  r10.xyz = cb6[1].xyz * cb7[10].xyz;
  r2.xyz = r10.xyz * r2.xyz;
  r10.xyz = v6.xyz * r1.www;
  r8.xyz = r10.xyz * r8.xyz;
  r2.xyz = r2.xyz * r6.xyz + r8.xyz;
  r6.xyz = r7.xyz * r5.yyy + r9.xyz;
  r2.xyz = r7.www * r5.yyy + r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r6.xyz * r0.xyz + r1.yzw;
  r1.x = v3.w * r1.x;
  r1.y = dot(r4.xyz, r3.xyz);
  r1.y = r1.y + r1.y;
  r1.yzw = r3.xyz * -r1.yyy + r4.xyz;
  r1.yzw = float3(-1,1,1) * r1.yzw;
  r2.xyzw = t2.Sample(s2_s, r1.yzw).xyzw;
  r1.y = max(0.00392156886, r2.w);
  r1.y = 0.25 / r1.y;
  r1.yzw = r2.xyz * r1.yyy;
  r1.yzw = r1.yzw * r1.yzw;
  r0.xyz = r1.yzw * r1.xxx + r0.xyz;
  r0.w = v1.w * r0.w;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r2.w = r1.x * r0.w;
  r0.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r0.xyz, cb1[0].x);

  r1.yzw = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r3.xyz = r1.yzw * r3.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r0.xyz = r0.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r0.xyz = r1.yzw * r0.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r0.xyz = r3.xyz / r0.xyz;
  r0.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r0.xyz;
  r0.xyz = saturate(float3(1.3790642,1.3790642,1.3790642) * r0.xyz);

  MaterialPostTonemap(r0.xyz);

  r0.xyz = sqrt(r0.xyz);
  r1.yzw = v2.xyz + r0.xyz;
  r3.x = saturate(v2.x);
  r3.yzw = cb1[1].xyz + -r0.xyz;
  r0.xyz = r3.xxx * r3.yzw + r0.xyz;
  r2.xyz = r5.www ? r1.yzw : r0.xyz;
  r0.x = r0.w * r1.x + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r5.zzzz ? r2.xyzw : r0.xyzw;
  return;
}