#include "./common.hlsl"

cbuffer CBufferGlobalConstant_Z : register(b0){
  struct
  {
    float4 c[90];
  } Global : packoffset(c0);
}
cbuffer CBufferPostProcessConstant_Z : register(b1){
  struct
  {
    float4 Settings[16];
    float4 OffsetWeight[32];
  } PostProcess : packoffset(c0);
}
SamplerState s0Sampler_s : register(s0);
SamplerState s2Sampler_s : register(s2);
SamplerState s3_3DSampler_s : register(s3);
SamplerState s5Sampler_s : register(s5);
SamplerState s6Sampler_s : register(s6);
SamplerState s8Sampler_s : register(s8);
SamplerState s9Sampler_s : register(s9);
Texture2D<float4> s0 : register(t0);
Texture2D<float4> s1 : register(t1);
Texture2D<float4> s2 : register(t2);
Texture3D<float4> s3_3D : register(t3);
Texture2D<float4> s5 : register(t5);
Texture2D<float4> s6 : register(t6);
Texture2D<float4> s8 : register(t8);
Texture2D<float4> s9 : register(t9);
Texture2DArray<float4> sBlueNoiseR8 : register(t11);
Texture2DArray<float4> sBlueNoiseR8G8 : register(t12);

#define cmp -

void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyzw * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.xyzw = Global.c[15].xyxy * r0.xyzw;
  r1.x = dot(r1.xy, r1.xy);
  r1.x = r1.x * Global.c[15].z + 1;
  r1.x = Global.c[15].w * r1.x;
  r0.xy = r1.xx * r0.xy;
  r0.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.x = dot(r1.zw, r1.zw);
  r1.x = r1.x * Global.c[15].z + 1;
  r1.x = Global.c[15].w * r1.x;
  r0.zw = r1.xx * r0.zw;
  r0.zw = r0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyzw = s0.SampleLevel(s0Sampler_s, r0.zw, 0).xyzw;
  r2.z = s6.SampleLevel(s6Sampler_s, r0.xy, 0).x;
  r2.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.w = 1;
  r3.x = dot(r2.xyzw, Global.c[53].xyzw);
  r3.y = dot(r2.xyzw, Global.c[54].xyzw);
  r3.z = dot(r2.xyzw, Global.c[55].xyzw);
  r2.x = dot(r2.xyzw, Global.c[56].xyzw);
  r2.xyz = r3.xyz / r2.xxx;
  r2.x = dot(r2.xyz, r2.xyz);
  r2.x = sqrt(r2.x);
  r2.yzw = s2.Sample(s2Sampler_s, r0.zw).xyz;
  r3.xyz = s8.Sample(s8Sampler_s, r0.xy).xyz;
  r3.xyz = r3.xyz * PostProcess.Settings[4].www * injectedData.fxLens + PostProcess.Settings[4].zzz * injectedData.fxBloom;
  r2.yzw = r2.yzw + -r1.xyz;
  r1.xyz = r3.xyz * r2.yzw + r1.xyz;
  r3.xyzw = s5.Sample(s5Sampler_s, r0.xy).xyzw;
  r0.z = -PostProcess.Settings[6].w * PostProcess.Settings[5].x + PostProcess.Settings[5].x;
  r0.w = PostProcess.Settings[6].w * PostProcess.Settings[5].x + PostProcess.Settings[5].x;
  r0.z = max(r2.x, r0.z);
  r0.z = min(r0.z, r0.w);
  r0.w = r2.x + -r0.z;
  r0.w = PostProcess.Settings[5].w * r0.w;
  r0.z = -PostProcess.Settings[5].y + r0.z;
  r0.z = r2.x * r0.z;
  r0.z = r0.w / r0.z;
  r0.w = min(0, r0.z);
  r0.w = PostProcess.Settings[7].z * r0.w;
  r2.x = PostProcess.Settings[6].w * PostProcess.Settings[5].x + 1;
  r2.x = rcp(r2.x);
  r0.z = max(0, r0.z);
  r0.z = r0.w * r2.x + r0.z;
  r0.w = min(r3.w, r0.z);
  r0.z = max(abs(r0.w), abs(r0.z));
  r0.z = min(1, r0.z);
  r0.w = PostProcess.Settings[6].x * r0.z;
  r0.xy = r0.ww * PostProcess.Settings[7].xy + r0.xy;
  r0.xy = s5.Sample(s5Sampler_s, r0.xy).zw;
  r0.x = r0.x + -r3.z;
  r3.z = abs(r0.y) * r0.x + r3.z;
  r0.x = r0.z * PostProcess.Settings[6].x + -1;
  r0.y = -1 + PostProcess.Settings[7].w;
  r0.x = saturate(r0.x / r0.y);
  r0.yzw = r3.xyz + -r1.xyz;
  if (Global.c[0].x == 0.f) {
    r0.xyz = r0.xxx * r0.yzw + r1.xyz;
  } else {
    r0.xyz = r0.xxx * r0.yzw * injectedData.fxDoF + r1.xyz;
  }
  r0.w = s1.Load(int3(0,0,0)).x;
  r0.xyz = r0.xyz * lerp(1.f, r0.www, injectedData.fxAutoExposure);
  float3 preLUT = r0.rgb;
  r0.rgb = renodx::color::pq::Encode(r0.rgb, PostProcess.Settings[10].w);
  r0.xyz = r0.xyz * PostProcess.OffsetWeight[0].xxx + PostProcess.OffsetWeight[0].yyy;
  r0.xyz = s3_3D.Sample(s3_3DSampler_s, r0.xyz).xyz;
  r0.rgb = renodx::color::pq::Decode(r0.rgb, PostProcess.Settings[10].w);
  if (injectedData.colorGradeLUTStrength > 0.f && injectedData.colorGradeLUTScaling > 0.f) {
    float3 scalingInput = float3(0,0,0) + PostProcess.OffsetWeight[0].yyy;
    float3 minBlack = s3_3D.Sample(s3_3DSampler_s, scalingInput).xyz;
    minBlack = renodx::color::pq::Decode(minBlack, PostProcess.Settings[10].w);
    float lutMinY = renodx::color::y::from::BT709(abs(minBlack));
    if (lutMinY > 0) {
      float3 correctedBlack = renodx::lut::CorrectBlack(preLUT, r0.rgb, lutMinY, 0.f);
      r0.rgb = lerp(r0.rgb, correctedBlack, injectedData.colorGradeLUTScaling);
    }
  }
  r0.rgb = lerp(preLUT, r0.rgb, injectedData.colorGradeLUTStrength);
  if (injectedData.fxFilmGrainType == 0.f) {
  r0.a = renodx::color::y::from::BT709(r0.rgb);
  r1.x = cmp(0 < PostProcess.Settings[10].y);
  if (r1.x != 0) {
    r1.xy = (uint2)v0.xy;
    r1.z = cmp(0 < PostProcess.Settings[10].x);
    r1.z = r1.z ? 1.000000 : 0;
    r2.x = (uint)Global.c[1].w;
    r2.z = (int)r1.z * (int)r2.x;
    r2.xy = (int2)r1.xy & int2(63,63);
    r2.w = 0;
    r1.xy = sBlueNoiseR8G8.Load(r2.xyzw).xy;
    r1.y = r1.x * r1.y;
    r2.xyz = float3(-2,2,2) * r1.yyy;
    r1.xyz = r1.xxx * float3(1,-1,-1) + r2.xyz;
  } else {
    r2.xy = v1.xy * PostProcess.Settings[9].xy + PostProcess.Settings[9].zw;
    r2.xyz = s9.Sample(s9Sampler_s, r2.xy).xyz;
    r3.xy = (uint2)v0.xy;
    r3.xy = (int2)r3.xy & int2(63,63);
    r3.zw = float2(0,0);
    r2.w = sBlueNoiseR8.Load(r3.xyzw).x;
    r3.xyz = r2.www + -r2.xyz;
    r2.xyz = r3.xyz * float3(0.5,0.5,0.5) + r2.xyz;
    r1.xyz = r2.xyz * float3(2,2,2) + float3(-1,-1,-1);
  }
  r2.x = 1 + r0.w;
  r0.w = r0.w / r2.x;
  r2.x = -9.99999975e-05 + r0.w;
  r2.x = saturate(1111.11108 * r2.x);
  r2.y = r2.x * -2 + 3;
  r2.x = r2.x * r2.x;
  r2.x = r2.y * r2.x;
  r2.y = PostProcess.Settings[2].y + -PostProcess.Settings[2].x;
  r0.w = r0.w * r2.y + PostProcess.Settings[2].x;
  r1.xyz = r1.xyz * r0.www;
  r0.xyz = r1.xyz * r2.xxx * injectedData.fxFilmGrain + r0.xyz;
  } else {
    r0.rgb = applyFilmGrain(r0.rgb, v1.xy);
  }
  r0.rgb = applyUserTonemap(r0.rgb);
  r0.rgb = renodx::color::srgb::EncodeSafe(r0.rgb);
  r1.xy = (uint2)v0.xy;
  r2.z = (uint)Global.c[1].w;
  r2.xy = (int2)r1.xy & int2(63,63);
  r2.w = 0;
  r1.x = sBlueNoiseR8.Load(r2.xyzw).x;
  r0.w = 0;
  r1.xyz = r1.xxx * float3(-0.00392156886,0.00392156886,0.00392156886) + r0.xww;
  r0.x = 0.00392156886;
  o0.xyz = r0.xyz + r1.xyz;
  o0.w = r1.w;
  o0.rgb = PostToneMapScale(o0.rgb);
  return;
}