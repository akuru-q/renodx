#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Tue Jun 04 23:18:21 2024

// 3Dmigoto declarations
#define cmp -

void main(float4 v0
          : SV_Position0, float4 v1
          : COLOR0, float2 v2
          : TEXCOORD0, out float4 o0
          : SV_Target0) {
  o0.xyzw = v1.xyzw;

  o0.xyz = saturate(o0.xyz);
  // allow for brightness adjustment while preserving UI blending in gamma space
  if (injectedData.toneMapUINits != injectedData.toneMapGameNits) {
    o0.rgb = injectedData.toneMapGammaCorrection ? pow(o0.rgb, 2.2f)
                                                : renodx::color::bt709::from::SRGB(o0.rgb);
    o0.rgb *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
    o0.rgb = injectedData.toneMapGammaCorrection ? pow(o0.rgb, 1.f / 2.2f)
                                                : renodx::color::srgb::from::BT709(o0.rgb);
  }

  return;
}