#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Wed Mar 26 19:16:34 2025

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
  float4 g_vP2V : packoffset(c14);
  float4x4 g_mV2W : packoffset(c15);
  float4 g_vDramaticHdrLutInfo0[2] : packoffset(c19);
  float4 g_vDramaticHdrLutInfo1[2] : packoffset(c21);
  float4 g_vDrawFixParams : packoffset(c23);
}

SamplerState sampleLinear_s : register(s7);
Texture2D<float4> g_tSceneMap : register(t0);
Texture2D<float4> g_tLensFlareMap : register(t1);
Texture2D<float4> g_tExposureScaleInfo : register(t2);
Texture3D<float4> g_tHdrLut : register(t3);
Texture3D<float4> g_tLdrLut : register(t4);


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
  r0.zw = cmp(float2(0,0) < g_vDrawFixParams.xy);
  r1.x = cmp(g_vCompositeInfo.z < 0);
  r1.y = g_tExposureScaleInfo.Load(float4(0,0,0,0)).x;
  r1.zw = cmp(float2(0,0) < g_vCompositeInfo.zy);
  r1.z = r1.z ? g_vCompositeInfo.z : 1;
  r1.x = r1.x ? r1.y : r1.z;
  r1.yz = v1.xy * g_vCompositeLastViewport.zw + g_vCompositeLastViewport.xy;
  r2.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r1.yz, 0).xyz;
  r2.xyz = min(float3(65024,65024,65024), r2.xyz);
  r2.w = cmp(0 < g_vEtcEffect.x);
  if (r2.w != 0) {
    r2.w = (uint)g_vEtcEffect.y;
    r3.xy = r1.yz * float2(2,2) + float2(-1,-1);
    r3.z = dot(r3.xy, r3.xy);
    r3.xy = r3.xy * r3.zz;
    r3.xy = g_vEtcEffect.xx * r3.xy;
    r3.zw = g_vSceneTexSize.xy * -r3.xy;
    r3.zw = float2(0.5,0.5) * r3.zw;
    r3.z = dot(r3.zw, r3.zw);
    r3.z = sqrt(r3.z);
    r3.z = (int)r3.z;
    r3.z = max(3, (int)r3.z);
    r3.z = min(16, (int)r3.z);
    r3.w = (int)r3.z;
    r3.xy = -r3.xy / r3.ww;
    r4.xyz = icb[r2.w+0].xyz * r2.xyz;
    r5.xy = (int2)r2.ww + int2(1,2);
    r6.xyz = icb[r5.x+0].xyz + -icb[r2.w+0].xyz;
    r5.yzw = icb[r5.y+0].xyz + -icb[r5.x+0].xyz;
    r7.xyz = r4.xyz;
    r8.xyz = icb[r2.w+0].xyz;
    r9.xy = r1.yz;
    r4.w = 1;
    while (true) {
      r6.w = cmp((int)r4.w >= (int)r3.z);
      if (r6.w != 0) break;
      r9.xy = r9.xy + r3.xy;
      r10.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r9.xy, 0).xyz;
      r10.xyz = min(float3(65024,65024,65024), r10.xyz);
      r6.w = (int)r4.w;
      r6.w = r6.w / r3.w;
      r7.w = cmp(r6.w < 0.5);
      if (r7.w != 0) {
        r7.w = r6.w + r6.w;
        r11.xyz = r7.www * r6.xyz + icb[r2.w+0].xyz;
      } else {
        r6.w = r6.w * 2 + -1;
        r11.xyz = r6.www * r5.yzw + icb[r5.x+0].xyz;
      }
      r7.xyz = r10.xyz * r11.xyz + r7.xyz;
      r8.xyz = r11.xyz + r8.xyz;
      r4.w = (int)r4.w + 1;
    }
    r2.xyz = r7.xyz / r8.xyz;
  }
  r2.xyz = r2.xyz * r1.xxx;
  if (r0.z != 0) {
    r0.z = dot(v0.xy, float2(171,231));
    r3.xyz = float3(0.00970873795,0.0140845068,0.010309278) * r0.zzz;
    r3.xyz = frac(r3.xyz);
    r3.xyz = r3.xyz * float3(0.00392156886,0.00392156886,0.00392156886) + r2.xyz;
    r3.xyz = float3(-0.00196078443,-0.00196078443,-0.00196078443) + r3.xyz;
    r2.xyz = max(float3(0,0,0), r3.xyz);
  }
  if (r0.x != 0) {
    r3.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, g_vSun2dInfo.xy, 0).xyz;
    r3.xyz = min(float3(65024,65024,65024), r3.xyz);
    r3.xyz = r3.xyz * r1.xxx;
    r4.xyz = g_tLensFlareMap.SampleLevel(sampleLinear_s, r1.yz, 0).xyz;
    r4.xyz = min(float3(65024,65024,65024), r4.xyz);
    r0.x = dot(r3.xyz, float3(0.222014993,0.706655025,0.0713300034));
    r0.x = cmp(g_vEtcEffect.w < r0.x);
    r0.x = r0.x ? g_vEtcEffect.z : 0;
    r3.xyz = r4.xyz * r3.xyz;
    r2.xyz = r3.xyz * r0.xxx + r2.xyz;
  }
  if (r0.y != 0) {
    r0.yz = float2(-0.5,-0.5) + r1.yz;
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
    r2.xyz = r2.xyz * r0.xxx;
  }

  float3 untonemapped = r2.rgb;

  r0.xyz = r2.xyz * float3(1.00006652,1.00006652,1.00006652) + float3(-0.00391646381,-0.00391646381,-0.00391646381);
  r0.xyz = r0.www ? r0.xyz : r2.xyz;
  r0.xyz = r0.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = saturate(r0.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));
  r0.xyz = g_tHdrLut.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
  if (r1.w != 0) {
    r1.xyz = saturate(r0.xyz);
    r1.xyz = log2(r1.xyz);
    r1.xyz = float3(0.454545468,0.454545468,0.454545468) * r1.xyz;
    r1.xyz = exp2(r1.xyz);
    r1.xyz = g_tLdrLut.SampleLevel(sampleLinear_s, r1.xyz, 0).xyz;
    r1.xyz = r1.xyz + -r0.xyz;
    r0.xyz = g_vCompositeInfo.yyy * r1.xyz + r0.xyz;
  }
  r0.w = cmp(g_vGammaCorrection.x != 1.000000);
  r1.xyz = log2(abs(r0.xyz));
  r1.xyz = g_vGammaCorrection.xxx * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r0.xyz = r0.www ? r1.xyz : r0.xyz;
  o0.xyz = g_vRadialBlurCenter.zzz * r0.xyz;
  o0.w = 1;

  if (RENODX_TONE_MAP_TYPE != 0) {
    o0.rgb = renodx::draw::ToneMapPass(untonemapped, o0.rgb);
  }

  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);

  return;
}