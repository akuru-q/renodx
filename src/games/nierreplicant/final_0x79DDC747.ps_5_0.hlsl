#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 27 13:38:21 2024

SamplerState tex_Color_s_s : register(s0);
Texture2D<float4> tex_Color : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = tex_Color.Sample(tex_Color_s_s, v1.xy).xyz;

  o0.rgb = r0.rgb;

  //if (injectedData.toneMapGammaCorrection == 1.f) {
  //  o0.xyz = renodx::color::correct::GammaSafe(o0.xyz);
  //}
  //
  //o0.xyz *= injectedData.toneMapUINits;
  //o0.xyz /= 80.f;

  o0.w = 1.f;

  return;

  // r1.xyz = log2(abs(r0.xyz));
  // r1.xyz = float3(0.416666657,0.416666657,0.416666657) * r1.xyz;
  // r1.xyz = exp2(r1.xyz);
  r1.rgb = r0.rgb;

  //r1.xyz = r1.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  r2.xyz = cmp(float3(0.00313080009,0.00313080009,0.00313080009) >= r0.xyz);
  r0.xyz = float3(12.9200001,12.9200001,12.9200001) * r0.xyz;
  o0.xyz = r2.xyz ? r0.xyz : r1.xyz;
  o0.w = 1;

  return;
}