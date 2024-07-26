// ---- Created with 3Dmigoto v1.3.16 on Mon Jul  8 23:38:25 2024
#include "./shared.h"

cbuffer _Globals : register(b0)
{
    float4 vViewInfo : packoffset(c0);
    float fDistantBlurZThreshold : packoffset(c1);
    float fFar : packoffset(c1.y);
    float fDistantBlurIntensity : packoffset(c1.z);
    float2 SimulateHDRParams : packoffset(c2);
    float fKIDSDOFType : packoffset(c2.z) = { 0 };
    float fBloomWeight : packoffset(c2.w) = { 0.5 };
    float fStarWeight : packoffset(c3) = { 0.800000012 };
    float fLensFlareWeight : packoffset(c3.y) = { 0.300000012 };
    float4 vLightShaftPower : packoffset(c4);
    float3 vColorScale : packoffset(c5) = { 1, 1, 1 };
    float3 vSaturationScale : packoffset(c6) = { 1, 1, 1 };
    float2 vScreenSize : packoffset(c7) = { 1280, 720 };
    float4 vSpotParams : packoffset(c8) = { 640, 360, 300, 400 };
    float fLimbDarkening : packoffset(c9) = { 755364.125 };
    float fLimbDarkeningWeight : packoffset(c9.y) = { 0 };
    float fGamma : packoffset(c9.z) = { 1 };
}

SamplerState smplScene_s : register(s0);
SamplerState smplAdaptedLumCur_s : register(s1);
SamplerState smplZ_s : register(s2);
SamplerState smplBlurFront_s : register(s3);
SamplerState smplDOFMerge_s : register(s4);
SamplerState smplBlurBack_s : register(s5);
SamplerState smplBlurHexFront_s : register(s6);
SamplerState smplBlurHexBack_s : register(s7);
SamplerState smplEffectScene_s : register(s8);
SamplerState smplBloom_s : register(s9);
SamplerState smplStar_s : register(s10);
SamplerState smplFlare_s : register(s11);
SamplerState smplLightShaftLinWork2_s : register(s12);
Texture2D<float4> smplScene_Tex : register(t0);
Texture2D<float4> smplAdaptedLumCur_Tex : register(t1);
Texture2D<float4> smplZ_Tex : register(t2);
Texture2D<float4> smplBlurFront_Tex : register(t3);
Texture2D<float4> smplDOFMerge_Tex : register(t4);
Texture2D<float4> smplBlurBack_Tex : register(t5);
Texture2D<float4> smplBlurHexFront_Tex : register(t6);
Texture2D<float4> smplBlurHexBack_Tex : register(t7);
Texture2D<float4> smplEffectScene_Tex : register(t8);
Texture2D<float4> smplBloom_Tex : register(t9);
Texture2D<float4> smplStar_Tex : register(t10);
Texture2D<float4> smplFlare_Tex : register(t11);
Texture2D<float4> smplLightShaftLinWork2_Tex : register(t12);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
    float4 r0, r1, r2, r3, r4;
    uint4 bitmask, uiDest;
    float4 fDest;

    r0.xyz = smplScene_Tex.Sample(smplScene_s, v1.xy).xyz;
    r0.w = smplAdaptedLumCur_Tex.Sample(smplAdaptedLumCur_s, float2(0.25, 0.5)).x;
    r0.xyz = r0.xyz * r0.www;
    r0.w = smplDOFMerge_Tex.Sample(smplDOFMerge_s, v1.xy).w;
    r1.x = cmp(fKIDSDOFType == 0.000000);
    if (r1.x != 0)
    {
        r1.x = cmp(r0.w < 0.5);
        if (r1.x == 0)
        {
            r1.xyzw = smplBlurBack_Tex.Sample(smplBlurBack_s, v1.xy).xyzw;
            r2.x = -0.5 + r0.w;
            r2.x = r2.x * -2 + 1;
            r2.x = max(0, r2.x);
            r2.x = 9.99999975e-06 + r2.x;
            r2.x = 1 / r2.x;
            r2.x = -1 + r2.x;
            r2.x = saturate(0.25 * r2.x);
            r1.xyzw = r1.xyzw + -r0.xyzw;
            r0.xyzw = r2.xxxx * r1.xyzw + r0.xyzw;
        }
        r1.xyzw = smplBlurFront_Tex.Sample(smplBlurFront_s, v1.xy).xyzw;
        r2.x = -0.5 + r1.w;
        r2.x = abs(r2.x) * -2 + 1;
        r2.x = max(0, r2.x);
        r2.x = 9.99999975e-06 + r2.x;
        r2.x = 1 / r2.x;
        r2.x = -1 + r2.x;
        r2.x = saturate(0.25 * r2.x);
        r1.xyzw = r1.xyzw + -r0.xyzw;
        r1.xyzw = r2.xxxx * r1.xyzw + r0.xyzw;
        o0.w = r1.w;
    }
    else
    {
        r2.x = cmp(fKIDSDOFType == 1.000000);
        if (r2.x != 0)
        {
            r2.x = cmp(r0.w < 0.5);
            if (r2.x == 0)
            {
                r2.xyzw = smplBlurHexBack_Tex.Sample(smplBlurHexBack_s, v1.xy).xyzw;
                r3.x = -0.5 + r0.w;
                r3.x = r3.x * -2 + 1;
                r3.x = max(0, r3.x);
                r3.x = 9.99999975e-06 + r3.x;
                r3.x = 1 / r3.x;
                r3.x = -1 + r3.x;
                r3.x = saturate(0.25 * r3.x);
                r2.xyzw = r2.xyzw + -r0.xyzw;
                r0.xyzw = r3.xxxx * r2.xyzw + r0.xyzw;
            }
            r2.xyzw = smplBlurHexFront_Tex.Sample(smplBlurHexFront_s, v1.xy).xyzw;
            r3.x = -0.5 + r2.w;
            r3.x = abs(r3.x) * -2 + 1;
            r3.x = max(0, r3.x);
            r3.x = 9.99999975e-06 + r3.x;
            r3.x = 1 / r3.x;
            r3.x = -1 + r3.x;
            r3.x = saturate(0.25 * r3.x);
            r2.xyzw = r2.xyzw + -r0.xyzw;
            r1.xyzw = r3.xxxx * r2.xyzw + r0.xyzw;
            o0.w = r1.w;
        }
        else
        {
            r2.x = smplZ_Tex.Sample(smplZ_s, v1.xy).x;
            r2.x = vViewInfo.z + r2.x;
            r2.x = -vViewInfo.w / r2.x;
            r2.x = -fDistantBlurZThreshold + r2.x;
            r2.y = fFar + -fDistantBlurZThreshold;
            r2.x = saturate(r2.x / r2.y);
            r2.x = saturate(fDistantBlurIntensity * r2.x);
            r2.x = sqrt(r2.x);
            r3.xyzw = smplBlurFront_Tex.Sample(smplBlurFront_s, v1.xy).xyzw;
            r3.xyzw = r3.xyzw + -r0.xyzw;
            r1.xyzw = r2.xxxx * r3.xyzw + r0.xyzw;
            o0.w = r1.w;
        }
    }
    r0.xyzw = smplEffectScene_Tex.Sample(smplEffectScene_s, v1.xy).xyzw;
    r2.xyz = max(float3(0, 0, 0), r0.xyz);
    r0.xyz = -r2.xyz + r0.xyz;
    r3.xyz = r2.xyz * float3(0.219999999, 0.219999999, 0.219999999) + float3(0.0299999993, 0.0299999993, 0.0299999993);
    r3.xyz = r2.xyz * r3.xyz + float3(0.00200000009, 0.00200000009, 0.00200000009);
    r4.xyz = r2.xyz * float3(0.219999999, 0.219999999, 0.219999999) + float3(0.300000012, 0.300000012, 0.300000012);
    r2.xyz = r2.xyz * r4.xyz + float3(0.0599999987, 0.0599999987, 0.0599999987);
    r2.xyz = r3.xyz / r2.xyz;
    r2.xyz = float3(-0.0333000012, -0.0333000012, -0.0333000012) + r2.xyz;
    r2.xyz = float3(2.49262953, 2.49262953, 2.49262953) * r2.xyz;
    r2.xyz = min(float3(1, 1, 1), r2.xyz);
    r2.xyz = r2.xyz * SimulateHDRParams.yyy + float3(0.0333000012, 0.0333000012, 0.0333000012);
    r3.xyz = r2.xyz * float3(0.219999999, 0.219999999, 0.219999999) + float3(-0.219999999, -0.219999999, -0.219999999);
    r4.xyz = r2.xyz * float3(0.300000012, 0.300000012, 0.300000012) + float3(-0.0299999993, -0.0299999993, -0.0299999993);
    r2.xyz = r2.xyz * float3(0.0599999987, 0.0599999987, 0.0599999987) + float3(-0.00200000009, -0.00200000009, -0.00200000009);
    r2.xyz = r2.xyz * r3.xyz;
    r2.xyz = float3(4, 4, 4) * r2.xyz;
    r2.xyz = r4.xyz * r4.xyz + -r2.xyz;
    r2.xyz = sqrt(r2.xyz);
    r2.xyz = -r4.xyz + -r2.xyz;
    r3.xyz = r3.xyz + r3.xyz;
    r2.xyz = r2.xyz / r3.xyz;
    r0.xyz = r2.xyz + r0.xyz;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    r0.xyz = max(float3(0, 0, 0), r0.xyz);
    r1.xyz = smplBloom_Tex.Sample(smplBloom_s, v1.xy).xyz;
    r0.xyz = r1.xyz * fBloomWeight + r0.xyz;
    r1.xyz = smplStar_Tex.Sample(smplStar_s, v1.xy).xyz;
    r0.xyz = r1.xyz * fStarWeight + r0.xyz;
    r1.xyz = smplFlare_Tex.Sample(smplFlare_s, v1.xy).xyz;
    r0.xyz = r1.xyz * fLensFlareWeight + r0.xyz;
    r1.xyz = smplLightShaftLinWork2_Tex.Sample(smplLightShaftLinWork2_s, v1.xy).xyz;
    r0.xyz = r1.xyz * vLightShaftPower.xyz + r0.xyz;
    r1.xyz = vColorScale.xyz * r0.xyz;
    r0.w = dot(r1.xyz, float3(0.298909992, 0.586610019, 0.114480004)); // rec601
    r0.xyz = r0.xyz * vColorScale.xyz + -r0.www;
    r0.xyz = vSaturationScale.xyz * r0.xyz + r0.www;
    r1.xy = v1.xy * vScreenSize.xy + -vSpotParams.xy;
    r0.w = dot(r1.xy, r1.xy);
    r1.x = sqrt(r0.w);
    r1.x = -vSpotParams.z + r1.x;
    r1.y = cmp(0 >= r1.x);
    r1.x = saturate(vSpotParams.w / r1.x);
    r1.x = r1.y ? 1 : r1.x;
    r0.w = fLimbDarkening + r0.w;
    r0.w = fLimbDarkening / r0.w;
    r0.w = r0.w * r0.w;
    r1.yzw = r0.www * r0.xyz;
    r1.xyz = r1.yzw * r1.xxx;
    r0.w = 1 + -fLimbDarkeningWeight;
    r1.xyz = fLimbDarkeningWeight * r1.xyz;
    r0.xyz = r0.xyz * r0.www + r1.xyz;
    
    
    float3 untonemapped = r0.xyz;
    
    // original tonemapper
    r1.xyz = r0.xyz * float3(0.219999999, 0.219999999, 0.219999999) + float3(0.0299999993, 0.0299999993, 0.0299999993);
    r1.xyz = r0.xyz * r1.xyz + float3(0.00200000009, 0.00200000009, 0.00200000009);
    r2.xyz = r0.xyz * float3(0.219999999, 0.219999999, 0.219999999) + float3(0.300000012, 0.300000012, 0.300000012);
    r0.xyz = r0.xyz * r2.xyz + float3(0.0599999987, 0.0599999987, 0.0599999987);
    r0.xyz = r1.xyz / r0.xyz;
    r0.xyz = float3(-0.0333000012, -0.0333000012, -0.0333000012) + r0.xyz;
    r0.xyz = SimulateHDRParams.xxx * r0.xyz;
    r0.xyz = log2(r0.xyz);
    r0.xyz = fGamma * r0.xyz;
    o0.xyz = exp2(r0.xyz);
    
    float3 originalSdr = o0.xyz;
    float3 outputColor;
    
    if (injectedData.toneMapType == 0.f)
    {
        originalSdr.rgb = sign(o0.rgb) * pow(abs(o0.rgb), 2.2f); //2.2 gamma
        outputColor = originalSdr;
    }
    else
    {
        outputColor = untonemapped;
        outputColor /= 1.717f; // makes untonemapped better match vanilla sdr mid-tones and shadows
    }
    
    outputColor = max(0, outputColor);
    
    float vanillaMidGray = 0.18f;
    float renoDRTContrast = 1.f;
    float renoDRTFlare = 0.f;
    float renoDRTShadows = 1.f;
    float renoDRTDechroma = injectedData.colorGradeBlowout;
    float renoDRTSaturation = 1.15f;
    float renoDRTHighlights = 1.f;

    renodx::tonemap::Config config = renodx::tonemap::config::Create(
      injectedData.toneMapType,
      injectedData.toneMapPeakNits,
      injectedData.toneMapGameNits,
      0,
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
      renoDRTFlare);
    
    outputColor = renodx::tonemap::config::Apply(outputColor, config);
    
    if (injectedData.toneMapHueCorrection)
    {
        outputColor = renodx::color::correct::Hue(outputColor, originalSdr);
    }
    
    outputColor *= injectedData.toneMapGameNits; // Scale by user nits
    
    outputColor.rgb /= 80.f;
    
    o0.xyz = outputColor.xyz;

    return;
}