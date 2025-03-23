#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Sat Mar 22 17:33:34 2025

cbuffer _Globals : register(b0)
{
  bool useMask : packoffset(c0);
  float alphaScale : packoffset(c0.y);
}

SamplerState __smpsScreen_s : register(s0);
SamplerState __smpsMask_s : register(s1);
Texture2D<float4> sScreen : register(t0);
Texture2D<float4> sMask : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  if (useMask != 0) {
    r0.x = sMask.Sample(__smpsMask_s, v1.xy).x;
  } else {
    r0.x = 1;
  }
  r1.xyzw = sScreen.Sample(__smpsScreen_s, v1.xy).xyzw;
  
  r1.rgb = renodx::draw::ToneMapPass(r1.rgb);
  
  r0.y = 1 + -r1.w;
  r0.x = alphaScale * r0.x;
  r0.x = -r0.y * r0.x + 1;
  r0.y = 1 + -r0.x;
  o0.xyz = r1.xyz * r0.yyy;
  o0.w = r0.x;
  return;
}