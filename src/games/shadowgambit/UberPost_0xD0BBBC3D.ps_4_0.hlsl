#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 20:29:18 2025
Texture3D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * float2(2,2) + float2(-1,-1);
  r0.z = dot(r0.xy, r0.xy);
  r0.xy = r0.xy * r0.zz;
  r0.xy = cb0[36].ww * r0.xy;
  r0.zw = cb0[31].zw * -r0.xy;
  r0.zw = float2(0.5,0.5) * r0.zw;
  r0.z = dot(r0.zw, r0.zw);
  r0.z = sqrt(r0.z);
  r0.z = (int)r0.z;
  r0.z = max(3, (int)r0.z);
  r0.z = min(16, (int)r0.z);
  r0.w = (int)r0.z;
  r0.xy = -r0.xy / r0.ww;
  r1.y = 0;
  r2.w = 1;
  r3.xyzw = float4(0,0,0,0);
  r4.xyzw = float4(0,0,0,0);
  r1.zw = v1.xy;
  r5.x = 0;
  while (true) {
    r5.y = cmp((int)r5.x >= (int)r0.z);
    if (r5.y != 0) break;
    r5.y = (int)r5.x;
    r5.y = 0.5 + r5.y;
    r1.x = r5.y / r0.w;
    r5.yz = saturate(r1.zw);
    r5.yz = cb0[26].xx * r5.yz;
    r6.xyzw = t0.SampleLevel(s0_s, r5.yz, 0).xyzw;
    r7.xyzw = t2.SampleLevel(s2_s, r1.xy, 0).xyzw;
    r2.xyz = r7.xyz;
    r3.xyzw = r6.xyzw * r2.xyzw + r3.xyzw;
    r4.xyzw = r4.xyzw + r2.xyzw;
    r1.zw = r1.zw + r0.xy;
    r5.x = (int)r5.x + 1;
  }
  r0.xyzw = r3.xyzw / r4.xyzw;
  r1.xyzw = t1.Sample(s1_s, v1.xy).xyzw;
  r1.x = 4 * r1.w;
  r1.x = min(1, r1.x);
  r1.yz = -cb0[39].xy + v1.xy;
  r2.yz = cb0[40].xx * abs(r1.zy);
  r1.y = cb0[22].x / cb0[22].y;
  r1.y = -1 + r1.y;
  r1.y = cb0[40].w * r1.y + 1;
  r2.x = r2.z * r1.y;
  r2.xy = saturate(r2.xy);
  r1.yz = log2(r2.xy);
  r1.yz = cb0[40].zz * r1.yz;
  r1.yz = exp2(r1.yz);
  r1.y = dot(r1.yz, r1.yz);
  r1.y = 1 + -r1.y;
  r1.y = max(0, r1.y);
  r1.y = log2(r1.y);
  r1.y = cb0[40].y * r1.y;
  r1.y = exp2(r1.y);
  r2.xyz = float3(1,1,1) + -cb0[38].xyz;
  r1.yzw = r1.yyy * r2.xyz + cb0[38].xyz;
  r2.xyz = r1.yzw * r0.xyz;
  r3.xyz = cb0[37].zzz * r2.xyz;
  
  // r3.xyz = r3.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  // r3.xyz = log2(r3.xyz);
  // r3.xyz = saturate(r3.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));

  r3.rgb = lutShaper(r3.rgb);

  r3.xyz = cb0[37].yyy * r3.xyz;
  r3.w = 0.5 * cb0[37].x;
  r3.xyz = r3.xyz * cb0[37].xxx + r3.www;
  r3.xyzw = t3.Sample(s3_s, r3.xyz).xyzw;
  r1.x = saturate(-cb0[44].x + r1.x);
  r2.w = r0.w;
  r0.xyz = -r0.xyz * r1.yzw + r3.xyz;
  r0.w = 0;
  r0.xyzw = r1.xxxx * r0.wxyz + r2.wxyz;
  r1.x = cmp(0.5 < cb0[43].x);
  if (r1.x != 0) {
    // r1.xyz = saturate(r0.yzw);
    // r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
    r0.x = dot(r0.yzw, float3(0.212672904, 0.715152204, 0.0721750036));
  }
  o0.xyzw = r0.yzwx;

  o0.rgb = uberPostScaling(o0.rgb);

  return;
}