#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 27 13:38:18 2024

cbuffer CbColorCorrection : register(b0)
{
  float4x4 color_matrix : packoffset(c0);
}

cbuffer CbColorGrading : register(b1)
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
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = tex_Color.Sample(tex_Color_s_s, v1.xy).xyzw;
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
  r0.xyz = -r0.xyz * float3(18.6875,18.6875,18.6875) + float3(18.8515625,18.8515625,18.8515625);
  r1.xyz = max(float3(0,0,0), r1.xyz);
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