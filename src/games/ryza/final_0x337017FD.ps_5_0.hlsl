// ---- Created with 3Dmigoto v1.3.16 on Fri Sep 20 23:49:27 2024

#include "./shared.h"

SamplerState smplScene_s : register(s0);
Texture2D<float4> smplScene_Tex : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
    o0.xyzw = smplScene_Tex.Sample(smplScene_s, v1.xy).xyzw;
    
    o0.rgb = renodx::math::SafePow(o0.rgb, 2.2f);
    o0.rgb *= injectedData.toneMapUINits;
    
    if ((injectedData.toneMapType >= 2) && (injectedData.clipPeak))
    { //If tonemapper is not "none" or "Vanilla"
        if (renodx::color::y::from::BT709(o0.rgb) > injectedData.toneMapPeakNits / 80.f)
        { // If the MaxCll is over peaknits   
            o0.rgb = min(o0.rgb, injectedData.toneMapPeakNits / 80.f); //clamp output to peak nits slider, bandaid for a few effects
        }
    }
    
    o0.rgb /= 80.f;
    
    return;
}