#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Sun Feb 23 17:05:49 2025
Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[14];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float2 w2 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t3.Sample(s3_s, w2.xy).xyzw;
  r0.x = -0.5 + r0.x;
  r0.x = r0.x + r0.x;
  r0.y = cb0[2].y + cb0[2].y;
  r0.x = r0.x * cb0[9].z + -r0.y;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.z = r0.y * r0.x;
  r1.xyzw = t2.Sample(s2_s, w2.xy).xyzw;
  r0.x = r0.y * r0.x + r1.w;
  r0.x = -r0.z * r1.w + r0.x;
  r2.xyzw = t1.Sample(s0_s, w1.xy).xyzw;
  r3.xyzw = t0.Sample(s1_s, v1.xy).xyzw;
  r0.yzw = r3.xxx * r2.zxy;
  r1.xyz = r1.zxy * r3.xxx + -r0.yzw;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r1.xyzw = float4(1,1,-1,0) * cb0[10].xyxy;
  r2.xyzw = -r1.xywy * cb0[11].xxxx + w2.xyxy;
  r3.xyzw = t4.Sample(s4_s, r2.xy).xyzw;
  r2.xyzw = t4.Sample(s4_s, r2.zw).xyzw;
  r2.xyz = r2.zxy * float3(2,2,2) + r3.zxy;
  r3.xy = -r1.zy * cb0[11].xx + w2.xy;
  r3.xyzw = t4.Sample(s4_s, r3.xy).xyzw;
  r2.xyz = r3.zxy + r2.xyz;
  r3.xyzw = r1.zwxw * cb0[11].xxxx + w2.xyxy;
  r4.xyzw = t4.Sample(s4_s, r3.xy).xyzw;
  r3.xyzw = t4.Sample(s4_s, r3.zw).xyzw;
  r2.xyz = r4.zxy * float3(2,2,2) + r2.xyz;
  r4.xyzw = t4.Sample(s4_s, w2.xy).xyzw;
  r2.xyz = r4.zxy * float3(4,4,4) + r2.xyz;
  r2.xyz = r3.zxy * float3(2,2,2) + r2.xyz;
  r3.xyzw = r1.zywy * cb0[11].xxxx + w2.xyxy;
  r1.xy = r1.xy * cb0[11].xx + w2.xy;
  r1.xyzw = t4.Sample(s4_s, r1.xy).xyzw;
  r4.xyzw = t4.Sample(s4_s, r3.xy).xyzw;
  r3.xyzw = t4.Sample(s4_s, r3.zw).xyzw;
  r2.xyz = r4.zxy + r2.xyz;
  r2.xyz = r3.zxy * float3(2,2,2) + r2.xyz;
  r1.xyz = r2.xyz + r1.zxy;
  r1.xyz = cb0[11].yyy * r1.xyz;
  r0.xyz = r1.xyz * float3(0.0625,0.0625,0.0625) + r0.xyz;
  r1.xyz = float3(0.0625,0.0625,0.0625) * r1.xyz;
  r2.xyzw = t5.Sample(s5_s, v2.xy).xyzw;
  r2.xyz = cb0[11].zzz * r2.zxy;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = cb0[12].www * r0.xyz;

  float3 untonemapped = r0.yzx;

  r0.xyz = r0.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = saturate(r0.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));
  r0.yzw = cb0[12].zzz * r0.xyz;
  r0.y = floor(r0.y);
  r0.x = r0.x * cb0[12].z + -r0.y;
  r1.xy = float2(0.5,0.5) * cb0[12].xy;
  r1.yz = r0.zw * cb0[12].xy + r1.xy;
  r1.x = r0.y * cb0[12].y + r1.y;
  r2.x = cb0[12].y;
  r2.y = 0;
  r0.yz = r2.xy + r1.xz;
  r1.xyzw = t6.Sample(s6_s, r1.xz).xyzw;
  r2.xyzw = t6.Sample(s6_s, r0.yz).xyzw;
  r0.yzw = r2.xyz + -r1.xyz;
  r0.xyz = saturate(r0.xxx * r0.yzw + r1.xyz);
  o0.xyz = cb0[13].xxx * r0.xyz;
  o0.w = 1;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = renodx::draw::ToneMapPass(untonemapped, o0.rgb);
  } else {
    o0.rgb = saturate(o0.rgb);
  }

  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);

  return;
}