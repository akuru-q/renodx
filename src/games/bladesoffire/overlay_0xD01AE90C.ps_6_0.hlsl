#include "./shared.h"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 $Globals_000 : packoffset(c000.x);
  float4 $Globals_016 : packoffset(c001.x);
  float4 $Globals_032 : packoffset(c002.x);
  float4 $Globals_048 : packoffset(c003.x);
};

SamplerState s0 : register(s0);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}
uint firstbithigh_msb(uint value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}

float4 main(
    precise noperspective float4 SV_Position: SV_Position,
    linear float4 COLOR: COLOR,
    linear float2 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float _8;
  float _9;
  float _26;
  float _43;
  float _61;
  float4 _63;
  float _72;
  float _76;
  float _89;
  float _90;
  float _91;
  float _92;
  float _95;
  float _99;
  _8 = abs(TEXCOORD.x + -0.5f);
  _9 = abs(TEXCOORD.y + -0.5f);
  _26 = ((($Globals_032.x) * 0.6000000238418579f) * ($Globals_032.z)) + 1.0f;
  if (TEXCOORD.x < 0.5f) {
    _43 = (exp2(log2(TEXCOORD.x * 2.0f) * _26) * 0.5f);
  } else {
    _43 = (1.0f - (exp2(log2((1.0f - TEXCOORD.x) * 2.0f) * _26) * 0.5f));
  }
  if (TEXCOORD.y < 0.5f) {
    _61 = (exp2(log2(TEXCOORD.y * 2.0f) * _26) * 0.5f);
  } else {
    _61 = (1.0f - (exp2(log2((1.0f - TEXCOORD.y) * 2.0f) * _26) * 0.5f));
  }
  _63 = t0.Sample(s0, float2(saturate(_43), saturate(_61)));

  float scale = 1.f;
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    float3 color = renodx::color::pq::DecodeSafe(_63.rgb, 1);
    scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(color);
    color *= scale;
    _63.rgb = color;
    _63.rgb = renodx::math::SignPow(_63.rgb, 1 / 2.f);
  }

  _72 = dot(float4(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f, 0.0f), float4(saturate(_63.x), saturate(_63.y), saturate(_63.z), saturate(_63.w)));
  _76 = ($Globals_032.w) * ($Globals_032.x);
  _89 = saturate((_76 * (_72 - _63.x)) + _63.x);
  _90 = saturate((_76 * (_72 - _63.y)) + _63.y);
  _91 = saturate((_76 * (_72 - _63.z)) + _63.z);
  _92 = saturate((_76 * (_72 - _63.w)) + _63.w);
  _95 = saturate(($Globals_032.x) * (1.0f - saturate(exp2(log2((1.0f - sqrt((_9 * _9) + (_8 * _8))) * 1.2000000476837158f) * ($Globals_032.y)))));
  _99 = (_95 * _95) * (3.0f - (_95 * 2.0f));
  SV_Target.x = ((_99 * (($Globals_048.x) - _89)) + _89);
  SV_Target.y = ((_99 * (($Globals_048.y) - _90)) + _90);
  SV_Target.z = ((_99 * (($Globals_048.z) - _91)) + _91);
  SV_Target.w = ((_99 * (($Globals_048.w) - _92)) + _92);

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    SV_Target.rgb = renodx::math::SignPow(SV_Target.rgb, 2.f);
    SV_Target.rgb /= scale;
    SV_Target.rgb = renodx::tonemap::ExponentialRollOff(SV_Target.rgb, 0, RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS);
    SV_Target.rgb = renodx::color::pq::EncodeSafe(SV_Target.rgb, 1);
  }

  return SV_Target;
}
