#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Tue Oct 15 23:31:54 2024

SamplerState BlitSampler_s : register(s0);
Texture2D<float4> BlitTexture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float2 v0 : TEXCOORD0,
  float4 v1 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
    o0.xyzw = BlitTexture.Sample(BlitSampler_s, v0.xy).xyzw;
    
    float4 color = o0.xyzw;
    
    //color.rgb = renodx::color::correct::GammaSafe(color.rgb);
    
    color.rgb *= injectedData.toneMapUINits;
 
    // Shortfuse's bandaid
    if ((injectedData.toneMapType >= 2) && (injectedData.clipPeak))
    { // If tonemapper is not "none" or "Vanilla"
        float y_max = injectedData.toneMapPeakNits;
        float y = renodx::color::y::from::BT709(abs(color.rgb));
        if (y > y_max)
        {
            color.rgb *= y_max / y;
        }
    }

    color.rgb /= 80.f;

    o0.rgba = color;
    
    return;
}