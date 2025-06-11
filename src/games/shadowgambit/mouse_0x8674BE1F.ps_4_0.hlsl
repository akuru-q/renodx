#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 15:40:55 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;

  // UI element earlier than UberPosts
  o0.rgb = preUberPostUIScaling(o0.rgb);

  return;
}