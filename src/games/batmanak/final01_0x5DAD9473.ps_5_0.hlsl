// Some UI effects

#include "./shared.h"

cbuffer cb0 : register(b0) {
  float4 cb0[6];
}

void main(float4 v0 : COLOR0, float4 v1 : COLOR1, out float4 o0 : SV_TARGET0) {
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = saturate(v0.xyz);
  r0.xyz = log2(r0.xyz);
  r0.xyz = cb0[5].www * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  o0.w = v1.w * v0.w;

  o0.rgb = saturate(o0.rgb);
  return;
}
