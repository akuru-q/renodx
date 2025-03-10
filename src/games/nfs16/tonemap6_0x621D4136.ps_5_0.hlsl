#include "./common.hlsl"

cbuffer _Globals : register(b0){
  float2 invPixelSize : packoffset(c0);
  float3 filmGrainColorScale : packoffset(c1);
  float4 filmGrainTextureScaleAndOffset : packoffset(c2);
  float4 color : packoffset(c3);
  float4 colorMatrix0 : packoffset(c4);
  float4 colorMatrix1 : packoffset(c5);
  float4 colorMatrix2 : packoffset(c6);
  float4 ironsightsDofParams : packoffset(c7);
  float4 filmicLensDistortParams : packoffset(c8);
  float4 colorScale : packoffset(c9);
  float3 depthScaleFactors : packoffset(c10);
  float4 dofParams : packoffset(c11);
  float4 dofParams2 : packoffset(c12);
  float4 dofDebugParams : packoffset(c13);
  float3 bloomScale : packoffset(c14);
  float3 luminanceVector : packoffset(c15);
  float3 vignetteParams : packoffset(c16);
  float4 vignetteColor : packoffset(c17);
  float4 chromostereopsisParams : packoffset(c18);
  float4 distortionScaleOffset : packoffset(c19);
  float3 maxClampColor : packoffset(c20);
  float fftBloomSpikeDampingScale : packoffset(c20.w);
  float4 fftKernelSampleScales : packoffset(c21);
}
SamplerState mainTextureSampler_s : register(s0);
SamplerState colorGradingTextureSampler_s : register(s1);
SamplerState tonemapBloomTextureSampler_s : register(s2);
Texture2D<float4> mainTexture : register(t0);
Texture3D<float4> colorGradingTexture : register(t1);
Texture2D<float4> tonemapBloomTexture : register(t2);

#define cmp -

void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(-0.5,-0.5) + v2.xy;
  r0.z = dot(r0.xy, r0.xy);
  r0.w = cmp(abs(filmicLensDistortParams.y) < 9.99999975e-05);
  if (r0.w != 0) {
    r0.w = r0.z * filmicLensDistortParams.x + 1;
    r0.w = filmicLensDistortParams.z * r0.w;
  } else {
    r1.x = sqrt(r0.z);
    r1.x = filmicLensDistortParams.y * r1.x + filmicLensDistortParams.x;
    r0.z = r0.z * r1.x + 1;
    r0.w = filmicLensDistortParams.w * r0.z;
  }
  r1.xyzw = r0.xyxy * r0.wwww;
  r0.zw = r0.xy * r0.ww + float2(0.5,0.5);
  r2.z = mainTexture.Sample(mainTextureSampler_s, r0.zw).z;
  r3.xyz = tonemapBloomTexture.Sample(tonemapBloomTextureSampler_s, r0.zw).xyz;
  r1.xyzw = r1.xyzw + r1.xyzw;
  r1.xyzw = r1.xyzw * chromostereopsisParams.xyzw + float4(0.5,0.5,0.5,0.5);
  r2.x = mainTexture.Sample(mainTextureSampler_s, r1.xy).x;
  r2.y = mainTexture.Sample(mainTextureSampler_s, r1.zw).y;
  r1.xyz = r3.xyz * bloomScale.xyz * injectedData.fxBloom + r2.xyz;
  r1.xyz = colorScale.xyz * r1.xyz;
  r0.xy = vignetteParams.xy * r0.xy * min(1, injectedData.fxVignette);
  r0.x = dot(r0.xy, r0.xy);
  r0.x = saturate(-r0.x * vignetteColor.w + 1);
  r0.x = log2(r0.x);
  r0.x = vignetteParams.z * r0.x * max(1, injectedData.fxVignette);;
  r0.x = exp2(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  float3 untonemapped = r0.rgb;
  r1.xyz = float3(0.985521019,0.985521019,0.985521019) * r0.xyz;
  r2.xyz = r0.xyz * float3(0.985521019,0.985521019,0.985521019) + float3(0.058662001,0.058662001,0.058662001);
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = r0.xyz * float3(0.774596989,0.774596989,0.774596989) + float3(0.0482814983,0.0482814983,0.0482814983);
  r0.xyz = r0.xyz * float3(0.774596989,0.774596989,0.774596989) + float3(1.24270999,1.24270999,1.24270999);
  r0.xyz = r2.xyz * r0.xyz;
  r0.xyz = r1.xyz / r0.xyz;
  float3 LUTless = r0.rgb;
  r1.xyz = float3(12.9200001,12.9200001,12.9200001) * r0.xyz;
  r2.xyz = log2(abs(r0.xyz));
  r2.xyz = float3(0.416666657,0.416666657,0.416666657) * r2.xyz;
  r2.xyz = exp2(r2.xyz);
  r2.xyz = r2.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  r0.xyz = cmp(float3(0.00313080009,0.00313080009,0.00313080009) >= r0.xyz);
  r0.xyz = r0.xyz ? r1.xyz : r2.xyz;
  r0.xyz = r0.xyz * float3(0.96875,0.96875,0.96875) + float3(0.015625,0.015625,0.015625);
  r0.xyz = colorGradingTexture.Sample(colorGradingTextureSampler_s, r0.xyz).xyz;
  r0.rgb = applyUserTonemap(untonemapped, colorGradingTexture, colorGradingTextureSampler_s, LUTless);
  o0.w = renodx::color::y::from::BT709(r0.rgb);
  o0.xyz = r0.xyz;
  o0.rgb = PostToneMapScale(o0.rgb);
  return;
}