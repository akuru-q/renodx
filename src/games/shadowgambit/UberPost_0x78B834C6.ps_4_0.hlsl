#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 20:29:18 2025
Texture3D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[45];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = saturate(v1.xy);
  r0.xy = cb0[26].xx * r0.xy;
  r0.xyzw = t3.Sample(s3_s, r0.xy).xyzw;
  r1.xyzw = float4(1,1,-1,0) * cb0[33].xyxy;
  r2.xyzw = saturate(-r1.xywy * cb0[35].xxxx + v1.xyxy);
  r2.xyzw = cb0[26].xxxx * r2.xyzw;
  r3.xyzw = t3.Sample(s3_s, r2.xy).xyzw;
  r2.xyzw = t3.Sample(s3_s, r2.zw).xyzw;
  r2.xyz = r2.xyz * float3(2,2,2) + r3.xyz;
  r3.xy = saturate(-r1.zy * cb0[35].xx + v1.xy);
  r3.xy = cb0[26].xx * r3.xy;
  r3.xyzw = t3.Sample(s3_s, r3.xy).xyzw;
  r2.xyz = r3.xyz + r2.xyz;
  r3.xyzw = saturate(r1.zwxw * cb0[35].xxxx + v1.xyxy);
  r3.xyzw = cb0[26].xxxx * r3.xyzw;
  r4.xyzw = t3.Sample(s3_s, r3.xy).xyzw;
  r3.xyzw = t3.Sample(s3_s, r3.zw).xyzw;
  r2.xyz = r4.xyz * float3(2,2,2) + r2.xyz;
  r0.xyz = r0.xyz * float3(4,4,4) + r2.xyz;
  r0.xyz = r3.xyz * float3(2,2,2) + r0.xyz;
  r2.xyzw = saturate(r1.zywy * cb0[35].xxxx + v1.xyxy);
  r1.xy = saturate(r1.xy * cb0[35].xx + v1.xy);
  r1.xy = cb0[26].xx * r1.xy;
  r1.xyzw = t3.Sample(s3_s, r1.xy).xyzw;
  r2.xyzw = cb0[26].xxxx * r2.xyzw;
  r3.xyzw = t3.Sample(s3_s, r2.xy).xyzw;
  r2.xyzw = t3.Sample(s3_s, r2.zw).xyzw;
  r0.xyz = r3.xyz + r0.xyz;
  r0.xyz = r2.xyz * float3(2,2,2) + r0.xyz;
  r0.xyz = r0.xyz + r1.xyz;
  r0.xyz = float3(0.0625,0.0625,0.0625) * r0.xyz;
  r0.w = 0.200000003 + -cb0[35].y;
  r0.w = cb0[44].x * r0.w + cb0[35].y;
  r1.xyz = r0.xyz * r0.www;
  r0.x = r1.x + r1.y;
  r0.x = r0.z * r0.w + r0.x;
  r0.x = cb0[44].y * r0.x;
  r0.x = saturate(-r0.x * 5 + 1);
  r2.xyzw = t1.Sample(s1_s, w1.xy).xyzw;
  r0.w = min(r2.w, r0.x);
  r3.xyz = float3(3.04999995,1.36000001,0.550000012) + -cb0[36].xyz;
  r3.xyz = cb0[44].xxx * r3.xyz + cb0[36].xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r1.w = cb0[22].x / cb0[22].y;
  r1.w = -1 + r1.w;
  r1.w = cb0[40].w * r1.w + 1;
  r2.xy = -cb0[39].xy + v1.xy;
  r2.yz = cb0[40].xx * abs(r2.yx);
  r2.x = r2.z * r1.w;
  r2.xy = saturate(r2.xy);
  r2.xy = log2(r2.xy);
  r2.xy = cb0[40].zz * r2.xy;
  r2.xy = exp2(r2.xy);
  r1.w = dot(r2.xy, r2.xy);
  r1.w = 1 + -r1.w;
  r1.w = max(0, r1.w);
  r1.w = log2(r1.w);
  r1.w = cb0[40].y * r1.w;
  r1.w = exp2(r1.w);
  r2.xyz = float3(1,1,1) + -cb0[38].xyz;
  r2.xyz = r1.www * r2.xyz + cb0[38].xyz;
  r0.xyz = r2.xyz * r1.xyz;
  r3.xyz = cb0[37].zzz * r0.xyz;
  
  // r3.xyz = r3.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  // r3.xyz = log2(r3.xyz);
  // r3.xyz = saturate(r3.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));

  r3.rgb = lutShaper(r3.rgb);

  r3.xyz = cb0[37].yyy * r3.xyz;
  r1.w = 0.5 * cb0[37].x;
  r3.xyz = r3.xyz * cb0[37].xxx + r1.www;
  r3.xyzw = t4.Sample(s4_s, r3.xyz).xyzw;
  r1.xyz = -r1.xyz * r2.xyz + r3.xyz;
  r2.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
  r2.x = 4 * r2.w;
  r2.x = min(1, r2.x);
  r2.x = saturate(-cb0[44].x + r2.x);
  r1.w = 0;
  r0.xyzw = r2.xxxx * r1.xyzw + r0.xyzw;

  // r1.xyz = max(float3(1.1920929e-07,1.1920929e-07,1.1920929e-07), abs(r0.xyz));
  // r1.xyz = log2(r1.xyz);
  // r1.xyz = float3(0.416666657,0.416666657,0.416666657) * r1.xyz;
  // r1.xyz = exp2(r1.xyz);
  // r1.xyz = r1.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  // r2.xyz = float3(12.9200001,12.9200001,12.9200001) * r0.xyz;
  // r0.xyz = cmp(float3(0.00313080009,0.00313080009,0.00313080009) >= r0.xyz);
  // o0.w = r0.w;
  // r0.xyz = r0.xyz ? r2.xyz : r1.xyz;

  o0.w = r0.w;
  r0.rgb = renodx::color::srgb::EncodeSafe(r0.rgb);

  r1.xy = v1.xy * cb0[30].xy + cb0[30].zw;
  r1.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r0.w = r1.w * 2 + -1;
  r1.x = 1 + -abs(r0.w);
  r0.w = saturate(r0.w * 3.40282347e+38 + 0.5);
  r0.w = r0.w * 2 + -1;
  r1.x = sqrt(r1.x);
  r1.x = 1 + -r1.x;
  r0.w = r1.x * r0.w;
  r0.xyz = r0.www * float3(0.00392156886,0.00392156886,0.00392156886) + r0.xyz;

  // r1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + r0.xyz;
  // r1.xyz = float3(0.947867334,0.947867334,0.947867334) * r1.xyz;
  // r1.xyz = max(float3(1.1920929e-07,1.1920929e-07,1.1920929e-07), abs(r1.xyz));
  // r1.xyz = log2(r1.xyz);
  // r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  // r1.xyz = exp2(r1.xyz);
  // r2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * r0.xyz;
  // r0.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= r0.xyz);
  // o0.xyz = r0.xyz ? r2.xyz : r1.xyz;

  o0.rgb = renodx::color::srgb::DecodeSafe(r0.rgb);

  o0.rgb = uberPostScaling(o0.rgb);

  return;
}