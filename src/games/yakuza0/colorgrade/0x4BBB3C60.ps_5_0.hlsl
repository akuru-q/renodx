#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:08 2025
Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[16];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : COLOR0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t0.Sample(s0_s, v1.xy).xyz;

  ProcessUntonemapped(r0.rgb);

  r0.w = cmp(r0.y < r0.x);
  r1.xy = r0.ww ? r0.xy : r0.yx;
  r0.w = min(r1.y, r0.z);
  r1.x = max(r1.x, r0.z);
  r1.y = r1.x + -r0.w;
  r0.w = r1.x + r0.w;
  r1.xzw = cmp(r0.xyz == r1.xxx);
  r2.xyw = r1.zwx ? float3(1,1,1) : 0;
  r1.xzw = -r0.zxy + r0.yzx;
  r1.xzw = r1.xzw / r1.yyy;
  r1.xzw = cb9[0].xxx + r1.xzw;
  r1.xzw = float3(0,2,4) + r1.xzw;
  r3.xyz = cmp(r0.xxy != r0.yzz);
  r3.xyz = r3.xyz ? float3(1,1,1) : 0;
  r2.xy = r3.xy * r2.xy;
  r2.z = r2.y * r3.z;
  r2.x = dot(r1.zwx, r2.xzw);
  r1.x = 2 + -r0.w;
  r1.x = r1.y / r1.x;
  r1.y = r1.y / r0.w;
  r2.y = r0.w * 0.5 + cb9[0].y;
  r0.w = cmp(r2.y < 0.5);
  r0.w = r0.w ? r1.y : r1.x;
  r1.x = dot(r0.xyz, float3(0.333333343,0.333333343,0.333333343));
  r1.y = 1 + -r1.x;
  r1.z = -r1.y * r1.y + 1;
  r3.y = -r1.x * r1.x + r1.z;
  r3.xz = r1.yx * r1.yx;
  r3.xyz = saturate(r3.xyz);
  r1.x = dot(cb9[4].xyz, r3.xyz);
  r1.y = dot(cb9[8].xyz, r3.xyz);
  r1.xy = cb9[0].zw + r1.xy;
  r2.z = r0.w * r1.x + r0.w;
  r2.yz = saturate(r2.yz);
  r1.xz = float2(0.166666672,1) * r2.xz;
  r1.xzw = t1.Sample(s1_s, r1.xz).xyz;
  r2.xzw = float3(1,1,1) + -r1.xzw;
  r0.w = -0.5 + r2.y;
  r0.w = r0.w + r0.w;
  r2.xzw = r2.xzw * r0.www + r1.xzw;
  r0.w = 0.5 + -r2.y;
  r2.y = cmp(0.5 >= r2.y);
  r0.w = r0.w + r0.w;
  r1.xzw = -r1.xzw * r0.www + r1.xzw;
  r1.xzw = r2.yyy ? r1.xzw : r2.xzw;
  r0.w = r1.y * -2 + 1;
  r0.w = 1 / r0.w;
  r1.xyz = saturate(r1.xzw * r0.www + -r1.yyy);
  r1.xyz = log2(r1.xyz);
  r2.x = dot(cb9[5].xyz, r3.xyz);
  r2.y = dot(cb9[9].xyz, r3.xyz);
  r2.z = dot(cb9[13].xyz, r3.xyz);
  r2.xyz = cb9[1].xyz + r2.xyz;
  r2.xyz = float3(0.454545438,0.454545438,0.454545438) * r2.xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r1.xyz = min(float3(1,1,1), r1.xyz);
  r2.xyz = -cb9[6].xyz * r3.xxx + float3(1,1,1);
  r2.xyz = cb9[2].xyz * r2.xyz;
  r4.xyz = -cb9[10].xyz * r3.yyy + float3(1,1,1);
  r2.xyz = r4.xyz * r2.xyz;
  r4.xyz = -cb9[14].xyz * r3.zzz + float3(1,1,1);
  r2.xyz = r4.xyz * r2.xyz;
  r1.xyz = saturate(r2.xyz * r1.xyz);
  r2.xyz = cb9[11].xyz * r3.yyy;
  r2.xyz = cb9[7].xyz * r3.xxx + r2.xyz;
  r2.xyz = cb9[15].xyz * r3.zzz + r2.xyz;
  r2.xyz = cb9[3].xyz + r2.xyz;
  r1.xyz = saturate(r2.xyz + r1.xyz);
  r1.xyz = r1.xyz + -r0.xyz;
  r0.w = t2.Sample(s2_s, v1.zw).x;
  r0.w = cb9[1].w * r0.w;
  o0.xyz = r0.www * r1.xyz + r0.xyz;
  o0.w = v0.w;

  o0 = ApplyToneMapScaling(o0);

  return;
}