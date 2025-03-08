#define SHADER_HASH_0XD092CC63

#include "./hdrcomposite.hlsl"

float4 main(
    noperspective float2 TEXCOORD: TEXCOORD,
    noperspective float4 TEXCOORD_1: TEXCOORD1,
    noperspective float4 SV_Position: SV_Position)
    : SV_Target {
  return HDRComposite(TEXCOORD, TEXCOORD_1, SV_Position);
}