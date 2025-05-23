#include "./common.hlsl"
// used on the title screen/open-world
// ---- Created with 3Dmigoto v1.4.1 on Tue Feb 25 20:32:34 2025
Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0) {
  float4 cb0[404];
}

// 3Dmigoto declarations
#define cmp -

void main(
    float4 v0: SV_POSITION0,
    float2 v1: TEXCOORD0,
    out float4 o0: SV_Target0) {
  float4 r0, r1, r2, r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  r0.xyz = max(float3(0, 0, 0), r0.xyz);
  r1.xyzw = t1.SampleLevel(s0_s, v1.xy, 0).xyzw;
  r0.xyz = r1.xyz * cb0[114].xxx + r0.xyz;
  r1.xyzw = t2.SampleLevel(s1_s, v1.xy, 0).xyzw;
  r0.xyz = r1.xyz + r0.xyz;
  r0.w = cmp(0 < cb0[107].x);
  if (r0.w != 0) {
    r1.xyzw = t4.SampleLevel(s0_s, v1.xy, 0).xyzw;
    r1.xyz = cb0[107].xxx * r1.xyz;
    r0.xyz = max(r1.xyz, r0.xyz);
  }
  r0.w = cmp(0 != cb0[29].y);
  if (r0.w != 0) {
    r1.xy = -cb0[403].xy + v1.xy;
    r1.yz = cb0[403].zz * abs(r1.xy);
    r1.x = cb0[402].w * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = cb0[403].w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1, 1, 1) + -cb0[402].xyz;
    r1.xyz = r0.www * r1.xyz + cb0[402].xyz;
    r0.w = dot(v0.xy, float2(0.0671105608, 0.00583714992));
    r0.w = frac(r0.w);
    r0.w = 52.9829178 * r0.w;
    r0.w = frac(r0.w);
    r0.w = 5 * r0.w;
    r0.w = floor(r0.w);
    r0.w = -2 + r0.w;
    r2.x = r0.w * 0.00392156886 + r1.x;
    r3.xyzw = float4(2.08299994, 4.8670001, 4.16599989, 9.73400021) + v0.xyxy;
    r0.w = dot(r3.xy, float2(0.0671105608, 0.00583714992));
    r0.w = frac(r0.w);
    r0.w = 52.9829178 * r0.w;
    r0.w = frac(r0.w);
    r0.w = 5 * r0.w;
    r0.w = floor(r0.w);
    r0.w = -2 + r0.w;
    r2.y = r0.w * 0.00392156886 + r1.y;
    r0.w = dot(r3.zw, float2(0.0671105608, 0.00583714992));
    r0.w = frac(r0.w);
    r0.w = 52.9829178 * r0.w;
    r0.w = frac(r0.w);
    r0.w = 5 * r0.w;
    r0.w = floor(r0.w);
    r0.w = -2 + r0.w;
    r2.z = r0.w * 0.00392156886 + r1.z;
    r0.xyz = r2.xyz * r0.xyz;
  }
  r0.xyz = r0.zxy * float3(5.55555582, 5.55555582, 5.55555582) + float3(0.0479959995, 0.0479959995, 0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = saturate(r0.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(0.386036009, 0.386036009, 0.386036009));
  r0.yzw = cb0[39].zzz * r0.xyz;
  r0.y = floor(r0.y);
  r1.xy = float2(0.5, 0.5) * cb0[39].xy;
  r1.yz = r0.zw * cb0[39].xy + r1.xy;
  r1.x = r0.y * cb0[39].y + r1.y;
  r2.xyzw = t3.SampleLevel(s0_s, r1.xz, 0).xyzw;
  r3.x = cb0[39].y;
  r3.y = 0;
  r0.zw = r3.xy + r1.xz;
  r1.xyzw = t3.SampleLevel(s0_s, r0.zw, 0).xyzw;
  r0.x = r0.x * cb0[39].z + -r0.y;
  r0.yzw = r1.xyz + -r2.xyz;
  r0.xyz = r0.xxx * r0.yzw + r2.xyz;
  r1.xyz = saturate(r0.xyz);
  o0.w = dot(r1.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
  r1.xyz = cmp(float3(0, 0, 0) < r0.xyz);
  r2.xyz = cmp(r0.xyz < float3(0, 0, 0));
  r1.xyz = (int3)-r1.xyz + (int3)r2.xyz;
  r1.xyz = (int3)r1.xyz;
  r2.xyz = float3(12.9200001, 12.9200001, 12.9200001) * abs(r0.xyz);
  r3.xyz = log2(abs(r0.xyz));
  r3.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r3.xyz = r3.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997);
  r0.xyz = cmp(float3(0.00313080009, 0.00313080009, 0.00313080009) >= abs(r0.xyz));
  r0.xyz = r0.xyz ? r2.xyz : r3.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  o0.xyz = PostToneMapScale(o0.xyz);
  return;
}
