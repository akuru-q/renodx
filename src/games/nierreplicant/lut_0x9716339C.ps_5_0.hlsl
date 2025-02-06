#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 27 13:38:22 2024

cbuffer CbColorCorrection : register(b0)
{
  float4x4 color_matrix : packoffset(c0);
}

cbuffer CbRadialBlur : register(b1)
{
  float4 center_uv_pos_power : packoffset(c0);
  float4 uv_offset_and_scale : packoffset(c1);
  float aspect_ratio : packoffset(c2);
  float enable_radial : packoffset(c2.y);
  float distance_degree_ : packoffset(c2.z);
  float blur_fade_alpha : packoffset(c2.w);
}

cbuffer CbColorGrading : register(b2)
{
  float3 lut_size : packoffset(c0);
  float max_range : packoffset(c0.w);
}

SamplerState tex_Color_s_s : register(s0);
SamplerState texGradingLUT_s_s : register(s2);
Texture2D<float4> tex_Color : register(t0);
Texture3D<float4> texGradingLUT : register(t2);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = tex_Color.Sample(tex_Color_s_s, v1.xy).xyzw;
  r1.xy = v1.xy * uv_offset_and_scale.zw + uv_offset_and_scale.xy;
  r1.zw = center_uv_pos_power.xy * uv_offset_and_scale.zw + uv_offset_and_scale.xy;
  r1.zw = -r1.xy * enable_radial + r1.zw;
  r1.zw = r1.zw / uv_offset_and_scale.zw;
  r2.x = dot(r1.zw, r1.zw);
  r2.y = sqrt(r2.x);
  r2.x = rsqrt(r2.x);
  r1.zw = r2.xx * r1.zw;
  r2.x = log2(r2.y);
  r2.x = distance_degree_ * r2.x;
  r2.x = exp2(r2.x);
  r2.x = center_uv_pos_power.w * r2.x;
  r2.x = 0.125 * r2.x;
  r1.zw = r2.xx * r1.zw;
  r2.xyzw = float4(0,0,0,0);
  
  //r3.xy = float2(0.00999999978, 9.80908925e-45); // decomp issue
  r3.xy = float2(0.00999999978, 7);

  while (true) {
    r3.z = cmp((int)r3.y < 1);
    if (r3.z != 0) break;
    r3.z = (int)r3.y;
    r3.zw = r1.zw * r3.zz + r1.xy;
    r4.xyzw = tex_Color.SampleLevel(tex_Color_s_s, r3.zw, 0).xyzw;
    r2.xyzw = r3.xxxx * r4.xyzw + r2.xyzw;
    r3.x = 0.0299999993 + r3.x;
    r3.y = (int)r3.y + -1;
  }
  r1.xyzw = r0.xyzw * float4(0.219999999,0.219999999,0.219999999,0.219999999) + r2.xyzw;
  r1.xyzw = r1.xyzw * float4(1.08695662,1.08695662,1.08695662,1.08695662) + -r0.xyzw;
  
  r0.xyzw = blur_fade_alpha * r1.xyzw + r0.xyzw;
  
  r1.x = dot(r0.xyzw, color_matrix._m00_m10_m20_m30);
  r1.y = dot(r0.xyzw, color_matrix._m01_m11_m21_m31);
  r1.z = dot(r0.xyzw, color_matrix._m02_m12_m22_m32);

  float3 untonemapped = r1.rgb;

  r0.xyz = max(float3(0,0,0), r1.xyz);
  r0.xyz = r0.xyz / max_range;
  r0.xyz = log2(abs(r0.xyz));
  r0.xyz = float3(0.159301758,0.159301758,0.159301758) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyz = r0.xyz * float3(18.8515625,18.8515625,18.8515625) + float3(0.8359375,0.8359375,0.8359375);
  r0.xyz = r0.xyz * float3(18.6875,18.6875,18.6875) + float3(1,1,1);
  r0.xyz = r1.xyz / r0.xyz;
  r0.xyz = log2(r0.xyz);
  r0.xyz = float3(78.84375,78.84375,78.84375) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyz = float3(-1,-1,-1) + lut_size.xyz;
  r1.xyz = r1.xyz / lut_size.xyz;
  r2.xyz = lut_size.xyz + lut_size.xyz;
  r2.xyz = float3(1,1,1) / r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = texGradingLUT.SampleLevel(texGradingLUT_s_s, r0.xyz, 0).xyz;
  r0.xyz = log2(abs(r0.xyz));
  r0.xyz = float3(0.0126833133,0.0126833133,0.0126833133) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyz = float3(-0.8359375,-0.8359375,-0.8359375) + r0.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.xyz = -r0.xyz * float3(18.6875,18.6875,18.6875) + float3(18.8515625,18.8515625,18.8515625);
  r0.xyz = r1.xyz / r0.xyz;
  r0.xyz = log2(r0.xyz);
  r0.xyz = float3(6.27739477,6.27739477,6.27739477) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  o0.xyz = max_range * r0.xyz;
  o0.w = 1;

  if (injectedData.toneMapType == 0.f) {
    return;
  }

  float3 postProcess = o0.rgb;

  float3 neutral_sdr_color = RenoDRTSmoothClamp(untonemapped.rgb);

  float3 graded = UpgradeToneMapPerChannel(
      untonemapped,
      neutral_sdr_color,
      postProcess,
      1);

  o0.rgb = graded.rgb;

  return;
}