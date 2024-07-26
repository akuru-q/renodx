// ---- Created with 3Dmigoto v1.3.16 on Mon Jul  8 23:38:21 2024
#include "./shared.h"

cbuffer _Globals : register(b0)
{
  float4 materialColor : packoffset(c0) = {1,1,1,1};
  bool maskFlag : packoffset(c1) = false;
  bool ignoreVtxColorFlag : packoffset(c1.y) = false;
  float greyScaleRatio : packoffset(c1.z) = {0};
}

SamplerState __smpsTex_s : register(s0);
Texture2D<float4> sTex : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : SV_Position0,
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = sTex.Sample(__smpsTex_s, v2.xy).xyzw;
  //r1.x = dot(r0.xyz, float3(0.300000012,0.589999974,0.109999999)); // rec601 og code
  r1.x = dot(r0.xyz, float3(0.2126390059f, 0.7151686788f, 0.0721923154f)); // fixed to rec709
  r1.xyz = r1.xxx + -r0.xyz;
  r1.w = 0;
  r0.xyzw = greyScaleRatio * r1.xyzw + r0.xyzw;
  r1.w = r0.w;
  r1.x = 1;
  r0.xyzw = maskFlag ? r1.xxxw : r0.xyzw;
  r1.xyzw = ignoreVtxColorFlag ? float4(1,1,1,1) : v0.xyzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r1.x = r0.w * materialColor.w + -0.00392156886;
  r0.xyzw = materialColor.xyzw * r0.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = cmp(r1.x < 0);
  if (r0.x != 0) discard;
  //o0.xyzw *= 9999.0f; 
  
  o0.rgb = sign(o0.rgb) * pow(abs(o0.rgb), 2.2f);
  o0.rgb *= injectedData.toneMapUINits / 80.f;
  
  //DO NOT TOUCH o0.w component!!!
  // dont do this: o0.xyzw*=1.5f;
  return; 
  
  //UI + Battle UI
}