#include "./shared.h"

cbuffer DrawableBuffer : register(b1)
{
  float4 FogColor : packoffset(c0);
  float4 DebugColor : packoffset(c1);
  float AlphaThreshold : packoffset(c2);
  float4 __InstancedMaterialOpacity[12] : packoffset(c3);
}

cbuffer SceneBuffer : register(b2)
{
  row_major float4x4 View : packoffset(c0);
  row_major float4x4 ScreenMatrix : packoffset(c4);
  float2 DepthExportScale : packoffset(c8);
  float4 FogParams : packoffset(c9);
  float3 __CameraPosition : packoffset(c10);
  float3 CameraDirection : packoffset(c11);
  float3 DepthFactors : packoffset(c12);
  float2 ShadowDepthBias : packoffset(c13);
  float4 SubframeViewport : packoffset(c14);
  row_major float3x4 DepthToWorld : packoffset(c15);
  float4 DepthToView : packoffset(c18);
  float4 OneOverDepthToView : packoffset(c19);
  float4 DepthToW : packoffset(c20);
  float4 ClipPlane : packoffset(c21);
  float2 ViewportDepthScaleOffset : packoffset(c22);
  float2 ColorDOFDepthScaleOffset : packoffset(c23);
  float2 TimeVector : packoffset(c24);
  float3 FogParams2 : packoffset(c25);
  float3 GlobalAmbient : packoffset(c26);
  float4 GlobalParams[16] : packoffset(c27);
  float4 ViewToFogH : packoffset(c43);
  float4 ScreenExtents : packoffset(c44);
  float2 ScreenResolution : packoffset(c45);
  float4 PSSMToMap1Lin : packoffset(c46);
  float4 PSSMToMap1Const : packoffset(c47);
  float4 PSSMToMap2Lin : packoffset(c48);
  float4 PSSMToMap2Const : packoffset(c49);
  float4 PSSMToMap3Lin : packoffset(c50);
  float4 PSSMToMap3Const : packoffset(c51);
  float4 PSSMDistances : packoffset(c52);
  row_major float4x4 WorldToPSSM0 : packoffset(c53);
  row_major float4x4 PrevViewProject : packoffset(c57);
  row_major float4x4 PrevWorld : packoffset(c61);
  row_major float4x4 ViewT : packoffset(c65);
  float4 PSSMExtents : packoffset(c69);
  float4 ShadowAtlasResolution : packoffset(c70);
  float4 UnitRimData[3] : packoffset(c71);
  float3 __CameraPositionForCorrection : packoffset(c74);
  row_major float4x4 InverseProjection : packoffset(c80);
  float4 StereoOffset : packoffset(c84);
}

cbuffer MaterialBuffer : register(b3)
{
  float4 MaterialParams[32] : packoffset(c0);
}

cbuffer InstanceBuffer : register(b5)
{

  struct
  {
    float4 InstanceParams[8];
    float4 ExtendedInstanceParams[16];
  } InstanceParameters[12] : packoffset(c0);

}

SamplerState p_default_Material_1376C724912777_0BF50A1C106154_Texture_sampler_s : register(s0);
Texture2D<float4> p_default_Material_1376C724912777_0BF50A1C106154_Texture_texture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  nointerpolation uint4 v0 : PSIZE0,
  float4 v1 : SV_POSITION0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x * 24;
  r0.xyz = InstanceParameters[r0.x].InstanceParams[0].xxx * v2.xyz;
  r0.xyz = MaterialParams[0].yyy * r0.xyz;
  r0.w = max(1, r0.z);
  r1.x = max(r0.x, r0.y);
  r0.w = max(r1.x, r0.w);
  r0.w = 1 / r0.w;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = GlobalParams[1].www * r0.xyz;
  r0.xyzw = p_default_Material_1376C724912777_0BF50A1C106154_Texture_texture.Sample(p_default_Material_1376C724912777_0BF50A1C106154_Texture_sampler_s, v3.xy).xyzw;
  // r0.x = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
  r0.x = renodx::color::y::from::BT709(abs(r0.xyz));
  r0.x = v2.w * r0.x;
  r0.y = v0.x;
  o0.w = __InstancedMaterialOpacity[r0.y].x * r0.x;
  o0.w *= CUSTOM_LENS_FLARE;
  return;
}