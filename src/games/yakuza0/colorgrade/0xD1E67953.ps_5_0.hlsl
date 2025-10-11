#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:18 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[16];
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

  r0.x = cb9[3].w * -2 + 1;
  r0.xy = v0.xy * r0.xx + cb9[3].ww;
  r0.y = t0.Sample(s0_s, r0.xy).y;
  r0.w = cb9[4].w * -2 + 1;
  r1.xy = v0.xy * r0.ww + cb9[4].ww;
  r0.z = t0.Sample(s0_s, r1.xy).z;
  r0.w = cmp(r0.y != r0.z);
  r0.w = r0.w ? 1.000000 : 0;
  r1.x = cb9[2].w * -2 + 1;
  r1.xy = v0.xy * r1.xx + cb9[2].ww;
  r0.x = t0.Sample(s0_s, r1.xy).x;

  ProcessUntonemapped(r0.rgb);

  r1.x = cmp(r0.y < r0.x);
  r1.xy = r1.xx ? r0.xy : r0.yx;
  r1.x = max(r1.x, r0.z);
  r1.y = min(r1.y, r0.z);
  r2.xyz = cmp(r0.xyz == r1.xxx);
  r2.xyw = r2.yzx ? float3(1,1,1) : 0;
  r1.zw = cmp(r0.xx != r0.yz);
  r1.zw = r1.zw ? float2(1,1) : 0;
  r2.xy = r2.xy * r1.zw;
  r2.z = r2.y * r0.w;
  r3.xyz = -r0.zxy + r0.yzx;
  r0.x = dot(r0.xyz, float3(0.333333343,0.333333343,0.333333343));
  r0.y = r1.x + -r1.y;
  r0.z = r1.x + r1.y;
  r1.xyz = r3.xyz / r0.yyy;
  r1.xyz = cb9[0].xxx + r1.xyz;
  r1.xyz = float3(0,2,4) + r1.xyz;
  r1.x = dot(r1.yzx, r2.xzw);
  r0.w = 2 + -r0.z;
  r0.w = r0.y / r0.w;
  r0.y = r0.y / r0.z;
  r1.y = r0.z * 0.5 + cb9[0].y;
  r0.z = cmp(r1.y < 0.5);
  r0.y = r0.z ? r0.y : r0.w;
  r0.z = 1 + -r0.x;
  r0.w = -r0.z * r0.z + 1;
  r2.y = -r0.x * r0.x + r0.w;
  r2.xz = r0.zx * r0.zx;
  r2.xyz = saturate(r2.xyz);
  r3.x = dot(cb9[4].xyz, r2.xyz);
  r3.y = dot(cb9[8].xyz, r2.xyz);
  r0.xz = cb9[0].zw + r3.xy;
  r1.z = r0.y * r0.x + r0.y;
  r1.yz = saturate(r1.yz);
  r0.xy = float2(0.166666672,1) * r1.xz;
  r0.xyw = t1.Sample(s1_s, r0.xy).xyz;
  r1.xzw = float3(1,1,1) + -r0.xyw;
  r2.w = -0.5 + r1.y;
  r2.w = r2.w + r2.w;
  r1.xzw = r1.xzw * r2.www + r0.xyw;
  r2.w = 0.5 + -r1.y;
  r1.y = cmp(0.5 >= r1.y);
  r2.w = r2.w + r2.w;
  r0.xyw = -r0.xyw * r2.www + r0.xyw;
  r0.xyw = r1.yyy ? r0.xyw : r1.xzw;
  r1.x = r0.z * -2 + 1;
  r1.x = 1 / r1.x;
  r0.xyz = saturate(r0.xyw * r1.xxx + -r0.zzz);
  r0.xyz = log2(r0.xyz);
  r1.x = dot(cb9[5].xyz, r2.xyz);
  r1.y = dot(cb9[9].xyz, r2.xyz);
  r1.z = dot(cb9[13].xyz, r2.xyz);
  r1.xyz = cb9[1].xyz + r1.xyz;
  r1.xyz = float3(0.454545438,0.454545438,0.454545438) * r1.xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(float3(1,1,1), r0.xyz);
  r1.xyz = -cb9[6].xyz * r2.xxx + float3(1,1,1);
  r1.xyz = cb9[2].xyz * r1.xyz;
  r3.xyz = -cb9[10].xyz * r2.yyy + float3(1,1,1);
  r1.xyz = r3.xyz * r1.xyz;
  r3.xyz = -cb9[14].xyz * r2.zzz + float3(1,1,1);
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = saturate(r1.xyz * r0.xyz);
  r1.xyz = cb9[11].xyz * r2.yyy;
  r1.xyz = cb9[7].xyz * r2.xxx + r1.xyz;
  r1.xyz = cb9[15].xyz * r2.zzz + r1.xyz;
  r1.xyz = cb9[3].xyz + r1.xyz;
  o0.xyz = saturate(r1.xyz + r0.xyz);
  o0.w = 1;

  o0 = ApplyToneMapScaling(o0);

  return;
}