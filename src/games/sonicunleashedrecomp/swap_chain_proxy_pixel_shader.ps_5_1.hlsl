#include "./shared.h"

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  float4 SV_Target = t0.Sample(s0, uv);

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    SV_Target.rgb = renodx::draw::ToneMapPass(SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }

  SV_Target = renodx::draw::SwapChainPass(SV_Target);

  return SV_Target;
}
