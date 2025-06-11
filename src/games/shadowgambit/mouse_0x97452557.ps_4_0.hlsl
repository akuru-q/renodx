#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 15:40:55 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  o0.xyzw = v1.xyzw * r0.xyzw;

  // UI element earlier than UberPosts
  o0.rgb = preUberPostUIScaling(o0.rgb);
  
  return;
}