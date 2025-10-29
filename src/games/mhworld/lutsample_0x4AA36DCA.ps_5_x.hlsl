#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Fri Jun 27 11:59:33 2025

cbuffer CBRenderFrame : register(b2)
{
  uint iRenderFrame : packoffset(c0);
  uint iTotalTime : packoffset(c0.y);
  uint iTotalTimeEx : packoffset(c0.z);
  float fFPS : packoffset(c0.w);
  float fDeltaTime : packoffset(c1);
  float fSSAOEffect : packoffset(c1.y);
  bool bSSSEnable : packoffset(c1.z) = false;
  bool bIsRenderingWater : packoffset(c1.w) = false;
  float fWaterDepthBias : packoffset(c2);
  uint iGpuMode : packoffset(c2.y);
  float2 fDitherSize : packoffset(c2.z);
  bool bHdrOutput : packoffset(c3) = false;
  float fHdrOutputWhiteLevel : packoffset(c3.y) = {100};
  float fHdrOutputGamutMappingRatio : packoffset(c3.z) = {0};
  float fHdrOutputGamma : packoffset(c3.w) = {1};
  bool bIsGUIHdrGamma : packoffset(c4) = false;
}

cbuffer CBToneMapping : register(b3)
{
  uint iToneMapType : packoffset(c0);
  bool bLuminanceVersion : packoffset(c0.y);
  float fShouldStr : packoffset(c0.z);
  float fLinearStr : packoffset(c0.w);
  float fIntermediate : packoffset(c1);
  float fS1 : packoffset(c1.y);
  float fS2 : packoffset(c1.z);
  float fS3 : packoffset(c1.w);
  float fS4 : packoffset(c2);
  uint iLUTSize : packoffset(c2.y);
  bool bIsLinearToPQ : packoffset(c2.z);
  bool bIsPQToLinear : packoffset(c2.w);
  bool bEnableColorGrading : packoffset(c3);
}

SamplerState SSFilter_s : register(s0);
SamplerState SSColorGrading_s : register(s1);
Texture2D<float4> tBaseMap : register(t0);
Texture3D<float4> tLUT3DMap0 : register(t1);


// 3Dmigoto declarations
#define cmp -

float3 VanillaTonemap(float3 color) {
  const float fShouldStr = 0.25;
  const float fLinearStr = 0.3;
  const float fIntermediate = 1.2;
  const float fS1 = 0.033;
  const float fS2 = 0.06;
  const float fS3 = 0.002;
  const float fS4 = 0.045;

  return fIntermediate * (-fS1 + (((color * fLinearStr + fS4) * color + fS3) / ((color * fShouldStr + fLinearStr) * color + fS2)));
}

float VanillaTonemap(float color) {
  const float fShouldStr = 0.25;
  const float fLinearStr = 0.3;
  const float fIntermediate = 1.2;
  const float fS1 = 0.033;
  const float fS2 = 0.06;
  const float fS3 = 0.002;
  const float fS4 = 0.045;

  return fIntermediate * (-fS1 + (((color * fLinearStr + fS4) * color + fS3) / ((color * fShouldStr + fLinearStr) * color + fS2)));
}

float3 VanillaTonemapByLum(float3 color) {
  const float source_luminance = renodx::color::y::from::BT709(color);

  [branch]
  if (source_luminance > 0.0f) {
    const float compressed_luminance = VanillaTonemap(source_luminance);
    color *= compressed_luminance / source_luminance;
  }

  return color;
}

float3 ExponentialRollOffByLum(float3 color, float output_luminance_max, float highlights_shoulder_start = 0.f) {
  const float source_luminance = renodx::color::y::from::BT709(color);

  [branch]
  if (source_luminance > 0.0f) {
    const float compressed_luminance = renodx::tonemap::ExponentialRollOff(source_luminance, highlights_shoulder_start, output_luminance_max);
    color *= compressed_luminance / source_luminance;
  }

  return color;
}

float3 applyExponentialRollOff(float3 color) {
  const float paperWhite = RENODX_DIFFUSE_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;

  const float peakWhite = RENODX_PEAK_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;

  // const float highlightsShoulderStart = paperWhite;
  const float highlightsShoulderStart = 1.f;

  [branch]
  if (RENODX_TONE_MAP_PER_CHANNEL == 0.f) {
    color = ExponentialRollOffByLum(color * paperWhite, peakWhite, highlightsShoulderStart) / paperWhite;
  } else {
    color = renodx::tonemap::ExponentialRollOff(color * paperWhite, highlightsShoulderStart, peakWhite) / paperWhite;
  }

  return color; 
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TexCoord0,
  float2 w1 : TexCoord1,
  float4 v2 : Color0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = tBaseMap.Sample(SSFilter_s, v1.xy).xyzw;
  
  float3 untonemapped = r0.rgb;

  [branch]
  if (RENODX_TONE_MAP_TYPE == 3.f || RENODX_TONE_MAP_TYPE == 4.f) {
    r0.rgb = renodx::tonemap::dice::BT709(untonemapped, 4.f, 1.f);  // LUT clips at 2k nits + highlight restoration
  }

  [branch]
  if (RENODX_TONE_MAP_TYPE >= 5.f) {
    r0.rgb = ExponentialRollOffByLum(untonemapped, 4.f, 0.f);  // LUT clips at 2k nits + highlight
  }

  [branch]
  if (bEnableColorGrading != 0) {
    r1.x = iLUTSize;
    r1.x = 1 / r1.x;
    r1.y = 0.5 * r1.x;
    r1.z = tLUT3DMap0.Load(float4(0,0,0,0)).w;
    r1.z = 255 * r1.z;
    r2.xyz = saturate(r0.xyz / r1.zzz);
    r3.xyz = log2(r2.xyz);
    r3.xyz = float3(0.159301758,0.159301758,0.159301758) * r3.xyz;
    r3.xyz = exp2(r3.xyz);
    r4.xyz = r3.xyz * float3(18.8515625,18.8515625,18.8515625) + float3(0.8359375,0.8359375,0.8359375);
    r3.xyz = r3.xyz * float3(18.6875,18.6875,18.6875) + float3(1,1,1);
    r3.xyz = r4.xyz / r3.xyz;
    r3.xyz = log2(r3.xyz);
    r3.xyz = float3(78.84375,78.84375,78.84375) * r3.xyz;
    r3.xyz = exp2(r3.xyz);
    r2.xyz = bIsLinearToPQ ? r3.xyz : r2.xyz;
    r1.x = 1 + -r1.x;
    r1.xyw = r2.xyz * r1.xxx + r1.yyy;

    [branch]
    if (RENODX_TONE_MAP_TYPE) {
      r1.xyw = renodx::lut::SampleTetrahedral(tLUT3DMap0, r1.xyw, 32u);
    } else {
      r1.xyw = tLUT3DMap0.SampleLevel(SSColorGrading_s, r1.xyw, 0).xyz;
    }
    
    r2.xyz = saturate(r1.xyw);
    r2.xyz = log2(r2.xyz);
    r2.xyz = float3(0.0126833133,0.0126833133,0.0126833133) * r2.xyz;
    r2.xyz = exp2(r2.xyz);
    r3.xyz = float3(-0.8359375,-0.8359375,-0.8359375) + r2.xyz;
    r2.xyz = -r2.xyz * float3(18.6875,18.6875,18.6875) + float3(18.8515625,18.8515625,18.8515625);
    r2.xyz = r3.xyz / r2.xyz;
    r2.xyz = max(float3(0,0,0), r2.xyz);
    r2.xyz = log2(r2.xyz);
    r2.xyz = float3(6.27739477,6.27739477,6.27739477) * r2.xyz;
    r2.xyz = exp2(r2.xyz);
    r1.xyw = bIsPQToLinear ? r2.xyz : r1.xyw;
    r0.xyz = r1.xyw * r1.zzz;
  }

  o0.rgb = r0.rgb;

  [branch]
  if (RENODX_TONE_MAP_TYPE == 2.f) {
    o0.rgb = VanillaTonemap(o0.rgb);
  } 
  
  [branch]
  if (RENODX_TONE_MAP_TYPE == 3.f) {
    //float3 graded = ToneMapMaxCLL(r0.rgb);
    //graded = renodx::color::correct::Hue(graded, renodx::tonemap::ACESFittedBT709(r0.rgb), 0.5f);

    float3 graded = renodx::tonemap::renodrt::NeutralSDR(r0.rgb);
    graded = lerp(r0.rgb, graded, saturate(renodx::color::y::from::BT709(2.f * graded)));

    //renodx::draw::Config draw_config = renodx::draw::BuildConfig();
    //draw_config.tone_map_type = 3.f;
    //o0.rgb = renodx::draw::ToneMapPass(untonemapped, graded, draw_config);
    //o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb, draw_config);

    float3 mg = VanillaTonemap(float3(0.18f, 0.18f, 0.18f));
    untonemapped *= mg / 0.18f;  

    o0.rgb = renodx::draw::ToneMapPass(untonemapped, graded);
  }

  [branch]
  if (RENODX_TONE_MAP_TYPE == 4.f || RENODX_TONE_MAP_TYPE == 5.f) {
    float3 graded = renodx::tonemap::renodrt::NeutralSDR(r0.rgb);
    graded = lerp(r0.rgb, graded, saturate(renodx::color::y::from::BT709(2.f * graded)));

    float3 mg = VanillaTonemap(float3(0.18f, 0.18f, 0.18f));
    untonemapped *= mg / 0.18f;

    renodx::draw::Config draw_config = renodx::draw::BuildConfig();
    draw_config.peak_white_nits = 10000.f;
    draw_config.tone_map_type = 3.f;
    draw_config.tone_map_per_channel = 0.f;

    o0.rgb = renodx::draw::ToneMapPass(untonemapped, graded, draw_config);

    o0.rgb = applyExponentialRollOff(o0.rgb);
  }

  [branch]
  if (RENODX_TONE_MAP_TYPE == 6.f) {
    o0.rgb = r0.rgb;

    o0.rgb = renodx::tonemap::UpgradeToneMap(
        untonemapped,
        ExponentialRollOffByLum(untonemapped, 4.f, 0.f),
        o0.rgb,
        1.f
    );

    float3 mg = VanillaTonemap(float3(0.18f, 0.18f, 0.18f));
    o0.rgb *= mg / 0.18f;

    [branch]
    if (RENODX_TONE_MAP_HUE_SHIFT >= 0.5f) {
      // only use this
      o0.rgb = renodx::color::correct::Hue(o0.rgb, (VanillaTonemap(o0.rgb)), RENODX_TONE_MAP_HUE_CORRECTION);
    } else {
      o0.rgb = renodx::color::correct::Hue(o0.rgb, (VanillaTonemapByLum(o0.rgb)), RENODX_TONE_MAP_HUE_CORRECTION);
    }

    renodx::draw::Config draw_config = renodx::draw::BuildConfig();
    draw_config.peak_white_nits = 10000.f;
    draw_config.tone_map_type = 3.f;
    draw_config.tone_map_hue_shift = 0.f;
    draw_config.tone_map_hue_correction = 0.f;
    draw_config.tone_map_per_channel = 0.f;

    o0.rgb = renodx::draw::ToneMapPass(o0.rgb, draw_config);

    o0.rgb = applyExponentialRollOff(o0.rgb);
  }  

  [branch]
  if (RENODX_TONE_MAP_TYPE) {
    o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);
    o0.w = r0.w;
    return;
  }

  r1.x = cmp(iToneMapType == 5);
  if (r1.x != 0) { // unused
    // incomplete Narkowicz ACES
    r1.xyz = r0.xyz * float3(2.50999999,2.50999999,2.50999999) + float3(0.0299999993,0.0299999993,0.0299999993);
    r1.xyz = r1.xyz * r0.xyz;
    r2.xyz = r0.xyz * float3(2.43000007,2.43000007,2.43000007) + float3(0.589999974,0.589999974,0.589999974);
    r2.xyz = r0.xyz * r2.xyz + float3(0.140000001,0.140000001,0.140000001);
    r0.xyz = r1.xyz / r2.xyz;
  } else {
    r1.x = cmp(iToneMapType == 6);
    if (r1.x != 0) {  // sdr + hdr tonemapper
	    // per channel compression?
      r1.xyz = r0.xyz * fLinearStr + fS4;
      r1.xyz = r1.xyz * r0.xyz + fS3;
      r2.xyz = r0.xyz * fShouldStr + fLinearStr;
      r2.xyz = r2.xyz * r0.xyz + fS2;
      r1.xyz = r1.xyz / r2.xyz;
      r1.xyz = -fS1 + r1.xyz;
      r0.xyz = fIntermediate * r1.xyz;
    } else { // doesn't run
      if (bLuminanceVersion != 0) {
        r1.x = dot(r0.xyz, float3(0.299010009,0.587000012,0.114));
        switch (iToneMapType) {
          case 1 :          break;
          case 2 :          r1.y = -1.44269502 * r1.x;
          r1.y = exp2(r1.y);
          r1.y = 1 + -r1.y;
          r1.y = r1.y / r1.x;
          r0.xyz = r1.yyy * r0.xyz;
          break;
          case 3 :          r1.y = -1.44269502 * r1.x;
          r1.y = exp2(r1.y);
          r1.y = 1 + -r1.y;
          r1.y = max(0, r1.y);
          r1.y = log2(r1.y);
          r1.y = 1.5 * r1.y;
          r1.y = exp2(r1.y);
          r1.y = r1.y / r1.x;
          r0.xyz = r1.yyy * r0.xyz;
          break;
          case 4 :          r1.x = 1 + r1.x;
          r0.xyz = r0.xyz / r1.xxx;
          break;
          default :
          break;
        }
      } else {
        switch (iToneMapType) {
          case 1 :          break;
          case 2 :          r1.xyz = float3(-1.44269502,-1.44269502,-1.44269502) * r0.xyz;
          r1.xyz = exp2(r1.xyz);
          r0.xyz = float3(1,1,1) + -r1.xyz;
          break;
          case 3 :          r1.xyz = float3(-1.44269502,-1.44269502,-1.44269502) * r0.xyz;
          r1.xyz = exp2(r1.xyz);
          r1.xyz = float3(1,1,1) + -r1.xyz;
          r1.xyz = max(float3(0,0,0), r1.xyz);
          r1.xyz = log2(r1.xyz);
          r1.xyz = float3(1.5,1.5,1.5) * r1.xyz;
          r0.xyz = exp2(r1.xyz);
          break;
          case 4 :          r1.xyz = float3(1,1,1) + r0.xyz;
          r0.xyz = r0.xyz / r1.xyz;
          break;
          default :
          break;
        }
      }
    }
  }

  if (RENODX_TONE_MAP_TYPE) {
    o0.rgb = r0.rgb;
    o0.w = r0.w;
    return;
  }
  
  r1.x = cmp(bHdrOutput != 0);
  r1.y = cmp(bIsGUIHdrGamma == 0);
  r1.x = r1.y ? r1.x : 0;
  r1.yzw = cmp(r0.xyz < float3(1,1,1));
  r2.xyz = max(float3(0,0,0), r0.xyz);
  r2.xyz = log2(r2.xyz);
  r2.xyz = fHdrOutputGamma * r2.xyz;
  r2.xyz = exp2(r2.xyz);
  r1.yzw = r1.yzw ? r2.xyz : r0.xyz;
  o0.xyz = r1.xxx ? r1.yzw : r0.xyz;
  o0.w = r0.w;
  return;
}