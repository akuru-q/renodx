#include "./shared.h"

cbuffer cParam : register(b0)
{
  float4 cParam[3] : packoffset(c0);
}

cbuffer cSamplingOffset : register(b1)
{
  float4 cSamplingOffset[8] : packoffset(c0);
}


void main(
  float4 v0 : POSITION0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  float radiusMult = injectedData.bloomRadiusMult;
  float4 adjustments = cParam[1].xyzw;
  adjustments.x = 1 + (1 - adjustments.x) * radiusMult;
  adjustments.y = 1 + (1 - adjustments.y) * radiusMult;
  adjustments.z = (1 - adjustments.x) * 0.5;
  adjustments.w = (1 - adjustments.y) * 0.5;

  float4 r0;
  r0.xy = v0.xy * cParam[0].xy + cParam[0].zw;
  o0.xy = r0.xy * float2(2,-2) + float2(-1,1);
  o0.z = cParam[2].x;
  o0.w = 1;
  r0.xy = cSamplingOffset[4].xy + v0.zw;
  o1.xy = r0.xy * adjustments.xy + adjustments.zw;

  r0.xyzw = cSamplingOffset[0].xyzw * radiusMult + v0.zwzw;
  o2.xyzw = r0.xyzw * adjustments.xyxy + adjustments.zwzw;
  r0.xyzw = cSamplingOffset[1].xyzw * radiusMult + v0.zwzw;
  o3.xyzw = r0.xyzw * adjustments.xyxy + adjustments.zwzw;
  r0.xyzw = cSamplingOffset[2].xyzw * radiusMult + v0.zwzw;
  o4.xyzw = r0.xyzw * adjustments.xyxy + adjustments.zwzw;
  r0.xyzw = cSamplingOffset[3].xyzw * radiusMult + v0.zwzw;
  o5.xyzw = r0.xyzw * adjustments.xyxy + adjustments.zwzw;
  return;
}