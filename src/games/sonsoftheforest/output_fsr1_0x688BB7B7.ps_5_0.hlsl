// ---- Created with 3Dmigoto v1.3.16 on Mon Feb 24 13:48:34 2025
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.zw = float2(0,0);
  r1.xy = v1.xy * cb0[8].xy + cb0[8].zw;
  r1.zw = cb0[9].xy * r1.xy;
  r2.xy = (uint2)r1.zw;
  r3.xyzw = (int4)r2.xyxy + int4(0,-1,-1,0);
  r0.xy = r3.zw;
  r0.xyz = t0.Load(r0.xyzw).xyz;
  r4.zw = float2(0,0);
  r5.xyzw = (int4)r2.xyxy + int4(0,1,1,0);
  r4.xy = r5.zw;
  r4.xyz = t0.Load(r4.xyzw).xyz;
  r6.xyz = max(r4.xyz, r0.xyz);
  r3.zw = float2(0,0);
  r3.xyz = t0.Load(r3.xyzw).xyz;
  r6.xyz = max(r3.xyz, r6.xyz);
  r5.zw = float2(0,0);
  r5.xyz = t0.Load(r5.xyzw).xyz;
  r6.xyz = max(r6.xyz, r5.xyz);
  r2.zw = float2(0,0);
  r2.xyz = t0.Load(r2.xyzw).xyz;
  r7.xyz = max(r6.xyz, r2.xyz);
  r6.xyz = float3(4,4,4) * r6.xyz;
  r6.xyz = rcp(r6.xyz);
  r7.xyz = float3(1,1,1) + -r7.xyz;
  r8.xyz = min(r4.xyz, r0.xyz);
  r8.xyz = min(r8.xyz, r3.xyz);
  r8.xyz = min(r8.xyz, r5.xyz);
  r9.xyz = r8.xyz * float3(4,4,4) + float3(-4,-4,-4);
  r8.xyz = min(r8.xyz, r2.xyz);
  r6.xyz = r8.xyz * r6.xyz;
  r8.xyz = rcp(r9.xyz);
  r7.xyz = r8.xyz * r7.xyz;
  r6.xyz = max(r7.xyz, -r6.xyz);
  r0.w = max(r6.y, r6.z);
  r0.w = max(r6.x, r0.w);
  r0.w = min(0, r0.w);
  r0.w = max(-0.1875, r0.w);
  r0.w = cb0[4].x * r0.w;
  r0.xyz = r0.www * r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r0.xyz = r0.www * r5.xyz + r0.xyz;
  r0.xyz = r0.www * r4.xyz + r0.xyz;
  r0.w = r0.w * 4 + 1;
  r0.xyz = r0.xyz + r2.xyz;
  r1.z = (int)-r0.w + 0x7ef19fff;
  r0.w = -r1.z * r0.w + 2;
  r0.w = r1.z * r0.w;

  //r0.xyz = saturate(r0.xyz * r0.www);
  r0.xyz = (r0.xyz * r0.www);
  
  r1.zw = r1.xy * cb0[6].xy + cb0[6].zw;
  r2.xy = cb1[48].xy * r1.xy;
  r0.w = t1.SampleBias(s1_s, r1.zw, cb1[79].y).w;
  r0.w = -0.5 + r0.w;
  r0.w = r0.w + r0.w;
  r1.xyz = r0.xyz * r0.www;
  r1.xyz = cb0[5].xxx * r1.xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = sqrt(r0.w);
  r0.w = cb0[5].y * -r0.w + 1;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r2.z = 0;
  r1.xyzw = t2.SampleLevel(s0_s, r2.xyz, 0).xyzw;
  o0.xyz = r1.www * r0.xyz + r1.xyz;
  r0.xy = cb1[46].xy * v1.xy;
  r0.xy = (uint2)r0.xy;
  r0.xy = (uint2)r0.xy;
  r0.zw = float2(-1,-1) + cb1[46].xy;
  r0.zw = cb0[8].zw * r0.zw;
  r0.xy = r0.xy * cb0[8].xy + r0.zw;
  r0.xy = (uint2)r0.xy;
  r0.zw = float2(0,0);
  r0.x = t3.Load(r0.xyzw).x;
  r0.y = cmp(cb0[10].x == 1.000000);
  o0.w = r0.y ? r0.x : 1;
  return;
}