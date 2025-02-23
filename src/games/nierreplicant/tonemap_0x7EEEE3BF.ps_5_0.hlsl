#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 27 13:38:21 2024

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

cbuffer CbTonemapPostProcess : register(b1)
{
  float2 cb_postgrad_dir : packoffset(c0) = {0,1};
  float cb_postgrad_offset : packoffset(c0.z) = {0};
  float cb_postgrad_bandrange_inv : packoffset(c0.w) = {1};
  float3 cb_postgrad_color : packoffset(c1) = {0,0,0};
  float cb_postgrad_rate_exp : packoffset(c1.w) = {1};
  int cb_postgrad_para_flare_switch : packoffset(c2) = {0};
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
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(-0.5,-0.5) + v1.xy;
  r0.x = dot(r0.xy, cb_postgrad_dir.xy);
  r0.x = -cb_postgrad_offset + r0.x;
  r0.x = saturate(dot(r0.xx, cb_postgrad_bandrange_inv));
  r0.y = log2(r0.x);
  r0.x = cmp(0 < r0.x);
  r0.z = max(0, cb_postgrad_rate_exp);
  r0.y = r0.z * r0.y;
  r0.y = exp2(r0.y);
  r0.x = r0.x ? r0.y : 0;
  r0.yz = cmp(v1.xy < mask.xy);
  r0.y = r0.z ? r0.y : 0;
  r0.y = r0.y ? 1 : base_luminance;
  r1.xyz = tex_Color.Sample(tex_Color_s_s, v1.xy).xyz;
  r0.yzw = r1.xyz * r0.yyy;

  // r0.yzw = log2(r0.yzw);
  // r0.yzw = user_gamma * r0.yzw;
  // r0.yzw = exp2(r0.yzw);

  r1.xyz = float3(1,1,1) + -r0.yzw;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = r1.xyz * cb_postgrad_color.xyz + r0.yzw;
  r2.xyz = cb_postgrad_color.xyz * r0.yzw;
  r1.xyz = cb_postgrad_para_flare_switch ? r1.xyz : r2.xyz;
  r1.xyz = r1.xyz + -r0.yzw;
  o0.xyz = r0.xxx * r1.xyz + r0.yzw;
  o0.w = 1;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = renodx::draw::ToneMapPass(o0.rgb);
  } else {
    o0.rgb = saturate(o0.rgb);
  }
  
  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);

  return;
}