#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Sat Mar 22 17:33:48 2025

cbuffer cbComposite : register(b2)
{
  float4 g_vSceneTexSize : packoffset(c0);
  float4 g_vCompositeInfo : packoffset(c1);
  float4 g_vSun2dInfo : packoffset(c2);
  float4 g_vEtcEffect : packoffset(c3);
  float4 g_vBloomInfo : packoffset(c4);
  float4 g_vLimbDarkenningInfo : packoffset(c5);
  float4 g_vFxaaParams : packoffset(c6);
  float4 g_vGammaCorrection : packoffset(c7);
  float4 g_vRadialBlurCenter : packoffset(c8);
  float4 g_vRadialBlurInfo : packoffset(c9);
  float4 g_vFxaaQualityParams : packoffset(c10);
  float4 g_vCompositeLastViewport : packoffset(c11);
  float4 g_vMaxUV : packoffset(c12);
  float4 g_vMinUV : packoffset(c13);
}

cbuffer cbCompositeCustom : register(b5)
{
  float4 g_vColorScale : packoffset(c0);
  float4 g_vSaturationScale : packoffset(c1);
  float4 g_vHdrTvParams : packoffset(c2);
}

SamplerState sampleLinear_s : register(s7);
Texture2D<float4> g_tSceneMap : register(t0);
Texture2D<float4> g_tLensFlareMap : register(t1);
Texture2D<float4> g_tExposureScaleInfo : register(t2);
Texture3D<float4> g_tHdrLut : register(t3);
Texture3D<float4> g_tLdrLut : register(t4);
Texture3D<float4> g_tSpecificShaft : register(t5);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  const float4 icb[] = { { 0, 0, 1.000000, 0},
                              { 0, 1.000000, 0, 0},
                              { 1.000000, 0, 0, 0},
                              { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 1.000000, 0, 0},
                              { 1.000000, 0, 0, 0},
                              { 1.000000, 0, 1.000000, 0},
                              { 1.000000, 0, 1.000000, 0},
                              { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < g_vSun2dInfo.z);
  r0.y = cmp(0 < g_vLimbDarkenningInfo.w);
  r0.z = cmp(g_vCompositeInfo.z < 0);
  r0.w = g_tExposureScaleInfo.Load(float4(0,0,0,0)).x;
  r1.xy = cmp(float2(0,0) < g_vCompositeInfo.zy);
  r1.x = r1.x ? g_vCompositeInfo.z : 1;
  r0.z = r0.z ? r0.w : r1.x;
  r2.xy = v1.xy * g_vCompositeLastViewport.zw + g_vCompositeLastViewport.xy;
  r3.xyzw = g_tSceneMap.SampleLevel(sampleLinear_s, r2.xy, 0).xyzw;
  r3.xyzw = min(float4(65024,65024,65024,65024), r3.xyzw);
  r0.w = cmp(0 < g_vEtcEffect.x);
  if (r0.w != 0) {
    r0.w = (uint)g_vEtcEffect.y;
    r1.xz = r2.xy * float2(2,2) + float2(-1,-1);
    r1.w = dot(r1.xz, r1.xz);
    r1.xz = r1.xz * r1.ww;
    r1.xz = g_vEtcEffect.xx * r1.xz;
    r4.xy = g_vSceneTexSize.xy * -r1.xz;
    r4.xy = float2(0.5,0.5) * r4.xy;
    r1.w = dot(r4.xy, r4.xy);
    r1.w = sqrt(r1.w);
    r1.w = (int)r1.w;
    r1.w = max(3, (int)r1.w);
    r1.w = min(16, (int)r1.w);
    r2.w = (int)r1.w;
    r1.xz = -r1.xz / r2.ww;
    r4.xyz = icb[r0.w+0].xyz * r3.xyz;
    r5.xy = (int2)r0.ww + int2(1,2);
    r6.xyz = icb[r5.x+0].xyz + -icb[r0.w+0].xyz;
    r5.yzw = icb[r5.y+0].xyz + -icb[r5.x+0].xyz;
    r7.xyz = r4.xyz;
    r8.xyz = icb[r0.w+0].xyz;
    r9.xy = r2.xy;
    r4.w = 1;
    while (true) {
      r6.w = cmp((int)r4.w >= (int)r1.w);
      if (r6.w != 0) break;
      r9.xy = r9.xy + r1.xz;
      r10.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r9.xy, 0).xyz;
      r10.xyz = min(float3(65024,65024,65024), r10.xyz);
      r6.w = (int)r4.w;
      r6.w = r6.w / r2.w;
      r7.w = cmp(r6.w < 0.5);
      if (r7.w != 0) {
        r7.w = r6.w + r6.w;
        r11.xyz = r7.www * r6.xyz + icb[r0.w+0].xyz;
      } else {
        r6.w = r6.w * 2 + -1;
        r11.xyz = r6.www * r5.yzw + icb[r5.x+0].xyz;
      }
      r7.xyz = r10.xyz * r11.xyz + r7.xyz;
      r8.xyz = r11.xyz + r8.xyz;
      r4.w = (int)r4.w + 1;
    }
    r3.xyz = r7.xyz / r8.xyz;
  }
  r1.xzw = r3.xyz * r0.zzz;
  if (r0.x != 0) {
    r3.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, g_vSun2dInfo.xy, 0).xyz;
    r3.xyz = min(float3(65024,65024,65024), r3.xyz);
    r0.xzw = r3.xyz * r0.zzz;
    r3.xyz = g_tLensFlareMap.SampleLevel(sampleLinear_s, r2.xy, 0).xyz;
    r3.xyz = min(float3(65024,65024,65024), r3.xyz);
    r2.w = dot(r0.xzw, float3(0.222014993,0.706655025,0.0713300034));
    r2.w = cmp(g_vEtcEffect.w < r2.w);
    r2.w = r2.w ? g_vEtcEffect.z : 0;
    r0.xzw = r3.xyz * r0.xzw;
    r1.xzw = r0.xzw * r2.www + r1.xzw;
  }
  r0.x = cmp(0 < g_vColorScale.w);
  if (r0.x != 0) {
    r2.z = 0;
    r0.xzw = g_tSpecificShaft.SampleLevel(sampleLinear_s, r2.xyz, 0).xyz;
    r0.xzw = min(float3(65024,65024,65024), r0.xzw);
    r1.xzw = r1.xzw + r0.xzw;
  }
  if (r0.y != 0) {
    r0.yz = float2(-0.5,-0.5) + r2.xy;
    r0.x = g_vCompositeInfo.x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.y = sqrt(r0.x);
    r0.y = -g_vLimbDarkenningInfo.y + r0.y;
    r0.z = cmp(0 < r0.y);
    r0.y = saturate(-r0.y * g_vLimbDarkenningInfo.z + 1);
    r0.y = r0.z ? r0.y : 1;
    r0.z = cmp(0 < r0.y);
    r0.x = g_vLimbDarkenningInfo.x + r0.x;
    r0.x = g_vLimbDarkenningInfo.x / r0.x;
    r0.x = r0.x * r0.x;
    r0.x = r0.z ? r0.x : 1;
    r0.x = r0.x * r0.y;
    r0.y = 1 + -g_vLimbDarkenningInfo.w;
    r0.x = r0.x * g_vLimbDarkenningInfo.w + r0.y;
    r1.xzw = r1.xzw * r0.xxx;
  }

  float3 untonemapped = r1.xzw;

  r0.x = cmp(0 < g_vSaturationScale.w);
  if (r0.x != 0) {
    r0.xyz = r1.xzw * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
    r0.xyz = log2(r0.xyz);
    r0.xyz = saturate(r0.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));
    r1.xzw = g_tHdrLut.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
  }

  float3 hdrLut = r1.xzw;
  float3 ldrLut;

  if (r1.y != 0) {
    r0.xyz = saturate(g_vHdrTvParams.xxx * r1.xzw);
    r0.xyz = log2(r0.xyz);
    r0.xyz = float3(0.454545468,0.454545468,0.454545468) * r0.xyz;
    r0.xyz = exp2(r0.xyz);
    r0.xyz = g_tLdrLut.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
    r2.xyz = cmp(g_vHdrTvParams.yyy >= r1.xzw);
    r0.xyz = g_vHdrTvParams.yyy * r0.xyz;

    ldrLut = r0.rgb;

    r0.xyz = r2.xyz ? r0.xyz : r1.xzw;
    r0.xyz = r0.xyz + -r1.xzw;
    r1.xzw = g_vCompositeInfo.yyy * r0.xyz + r1.xzw;
  }

  // better ldr and hdr lut blending
  //hdrLut *= 10.f;
  //ldrLut *= 10.f;
  //r1.xzw = renodx::tonemap::UpgradeToneMap(hdrLut, renodx::tonemap::renodrt::NeutralSDR(hdrLut), ldrLut, g_vCompositeInfo.y);
  //r1.xzw /= 10.f;

  r0.xyz = g_vColorScale.xyz * r1.xzw;
  r0.x = dot(r0.xyz, float3(0.298909992,0.586610019,0.114480004));
  r0.yzw = r1.xzw * g_vColorScale.xyz + -r0.xxx;
  r0.xyz = g_vSaturationScale.xyz * r0.yzw + r0.xxx;
  r0.w = cmp(g_vGammaCorrection.x != 1.000000);
  r1.xyz = log2(abs(r0.xyz));
  r1.xyz = g_vGammaCorrection.xxx * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r0.xyz = r0.www ? r1.xyz : r0.xyz;

  // o0.xyz = g_vRadialBlurCenter.zzz * r0.xyz;
  // DLSS: z = 10.f, w = (unused but stays 10.f) | FXAA: z = 1.f, w = 10.f (fxaa shader)
  o0.xyz = 10.f * r0.xyz;

  o0.w = r3.w;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = renodx::draw::ToneMapPass(untonemapped, renodx::tonemap::renodrt::NeutralSDR(o0.rgb));
  }

  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);

  return;
}