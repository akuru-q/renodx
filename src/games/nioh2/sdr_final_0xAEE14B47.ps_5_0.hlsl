#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Sat Mar 22 17:33:51 2025

cbuffer _Globals : register(b0)
{
  float4 vConfigParam : packoffset(c0);
}

SamplerState __smpsScreen_s : register(s0);
Texture2D<float4> sScreen : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = sScreen.Sample(__smpsScreen_s, v1.xy).xyzw;
  //r0.xyz = log2(r0.xyz);
  o0.w = r0.w;
  //r0.xyz = vConfigParam.xxx * r0.xyz;
  //o0.xyz = exp2(r0.xyz);

  o0.rgb = r0.rgb;

  if (CUSTOM_IS_HDR_FINAL_SHADER_PRESENT != 1.f) {
    o0.rgb = renodx::color::srgb::DecodeSafe(o0.rgb);
    o0 = renodx::draw::SwapChainPass(o0);
  }

  return;
}