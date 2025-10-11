#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:15 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[15];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t0.Sample(s0_s, v0.xy).xyz;

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
  r0.x = dot(r0.xyz, float3(0.333333343,0.333333343,0.333333343));
  r3.xyz = r3.xyz ? float3(1,1,1) : 0;
  r2.xy = r3.xy * r2.xy;
  r2.z = r2.y * r3.z;
  r2.x = dot(r1.zwx, r2.xzw);
  r0.y = 2 + -r0.w;
  r0.yz = r1.yy / r0.yw;
  r2.y = r0.w * 0.5 + cb9[0].y;
  r0.w = cmp(r2.y < 0.5);
  r0.y = r0.w ? r0.z : r0.y;
  r0.z = 1 + -r0.x;
  r0.w = -r0.z * r0.z + 1;
  r1.y = -r0.x * r0.x + r0.w;
  r1.xz = r0.zx * r0.zx;
  r1.xyz = saturate(r1.xyz);
  r3.x = dot(cb9[4].xyz, r1.xyz);
  r3.y = dot(cb9[8].xyz, r1.xyz);
  r0.xz = cb9[0].zw + r3.xy;
  r2.z = r0.y * r0.x + r0.y;
  r2.yz = saturate(r2.yz);
  r0.xy = float2(0.166666672,1) * r2.xz;
  r0.xyw = t1.Sample(s1_s, r0.xy).xyz;
  r2.xzw = float3(1,1,1) + -r0.xyw;
  r1.w = -0.5 + r2.y;
  r1.w = r1.w + r1.w;
  r2.xzw = r2.xzw * r1.www + r0.xyw;
  r1.w = 0.5 + -r2.y;
  r2.y = cmp(0.5 >= r2.y);
  r1.w = r1.w + r1.w;
  r0.xyw = -r0.xyw * r1.www + r0.xyw;
  r0.xyw = r2.yyy ? r0.xyw : r2.xzw;
  r1.w = r0.z * -2 + 1;
  r1.w = 1 / r1.w;
  r0.xyz = saturate(r0.xyw * r1.www + -r0.zzz);
  r2.xyz = -cb9[6].xyz * r1.xxx + float3(1,1,1);
  r2.xyz = cb9[2].xyz * r2.xyz;
  r1.xyw = -cb9[10].xyz * r1.yyy + float3(1,1,1);
  r3.xyz = -cb9[14].xyz * r1.zzz + float3(1,1,1);
  r1.xyz = r2.xyz * r1.xyw;
  r1.xyz = r1.xyz * r3.xyz;
  o0.xyz = saturate(r1.xyz * r0.xyz);
  o0.w = 1;

  o0 = ApplyToneMapScaling(o0);

  return;
}