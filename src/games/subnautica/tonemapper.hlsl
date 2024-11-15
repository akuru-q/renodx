#include "./shared.h"
#include "./hueHelper.hlsl"

float3 applyUserTonemap(float3 untonemapped, float3 vanillaColor, float midGray = 0.18f)
{
    float3 outputColor;

    if (injectedData.toneMapType == 0.f)
    {
        outputColor = max(0, vanillaColor); // clamps to 709/no negative colors for the vanilla tonemapper
        outputColor = saturate(vanillaColor);
    }
    else
    {
        outputColor = untonemapped;
        //untonemapped = Hue(untonemapped, injectedData.toneMapHueCorrection); // apply hue correction for clipped highlights
    }

    // float vanillaMidGray = 0.1f; //0.18f old default
    float vanillaMidGray = midGray; 
    float renoDRTContrast = 1.f;
    // float renoDRTFlare = injectedData.colorGradeFlare;  // 0.01f seems to be a good middleground
    float renoDRTFlare = 0.01 * pow(injectedData.colorGradeFlare, 2.33f); // 50/1.f will be 0.01, 100/2.f will be 0.0502
    float renoDRTShadows = 1.f;
    float renoDRTDechroma = 0.f;
    // float renoDRTDechroma = injectedData.colorGradeBlowout;
    float renoDRTSaturation = 1.f; //
    float renoDRTHighlights = 1.f;

    renodx::tonemap::Config config = renodx::tonemap::config::Create();
    
    config.type = injectedData.toneMapType;
    config.peak_nits = injectedData.toneMapPeakNits;
    config.game_nits = injectedData.toneMapGameNits;
    config.gamma_correction = 1;
    config.exposure = injectedData.colorGradeExposure;
    config.highlights = injectedData.colorGradeHighlights;
    config.shadows = injectedData.colorGradeShadows;
    config.contrast = injectedData.colorGradeContrast;
    config.saturation = injectedData.colorGradeSaturation;

    // Start hue correction
    // Reinhard
    if (injectedData.toneMapHueCorrection == 1.f)
    {
        config.hue_correction_type = renodx::tonemap::config::hue_correction_type::CUSTOM;
        config.hue_correction_color = lerp(
        untonemapped,
        renodx::tonemap::Reinhard(untonemapped),
        1.f);
        config.hue_correction_strength = 1.f;
    }
     // Uncharted 2
    if (injectedData.toneMapHueCorrection == 2.f)
    {
        config.hue_correction_type = renodx::tonemap::config::hue_correction_type::CUSTOM;
        config.hue_correction_color = lerp(
        untonemapped,
        renodx::tonemap::uncharted2::BT709(untonemapped),
        1.f);
        config.hue_correction_strength = 1.f;
    }
    if (injectedData.toneMapHueCorrection == 3.f)
    {
        config.hue_correction_type = renodx::tonemap::config::hue_correction_type::CUSTOM;
        config.hue_correction_color = lerp(
        untonemapped,
        Hue(untonemapped, 1.f),
        1.f);
        config.hue_correction_strength = 1.f;
    }

    config.reno_drt_highlights = renoDRTHighlights;
    config.reno_drt_shadows = renoDRTShadows;
    config.reno_drt_contrast = renoDRTContrast;
    config.reno_drt_saturation = renoDRTSaturation;
    config.reno_drt_dechroma = renoDRTDechroma;
    config.mid_gray_value = vanillaMidGray;
    config.mid_gray_nits = vanillaMidGray * 100.f;
    config.reno_drt_flare = renoDRTFlare;

    outputColor = renodx::tonemap::config::Apply(outputColor, config);

    if (injectedData.toneMapType != 0)
    {
    }
    
    //outputColor.xyz = renodx::color::correct::GammaSafe(outputColor.xyz); // sRGB -> pow2.2
    outputColor.rgb *= injectedData.toneMapGameNits / injectedData.toneMapUINits; // scale output by gamenits / ui nits -- will restore in the final shader
    //outputColor.xyz = renodx::color::correct::GammaSafe(outputColor.xyz, true); // pow2.2 -> sRGB

    return outputColor;
}
// End applyUserTonemap