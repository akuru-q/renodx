// Custom Tonemapper
// We'll create a function so we can just call this in other shaders, instead of having to manage a wall of code in multiple files

#include "./shared.h"

float3 applyUserTonemap(float3 untonemapped, float3 vanillaColor, float midGray, ShaderInjectData injectedData)
{
    float3 outputColor;
    
    // make UE HDR more like SDR, 80 nits PQ
    vanillaColor = renodx::color::grade::UserColorGrading(
              vanillaColor,
              1.03, //injectedData.colorGradeExposure,
              1.0, //injectedData.colorGradeHighlights,
              1.3, //injectedData.colorGradeShadows,
              0.9, //injectedData.colorGradeContrast,
              1.0); //injectedData.colorGradeSaturation);
    
    // lutted SDR in PQ
    vanillaColor = max(0, vanillaColor); // clamp out of gamut
    vanillaColor = renodx::color::bt2020::from::PQ(vanillaColor); // convert to linear
    vanillaColor = mul(renodx::color::BT2020_TO_BT709_MAT, vanillaColor);
    vanillaColor *= 125.f;
    
    if (injectedData.toneMapType == 0.f)
    {
        outputColor = vanillaColor;
        outputColor = max(0, outputColor); //clamps to 709/no negative colors for the vanilla tonemapper
    }
    else
    {
        outputColor = untonemapped;
    }
    
    // ACES + RenoDRT
    // hue correction pre-tonemap
    if (injectedData.toneMapHueCorrection == 1.f)
    {
        outputColor = renodx::color::correct::Hue(outputColor, renodx::tonemap::Reinhard(outputColor));
    }
    else if (injectedData.toneMapHueCorrection == 2.f)
    {
        outputColor = renodx::color::correct::Hue(outputColor, renodx::tonemap::ACESFittedBT709(outputColor));
    }
    else if (injectedData.toneMapHueCorrection == 3.f)
    {
        outputColor = renodx::color::correct::Hue(outputColor, renodx::tonemap::ACESFittedAP1(outputColor));
    }
    
    // apply user color grading to vanilla, if vanilla is selected
    if (injectedData.toneMapType == 0)
    {
        outputColor = renodx::color::grade::UserColorGrading(
          outputColor,
          injectedData.colorGradeExposure,
          injectedData.colorGradeHighlights,
          injectedData.colorGradeShadows,
          injectedData.colorGradeContrast,
          injectedData.colorGradeSaturation);
    }
    
    // RenoDRT with ACES-like adjustments
    float vanillaMidGray = 0.18f; // old default
    float renoDRTContrast = 1.8f;
    float renoDRTFlare = 0.f;
    float renoDRTShadows = 1.f; // ch4 might need 1.3f shadow boost, 1.f default
    float renoDRTDechroma = 0.8f;
    float renoDRTSaturation = 1.8f; // 1.1f
    float renoDRTHighlights = 1.2f;
        
    renodx::tonemap::Config config = renodx::tonemap::config::Create(
              injectedData.toneMapType,
              injectedData.toneMapPeakNits,
              injectedData.toneMapGameNits,
              1,
              injectedData.colorGradeExposure,
              injectedData.colorGradeHighlights,
              injectedData.colorGradeShadows,
              injectedData.colorGradeContrast,
              injectedData.colorGradeSaturation,
              vanillaMidGray,
              vanillaMidGray * 100.f,
              renoDRTHighlights,
              renoDRTShadows,
              renoDRTContrast,
              renoDRTSaturation,
              renoDRTDechroma,
              renoDRTFlare,
              //renodx::tonemap::config::hue_correction_type::CUSTOM, (injectedData.toneMapVanillaHueCorrection), vanillaColor
              renodx::tonemap::config::hue_correction_type::INPUT, 0.f, outputColor
            );
        
    outputColor = renodx::tonemap::config::Apply(outputColor, config);
    
    // Hue Correction for ACES as well
    //if (injectedData.toneMapType == 2)
    //{
    //    if (injectedData.toneMapVanillaHueCorrection) //hue correction
    //    {
    //        float3 hueCorrected = renodx::color::correct::Hue(outputColor, vanillaColor);
    //        outputColor = lerp(outputColor, hueCorrected, injectedData.toneMapVanillaHueCorrection);
    //    }
    //}
    
     //HDR/SDR blend for color correction, with user color grading for vanilla
    if (injectedData.toneMapType != 0 && injectedData.blend)
    {   
        vanillaColor = renodx::color::grade::UserColorGrading(
          vanillaColor,
          injectedData.colorGradeExposure,
          injectedData.colorGradeHighlights,
          injectedData.colorGradeShadows,
          injectedData.colorGradeContrast,
          injectedData.colorGradeSaturation);
        
        outputColor = lerp(vanillaColor, outputColor, saturate(vanillaColor)); // combine tonemappers 
    }
    
    // Gamma correction
    if (injectedData.toneMapGammaCorrection)
    {
        outputColor = renodx::color::correct::GammaSafe(outputColor);
        outputColor *= injectedData.toneMapGameNits; // / 100.f?
        outputColor = renodx::color::correct::GammaSafe(outputColor, true);
    }
    else
    {
        outputColor *= injectedData.toneMapGameNits; // scale by game brightness
    }
    
    // output expected as PQ, so we need linear > PQ conversion
    outputColor = mul(renodx::color::BT709_TO_BT2020_MAT, outputColor); // use bt2020
    outputColor /= 10000.f; // Scale for PQ
    outputColor = max(0, outputColor); // clamp out of gamut
    outputColor = renodx::color::pq::from::BT2020(outputColor); // convert to PQ
    outputColor = min(1.f, outputColor); // clamp PQ (10K nits)
    
    return outputColor;
}