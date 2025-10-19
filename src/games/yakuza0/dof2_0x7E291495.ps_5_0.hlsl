#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:12 2025
Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[5];
}

cbuffer cb13 : register(b13)
{
  float4 cb13[1];
}

// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  // HDR path
  r0.x = t1.Sample(s1_s, v0.xy).x;
  r0.x = cb9[0].x + r0.x;
  r0.x = -cb9[0].y / r0.x;
  r0.y = cmp(cb9[3].w < -r0.x);
  r0.x = saturate(cb9[3].x * -r0.x + cb9[3].y);
  r0.x = cb9[3].z * r0.x;
  r1.xyzw = t2.Sample(s2_s, v0.zw).xyzw;
  r0.x = max(r1.w, r0.x);
  r0.x = r0.y ? r1.w : r0.x;
  r0.xyzw = saturate(r0.xxxx * cb9[1].xywz + cb9[2].xywz);
  r2.xy = float2(1,1) + -r0.xy;
  r0.xy = min(r2.xy, r0.yw);
  r1.xyz = r0.yyy * r1.xyz;
  r2.xyz = t0.Sample(s0_s, v0.xy).xyz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r2.xyz = t3.Sample(s3_s, v0.zw).xyz;
  r1.xyz = r0.zzz * r2.xyz + r1.xyz;
  r0.w = dot(r0.xyz, float3(1,1,1));
  r2.x = cb9[4].z + -1;
  r2.x = r0.w * r2.x + 1;
  r0.xyz = r2.xxx * r1.xyz;
  r2.xyzw = cb9[4].xxxx * r0.xyzw;
  r1.w = r0.w;
  r0.x = 8 & asint(cb13[0].x);
  o0.xyzw = r0.xxxx ? r2.xyzw : r1.xyzw;
  
  float4 hdr_color = o0;
  
  r0,r1,r2,o0 = 0.f;
  
  // SDR path
  r0.x = t1.Sample(s1_s, v0.xy).x;
  r0.x = cb9[0].x + r0.x;
  r0.x = -cb9[0].y / r0.x;
  r0.y = cmp(cb9[3].w < -r0.x);
  r0.x = saturate(cb9[3].x * -r0.x + cb9[3].y);
  r0.x = cb9[3].z * r0.x;
  r1.xyzw = t2.Sample(s2_s, v0.zw).xyzw;
  
  TonemapSDR(r1.xyz);
  
  r0.x = max(r1.w, r0.x);
  r0.x = r0.y ? r1.w : r0.x;
  r0.xyzw = saturate(r0.xxxx * cb9[1].xywz + cb9[2].xywz);
  r2.xy = float2(1,1) + -r0.xy;
  r0.xy = min(r2.xy, r0.yw);
  r1.xyz = r0.yyy * r1.xyz;
  r2.xyz = t0.Sample(s0_s, v0.xy).xyz;
  
  TonemapSDR(r2.xyz);
  
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r2.xyz = t3.Sample(s3_s, v0.zw).xyz;
  
  TonemapSDR(r2.xyz);
  
  r1.xyz = r0.zzz * r2.xyz + r1.xyz;
  r0.w = dot(r0.xyz, float3(1,1,1));
  r2.x = cb9[4].z + -1;
  r2.x = r0.w * r2.x + 1;
  r0.xyz = r2.xxx * r1.xyz;
  r2.xyzw = cb9[4].xxxx * r0.xyzw;
  r1.w = r0.w;
  r0.x = 8 & asint(cb13[0].x);
  o0.xyzw = r0.xxxx ? r2.xyzw : r1.xyzw;
  
  float4 sdr_color = o0;

  [branch]
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    hdr_color.rgb = renodx::color::srgb::DecodeSafe(hdr_color.rgb);
    sdr_color.rgb = renodx::color::srgb::DecodeSafe(sdr_color.rgb);

    o0.rgb = renodx::tonemap::UpgradeToneMap(hdr_color.rgb, renodx::tonemap::renodrt::NeutralSDR(hdr_color.rgb), sdr_color.rgb);

    o0.rgb = renodx::color::srgb::EncodeSafe(o0.rgb);

    o0.a = hdr_color.a;
  }
  
  return;
}