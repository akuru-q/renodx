#include "./common.hlsl"

Texture2DArray<float4> t3 : register(t3);
Texture2DArray<float4> t2 : register(t2);
Texture2D<float4> t1 : register(t1);
Texture2DArray<float4> t0 : register(t0);
SamplerState s1_s : register(s1);
SamplerState s0_s : register(s0);
cbuffer cb1 : register(b1) {
  float4 cb1[80];
}
cbuffer cb0 : register(b0) {
  float4 cb0[4];
}

void main(
    float4 v0: SV_POSITION0,
    float2 v1: TEXCOORD0,
    out float4 o0: SV_Target0) {
  float4 r0, r1, r2, r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = cb1[46].xy * v1.xy;
  r0.xy = (uint2)r0.xy;
  r0.xy = (uint2)r0.xy;
  r0.zw = float2(-1, -1) + cb1[46].xy;
  r0.zw = cb0[3].zw * r0.zw;
  r0.xy = r0.xy * cb0[3].xy + r0.zw;
  r0.xy = (uint2)r0.xy;
  r0.zw = float2(0, 0);
  r0.xyzw = t0.Load(r0.xyzw).xyzw;
  r1.x = renodx::color::y::from::BT709(r0.rgb);
  r1.r = renodx::math::SignSqrt(r1.r);
  r1.x = cb0[0].y * -r1.x + 1;
  r1.yz = v1.xy * cb0[3].xy + cb0[3].zw;
  r2.xy = r1.yz * cb0[1].xy + cb0[1].zw;
  r1.w = t1.SampleBias(s1_s, r2.xy, cb1[79].y).w;
  r1.w = -0.5 + r1.w;
  r1.w = r1.w + r1.w;
  r2.xyz = r1.www * r0.xyz;
  r2.xyz = cb0[0].xxx * r2.xyz * injectedData.fxFilmGrain;
  if (injectedData.fxFilmGrainType == 0.f) {
    r0.xyz = r2.xyz * r1.xxx + r0.xyz;
  } else {
    r0.rgb = applyFilmGrain(r0.rgb, v1);
  }
  o0.w = r0.w;
  r0.rgb = renodx::color::srgb::EncodeSafe(r0.rgb);
  r2.xy = cb0[2].xy * r1.yz;
  r1.xy = cb1[48].xy * r1.yz;
  r2.z = cb0[2].z;
  r0.w = t3.SampleBias(s1_s, r2.xyz, cb1[79].y).w;
  r0.w = r0.w * 2 + -1;
  r1.w = 1 + -abs(r0.w);
  r0.w = (r0.w >= 0) ? 1 : -1;
  r1.w = sqrt(r1.w);
  r1.w = 1 + -r1.w;
  r0.w = r1.w * r0.w;
  r0.xyz = r0.www * float3(0.00392156886, 0.00392156886, 0.00392156886) * injectedData.fxNoise + r0.xyz;
  r0.rgb = renodx::color::srgb::DecodeSafe(r0.rgb);
  r1.z = 0;
  r1.xyzw = t2.SampleLevel(s0_s, r1.xyz, 0).xyzw;
  o0.xyz = r1.www * r0.xyz + r1.xyz;
  o0.rgb = PostToneMapScale(o0.rgb);
  return;
}
