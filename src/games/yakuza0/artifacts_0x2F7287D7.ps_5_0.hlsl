// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:06 2025
Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb9 : register(b9)
{
  float4 cb9[10];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float3 v5 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy / v1.zz;
  r0.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r1.x = -0.00196078443 + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyzw = t2.Sample(s2_s, v2.zw).xyzw;
  r2.xy = v2.xy / v1.zz;
  o0.w = 1 + -r1.w;
  r2.z = dot(cb9[2].xyz, -v3.xyz);
  r2.z = cb9[2].w * r2.z + cb9[0].w;
  r2.w = t3.Sample(s3_s, v0.zw).w;
  r2.z = r2.z * r2.w + v0.y;
  r0.x = -cb9[3].x + r0.x;
  r0.y = -cb9[0].x + r0.y;
  r2.w = cb9[0].z * r0.y;
  r3.x = cmp(0 < r2.z);
  r3.yz = v4.xy * float2(1,-1) + r2.xy;
  r3.yzw = t1.Sample(s1_s, r3.yz).xyz;
  r4.x = dot(v5.xyz, v5.xyz);
  r4.x = rsqrt(r4.x);
  r4.xyz = v5.xyz * r4.xxx;
  r4.w = dot(cb9[1].xyz, r4.xyz);
  r4.w = -cb9[1].w / r4.w;
  r5.xyz = r4.xyz * r4.www;
  r5.w = 1;
  r6.x = dot(cb9[4].xyzw, r5.xyzw);
  r6.y = dot(cb9[5].xyzw, r5.xyzw);
  r5.xy = t3.Sample(s3_s, r6.xy).xy;
  r5.xy = float2(-0.5,-0.5) + r5.xy;
  r5.xy = r5.xy * cb9[7].ww + cb9[1].xy;
  r5.z = cb9[1].z;
  r4.w = dot(r5.xyz, r5.xyz);
  r4.w = rsqrt(r4.w);
  r6.xyz = r5.xyz * r4.www;
  r4.w = dot(r6.xyz, r4.xyz);
  r5.w = cb9[7].y * -r6.z;
  r6.zw = r5.ww * r6.xy;
  r6.zw = r6.zw * float2(1,-1) + r2.xy;
  r7.xyz = t1.Sample(s1_s, r6.zw).xyz;
  r5.w = -2 * r4.w;
  r6.xy = r5.ww * r6.xy + r4.xy;
  r6.xy = r6.xy * float2(0.5,-0.5) + float2(0.5,0.5);
  r6.xyz = t1.Sample(s1_s, r6.xy).xyz;
  r0.x = r0.x * cb9[3].z + -v0.x;
  r5.w = r2.w * r0.x;
  r6.w = r0.y * cb9[0].z + -r2.z;
  r5.w = r5.w / r6.w;
  r8.xy = r0.zw * float2(2,2.00866485) + float2(-1,-1.00866485);
  r0.z = dot(r8.xy, r8.xy);
  r0.z = 1 + -r0.z;
  r8.z = sqrt(r0.z);
  r0.z = cb9[7].y * -r8.z;
  r0.zw = r0.zz * r8.xy;
  r0.zw = r0.zw * float2(1,-1) + r2.xy;
  r9.xyz = t1.Sample(s1_s, r0.zw).xyz;
  r0.z = saturate(12 * r5.w);
  r0.z = 1 + -r0.z;
  r5.xyz = r8.xyz * r0.zzz + r5.xyz;
  r0.z = dot(r5.xyz, r5.xyz);
  r0.z = rsqrt(r0.z);
  r5.xyz = r5.xyz * r0.zzz;
  r0.z = dot(r5.xyz, r4.xyz);
  r0.w = -2 * r0.z;
  r2.xy = r0.ww * r5.xy + r4.xy;
  r2.xy = r2.xy * float2(0.5,-0.5) + float2(0.5,0.5);
  r4.xyz = t1.Sample(s1_s, r2.xy).xyz;
  if (r3.x != 0) {
    r0.w = cmp(0 < r2.w);
    if (r0.w != 0) {
      r0.w = 100 * r0.x;
      r2.xyw = log2(cb9[6].xyz);
      r2.xyw = r2.xyw * r0.www;
      r2.xyw = exp2(r2.xyw);
      r2.xyw = r3.yzw * r2.xyw;
    } else {
      r0.x = r2.z * r0.x;
      r0.w = -r0.y * cb9[0].z + r2.z;
      r0.x = r0.x / r0.w;
      r0.w = cmp(cb9[7].z < -r4.w);
      if (r0.w == 0) {
        r7.xyz = float3(0,0,0);
      }
      r3.xyz = cb9[9].xyz * r6.xyz;
      r0.w = 1 + r4.w;
      r0.w = log2(abs(r0.w));
      r0.w = cb9[9].w * r0.w;
      r0.w = exp2(r0.w);
      r3.xyz = r3.xyz * r0.www + r7.xyz;
      r0.x = 100 * r0.x;
      r5.xyz = log2(cb9[6].xyz);
      r5.xyz = r5.xyz * r0.xxx;
      r5.xyz = exp2(r5.xyz);
      r2.xyw = r5.xyz * r3.xyz;
    }
    r3.xyz = float3(0,0,0);
  } else {
    r0.x = r0.y * cb9[0].z + -0.00196078443;
    r0.x = cmp(r0.x < 0);
    if (r0.x != 0) {
      if (-1 != 0) discard;
      r2.xyw = float3(0,0,0);
      r3.xyz = float3(0,0,0);
    } else {
      r0.x = 100 * r5.w;
      r5.xyz = log2(cb9[6].xyz);
      r0.xyw = r5.xyz * r0.xxx;
      r0.xyw = exp2(r0.xyw);
      r2.xyw = r9.xyz * r0.xyw;
      r0.xyw = cb9[9].xyz * r4.xyz;
      r0.z = 1 + -r0.z;
      r0.z = log2(abs(r0.z));
      r0.z = cb9[9].w * r0.z;
      r0.z = exp2(r0.z);
      r3.xyz = r0.xyw * r0.zzz;
    }
  }
  r0.xyz = r2.xyw * cb9[6].www + r3.xyz;
  r0.w = cb9[8].w * r1.w;
  r1.w = 1 + -v3.z;
  r0.w = abs(r1.w) * r0.w;
  o0.xyz = r1.xyz * r0.www + r0.xyz;
  
  o0 = max(0, o0);
  
  return;
}