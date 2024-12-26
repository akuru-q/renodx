#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 27 13:38:19 2024

cbuffer CbTonemap : register(b0)
{
  float max_luminance : packoffset(c0);
  float base_luminance : packoffset(c0.y);
  float exposure : packoffset(c0.z);
  float contrast : packoffset(c0.w);
  float mid_start : packoffset(c1);
  float mid_length : packoffset(c1.y);
  float toe : packoffset(c1.z);
  float toe_offset : packoffset(c1.w);
  float2 mask : packoffset(c2);
  float inui_branch : packoffset(c2.z);
  float inui_slope : packoffset(c2.w);
  float inui_a : packoffset(c3);
  float inui_m : packoffset(c3.y);
  float inui_s : packoffset(c3.z);
  float min_luminance : packoffset(c3.w);
  float user_gamma : packoffset(c4);
}

SamplerState tex_Color_s_s : register(s0);
Texture2D<float4> tex_Color : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = cmp(v1.xy < mask.xy);
  r0.x = r0.y ? r0.x : 0;
  r0.x = r0.x ? 1 : base_luminance;
  r0.yzw = tex_Color.Sample(tex_Color_s_s, v1.xy).xyz;
  r0.xyz = r0.yzw * r0.xxx;
  
  // r0.xyz = log2(r0.xyz);
  // r0.xyz = user_gamma * r0.xyz;
  // o0.xyz = exp2(r0.xyz);
  o0.rgb = r0.rgb;

  o0.w = 1;

  if (injectedData.toneMapType == 0.f) {
    o0.rgb = saturate(o0.rgb);
    o0.rgb *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
    return;
  }

  o0.rgb = ToneMap(o0.rgb);
  o0.rgb *= injectedData.toneMapGameNits / injectedData.toneMapUINits;

  return;
}