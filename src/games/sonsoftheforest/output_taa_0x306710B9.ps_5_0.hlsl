// ---- Created with 3Dmigoto v1.3.16 on Mon Feb 24 11:14:37 2025
Texture2DArray<float4> t3 : register(t3);

Texture2DArray<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2DArray<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[80];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[11];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * cb0[8].xy + cb0[8].zw;
  r0.zw = r0.xy * cb0[6].xy + cb0[6].zw;
  r1.xy = cb1[48].xy * r0.xy;
  r0.x = t1.SampleBias(s1_s, r0.zw, cb1[79].y).w;
  r0.x = -0.5 + r0.x;
  r0.x = r0.x + r0.x;
  r0.yz = cb1[46].xy * v1.xy;
  r0.yz = (uint2)r0.yz;
  r0.yz = (uint2)r0.yz;
  r2.xy = float2(-1,-1) + cb1[46].xy;
  r2.xy = cb0[8].zw * r2.xy;
  r0.yz = r0.yz * cb0[8].xy + r2.xy;
  r2.xy = (uint2)r0.yz;
  r2.zw = float2(0,0);
  r0.yzw = t0.Load(r2.xyww).xyz;
  r1.w = t3.Load(r2.xyzw).x;
  //r0.yzw = saturate(r0.yzw);
  r2.xyz = r0.yzw * r0.xxx;
  r2.xyz = cb0[5].xxx * r2.xyz;
  r0.x = dot(r0.yzw, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = sqrt(r0.x);
  r0.x = cb0[5].y * -r0.x + 1;
  r0.xyz = r2.xyz * r0.xxx + r0.yzw;
  r1.z = 0;
  r2.xyzw = t2.SampleLevel(s0_s, r1.xyz, 0).xyzw;
  o0.xyz = r2.www * r0.xyz + r2.xyz;
  r0.x = cmp(cb0[10].x == 1.000000);
  o0.w = r0.x ? r1.w : 1;
  return;
}