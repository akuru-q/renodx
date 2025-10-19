#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:10 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[1];
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
  
  // hdr
  r0.xyz = t0.Sample(s0_s, v1.zw).xyz;
  //r1.xyz = saturate(-cb9[0].zzz + r0.xyz);
  //r0.xyz = cb9[0].www * r1.xyz + r0.xyz;
  r0.xyz = float3(0.235294119,0.235294119,0.235294119) * r0.xyz;
  r1.xyz = t0.Sample(s0_s, v1.xy).xyz;
  //r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  //r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  r0.xyz = r1.xyz * float3(0.235294119,0.235294119,0.235294119) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v2.xy).xyz;
  //r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  //r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  r0.xyz = r1.xyz * float3(0.235294119,0.235294119,0.235294119) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v2.zw).xyz;
  //r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  //r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  r0.xyz = r1.xyz * float3(0.235294119,0.235294119,0.235294119) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v0.xy).xyz;
  //r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  //r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  o0.xyz = r1.xyz * float3(0.0588235296,0.0588235296,0.0588235296) + r0.xyz;
  
  float3 hdr_color = o0.rgb;
  
  r0,r1,r2,o0 = 0.f;
  
  // sdr path
  r0.xyz = t0.Sample(s0_s, v1.zw).xyz;
  TonemapSDR(r0.xyz);
  
  r1.xyz = saturate(-cb9[0].zzz + r0.xyz);
  r0.xyz = cb9[0].www * r1.xyz + r0.xyz;
  r0.xyz = float3(0.235294119,0.235294119,0.235294119) * r0.xyz;
  r1.xyz = t0.Sample(s0_s, v1.xy).xyz;
  TonemapSDR(r1.xyz);
  
  r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  r0.xyz = r1.xyz * float3(0.235294119,0.235294119,0.235294119) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v2.xy).xyz;
  TonemapSDR(r1.xyz);
  
  r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  r0.xyz = r1.xyz * float3(0.235294119,0.235294119,0.235294119) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v2.zw).xyz;
  TonemapSDR(r1.xyz);
  
  r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  r0.xyz = r1.xyz * float3(0.235294119,0.235294119,0.235294119) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v0.xy).xyz;
  TonemapSDR(r1.xyz);
  
  r2.xyz = saturate(-cb9[0].zzz + r1.xyz);
  r1.xyz = cb9[0].www * r2.xyz + r1.xyz;
  o0.xyz = r1.xyz * float3(0.0588235296,0.0588235296,0.0588235296) + r0.xyz;
  o0.w = 1;
  
  float3 sdr_color = o0.rgb;

  [branch]
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    hdr_color = renodx::color::srgb::DecodeSafe(hdr_color);
    sdr_color = renodx::color::srgb::DecodeSafe(sdr_color);

    o0.rgb = renodx::tonemap::UpgradeToneMap(hdr_color, renodx::tonemap::renodrt::NeutralSDR(hdr_color), sdr_color);

    o0.rgb = renodx::color::srgb::EncodeSafe(o0.rgb);
  }
  
  return;
}