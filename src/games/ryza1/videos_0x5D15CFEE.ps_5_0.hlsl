// ---- Created with 3Dmigoto v1.3.16 on Mon Jul  8 23:38:24 2024
#include "./shared.h"

cbuffer _Globals : register(b0)
{
  float vATest : packoffset(c0);
}

SamplerState smp_s : register(s0);
Texture2D<float4> tex : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = -vATest + v1.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = tex.Sample(smp_s, v2.xy).xyzw;
  o0.xyz = v1.xyz * r0.xyz;
  o0.w = v1.w;
  //o0.xyzw *= 9999.0f; 
  
  //videos only lets go
  o0.rgb = sign(o0.rgb) * pow(abs(o0.rgb), 2.2f); //2.2
  o0.rgb *= injectedData.toneMapUINits / 80.f;
  return; 
}