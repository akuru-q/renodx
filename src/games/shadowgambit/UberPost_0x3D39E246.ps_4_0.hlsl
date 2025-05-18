#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sun May 18 20:44:10 2025
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, w1.xy).xyzw;
  r1.xyzw = t1.Sample(s1_s, v1.xy).xyzw;
  r1.x = 4 * r1.w;
  r1.x = min(1, r1.x);
  r2.xyzw = float4(1,1,-1,0) * cb0[33].xyxy;
  r3.xyzw = saturate(-r2.xywy * cb0[35].xxxx + v1.xyxy);
  r3.xyzw = cb0[26].xxxx * r3.xyzw;
  r4.xyzw = t2.Sample(s2_s, r3.xy).xyzw;
  r3.xyzw = t2.Sample(s2_s, r3.zw).xyzw;
  r1.yzw = r3.xyz * float3(2,2,2) + r4.xyz;
  r3.xy = saturate(-r2.zy * cb0[35].xx + v1.xy);
  r3.xy = cb0[26].xx * r3.xy;
  r3.xyzw = t2.Sample(s2_s, r3.xy).xyzw;
  r1.yzw = r3.xyz + r1.yzw;
  r3.xyzw = saturate(r2.zwxw * cb0[35].xxxx + v1.xyxy);
  r3.xyzw = cb0[26].xxxx * r3.xyzw;
  r4.xyzw = t2.Sample(s2_s, r3.xy).xyzw;
  r1.yzw = r4.xyz * float3(2,2,2) + r1.yzw;
  r3.xy = saturate(v1.xy);
  r3.xy = cb0[26].xx * r3.xy;
  r4.xyzw = t2.Sample(s2_s, r3.xy).xyzw;
  r1.yzw = r4.xyz * float3(4,4,4) + r1.yzw;
  r3.xyzw = t2.Sample(s2_s, r3.zw).xyzw;
  r1.yzw = r3.xyz * float3(2,2,2) + r1.yzw;
  r3.xyzw = saturate(r2.zywy * cb0[35].xxxx + v1.xyxy);
  r3.xyzw = cb0[26].xxxx * r3.xyzw;
  r4.xyzw = t2.Sample(s2_s, r3.xy).xyzw;
  r1.yzw = r4.xyz + r1.yzw;
  r3.xyzw = t2.Sample(s2_s, r3.zw).xyzw;
  r1.yzw = r3.xyz * float3(2,2,2) + r1.yzw;
  r2.xy = saturate(r2.xy * cb0[35].xx + v1.xy);
  r2.xy = cb0[26].xx * r2.xy;
  r2.xyzw = t2.Sample(s2_s, r2.xy).xyzw;
  r1.yzw = r2.xyz + r1.yzw;
  r1.yzw = float3(0.0625,0.0625,0.0625) * r1.yzw;
  r2.x = 0.200000003 + -cb0[35].y;
  r2.x = cb0[44].x * r2.x + cb0[35].y;
  r2.yzw = r2.xxx * r1.yzw;
  r3.xyz = float3(3.04999995,1.36000001,0.550000012) + -cb0[36].xyz;
  r3.xyz = cb0[44].xxx * r3.xyz + cb0[36].xyz;
  r0.xyz = r2.yzw * r3.xyz + r0.xyz;
  r1.y = r2.y + r2.z;
  r1.y = r1.w * r2.x + r1.y;
  r1.y = cb0[44].y * r1.y;
  r1.y = saturate(-r1.y * 5 + 1);
  r2.w = min(r1.y, r0.w);
  r1.yz = -cb0[39].xy + v1.xy;
  r3.yz = cb0[40].xx * abs(r1.zy);
  r0.w = cb0[22].x / cb0[22].y;
  r0.w = -1 + r0.w;
  r0.w = cb0[40].w * r0.w + 1;
  r3.x = r3.z * r0.w;
  r3.xy = saturate(r3.xy);
  r1.yz = log2(r3.xy);
  r1.yz = cb0[40].zz * r1.yz;
  r1.yz = exp2(r1.yz);
  r0.w = dot(r1.yz, r1.yz);
  r0.w = 1 + -r0.w;
  r0.w = max(0, r0.w);
  r0.w = log2(r0.w);
  r0.w = cb0[40].y * r0.w;
  r0.w = exp2(r0.w);
  r1.yzw = float3(1,1,1) + -cb0[38].xyz;
  r1.yzw = r0.www * r1.yzw + cb0[38].xyz;
  r2.xyz = r1.yzw * r0.xyz;
  r3.xyz = cb0[37].zzz * r2.xyz;

  //r3.xyz = r3.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  //r3.xyz = log2(r3.xyz);
  //r3.xyz = saturate(r3.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));

  r3.rgb = lutShaper(r3.rgb);

  r3.xyz = cb0[37].yyy * r3.xyz;
  r0.w = 0.5 * cb0[37].x;
  r3.xyz = r3.xyz * cb0[37].xxx + r0.www;
  r3.xyzw = t3.Sample(s3_s, r3.xyz).xyzw;
  r0.w = saturate(-cb0[44].x + r1.x);
  r1.xyz = -r0.xyz * r1.yzw + r3.xyz;
  r1.w = 0;
  r0.xyzw = r0.wwww * r1.wxyz + r2.wxyz;
  r1.x = cmp(0.5 < cb0[43].x);
  if (r1.x != 0) {
    //r1.xyz = saturate(r0.yzw);
    //r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
    r0.x = dot(r0.yzw, float3(0.212672904, 0.715152204, 0.0721750036));
  }
  o0.xyzw = r0.yzwx;

  o0.rgb = uberPostScaling(o0.rgb);

  return;
}