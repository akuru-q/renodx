#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:15 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s2_s : register(s2);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[11];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[92];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[13];
}

cbuffer cb9 : register(b9)
{
  float4 cb9[16];
}

cbuffer cb5 : register(b5)
{
  float4 cb5[2];
}

cbuffer cb6 : register(b6)
{
  float4 cb6[2];
}

cbuffer cb7 : register(b7)
{
  float4 cb7[11];
}

cbuffer cb13 : register(b13)
{
  float4 cb13[1];
}

cbuffer cb12 : register(b12)
{
  float4 cb12[30];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : COLOR0,
  float4 v1 : COLOR1,
  float3 v2 : TEXCOORD0,
  float w2 : TEXCOORD6,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t2.Sample(s2_s, v2.xy).xyz;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xy = t5.Sample(s5_s, v2.xy).xy;
  r0.z = cb7[10].w * r0.z;
  r0.z = max(1, r0.z);
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r2.xy, r2.xy);
  r0.w = 1 + -r0.w;
  r0.w = max(0, r0.w);
  r0.w = sqrt(r0.w);
  r3.xyz = v5.yzx * v4.zxy;
  r3.xyz = v4.yzx * v5.zxy + -r3.xyz;
  r3.xyz = v5.www * r3.xyz;
  r2.xzw = v5.xyz * r2.xxx;
  r2.xyz = r2.yyy * r3.xyz + r2.xzw;
  r2.xyz = r0.www * v4.xyz + r2.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www;
  r2.w = dot(v3.xyz, v3.xyz);
  r2.w = rsqrt(r2.w);
  r4.xyz = v3.xyz * r2.www;
  r5.xyz = v3.xyz * r2.www + cb3[6].xyz;
  r4.w = dot(r5.xyz, r5.xyz);
  r4.w = rsqrt(r4.w);
  r5.xyz = r5.xyz * r4.www;
  r4.w = abs(r3.y) + abs(r3.y);
  r4.w = min(1, r4.w);
  r4.w = 1 + -r4.w;
  r5.w = dot(-r4.xyz, v4.xyz);
  r5.w = saturate(1 + -r5.w);
  r6.x = dot(-r4.xyz, r3.xyz);
  r6.x = 1 + -r6.x;
  r6.y = saturate(r6.x);
  r5.w = r6.y * r5.w;
  r6.y = r5.w * r5.w;
  r6.y = r6.y * r4.w;
  r6.y = dot(r6.yy, r0.yy);
  r7.xyzw = int4(4096,8,1,0x4000) & asint(cb13[0].xxxx);
  r5.w = log2(r5.w);
  r5.w = cb9[9].y * r5.w;
  r5.w = exp2(r5.w);
  r5.w = cb9[9].x * r5.w;
  r4.w = r5.w * r4.w;
  r4.w = r4.w * r0.y;
  r4.w = r7.x ? r4.w : r6.y;
  r4.w = r4.w * cb9[2].x + 1;
  r1.xyz = r4.www * r1.xyz;
  r6.yz = cb12[29].zw * v8.xy;
  if (r7.y != 0) {
    r8.xy = t13.Sample(s13_s, r6.yz).xy;
  } else {
    r8.xy = float2(1,1);
  }
  r8.zw = r8.xy * cb1[12].xz + cb1[12].yw;
  r8.xy = r7.yy ? r8.zw : r8.xy;
  r4.w = min(r8.x, r8.y);
  r9.xyz = v3.xyz * r2.www + cb3[7].xyz;
  r5.w = dot(r9.xyz, r9.xyz);
  r5.w = rsqrt(r5.w);
  r9.xyz = r9.xyz * r5.www;
  r5.w = dot(r4.xyz, r3.xyz);
  r5.w = r5.w + r5.w;
  r10.xyz = r3.xyz * -r5.www + r4.xyz;
  r11.x = saturate(dot(r10.xyz, -cb3[6].xyz));
  r11.y = saturate(dot(r10.xyz, -cb3[7].xyz));
  r8.zw = log2(r11.xy);
  r8.zw = r8.zw * r0.zz;
  r8.zw = exp2(r8.zw);
  r5.w = cb1[0].w * cb7[8].z;
  r6.w = r0.z * 0.0397435986 + 0.0856831968;
  r8.zw = r8.zw * r6.ww;
  r5.x = dot(r4.xyz, r5.xyz);
  r5.y = dot(r4.xyz, r9.xyz);
  r5.xy = float2(1,1) + -r5.xy;
  r9.xy = r5.xy * r5.xy;
  r5.z = -cb7[8].z * cb1[0].w + 1;
  r9.xy = r9.xy * r9.xy;
  r9.xy = r9.xy * r5.zz;
  r5.xy = r9.xy * r5.xy + r5.ww;
  r5.xy = r8.zw * r5.xy;
  r9.x = dot(r3.xyz, -cb3[6].xyz);
  r7.x = saturate(r9.x);
  r5.x = r7.x * r5.x;
  r9.y = dot(r3.xyz, -cb3[7].xyz);
  r11.xyz = saturate(r9.yxy);
  r5.y = r11.x * r5.y;
  r7.x = cmp(0 < cb9[10].x);
  r12.xyz = float3(1,0,0) * r4.zxy;
  r12.xyz = r4.yzx * float3(0,0,1) + -r12.xyz;
  r13.xyz = cb9[10].www * float3(0,1,0) + r4.xyz;
  r12.xyz = r12.xyz * cb9[10].zzz + r13.xyz;
  r8.z = dot(r12.xyz, r12.xyz);
  r8.z = rsqrt(r8.z);
  r12.xyz = r12.xyz * r8.zzz;
  r8.z = saturate(dot(r3.xyz, -r12.xyz));
  r8.w = cb9[10].y * r0.z;
  r8.z = log2(r8.z);
  r8.z = r8.w * r8.z;
  r8.z = exp2(r8.z);
  r8.z = cb9[10].x * r8.z;
  r7.x = r7.x ? r8.z : 0;
  r8.z = cmp(0 < cb9[11].x);
  if (r8.z != 0) {
    r8.z = dot(r10.xyz, r10.xyz);
    r8.z = rsqrt(r8.z);
    r12.xyz = r10.xyz * r8.zzz;
    r12.w = 1;
    r13.x = dot(cb2[80].xyzw, r12.xyzw);
    r13.y = dot(cb2[81].xyzw, r12.xyzw);
    r13.z = dot(cb2[82].xyzw, r12.xyzw);
    r13.w = dot(cb2[83].xyzw, r12.xyzw);
    r13.x = dot(r12.xyzw, r13.xyzw);
    r14.x = dot(cb2[84].xyzw, r12.xyzw);
    r14.y = dot(cb2[85].xyzw, r12.xyzw);
    r14.z = dot(cb2[86].xyzw, r12.xyzw);
    r14.w = dot(cb2[87].xyzw, r12.xyzw);
    r13.y = dot(r12.xyzw, r14.xyzw);
    r14.x = dot(cb2[88].xyzw, r12.xyzw);
    r14.y = dot(cb2[89].xyzw, r12.xyzw);
    r14.z = dot(cb2[90].xyzw, r12.xyzw);
    r14.w = dot(cb2[91].xyzw, r12.xyzw);
    r13.z = dot(r12.xyzw, r14.xyzw);
    r12.xyz = max(float3(0.0625,0.0625,0.0625), r13.xyz);
    r8.z = max(r12.x, r12.y);
    r8.z = max(r8.z, r12.z);
    r8.w = cb9[11].z * r8.z;
    r9.z = -r8.z * cb9[11].z + r8.z;
    r8.w = r4.w * r9.z + r8.w;
    r12.xyz = r12.xyz / r8.zzz;
    r12.xyz = float3(-9.99999997e-07,-9.99999997e-07,-9.99999997e-07) + r12.xyz;
    r12.xyz = log2(r12.xyz);
    r12.xyz = cb9[11].yyy * r12.xyz;
    r12.xyz = exp2(r12.xyz);
    r12.xyz = r12.xyz * r8.www;
    r12.xyz = cb9[11].xxx * r12.xyz;
    r13.xyz = v3.xyz * r2.www + r10.xyz;
    r8.z = dot(r13.xyz, r13.xyz);
    r8.z = rsqrt(r8.z);
    r13.xyz = r13.xyz * r8.zzz;
    r8.z = dot(-r4.xyz, r13.xyz);
    r8.z = 1 + -r8.z;
    r8.w = r8.z * r8.z;
    r8.w = r8.w * r8.w;
    r8.w = r8.w * r5.z;
    r8.z = r8.w * r8.z + r5.w;
    r8.z = r8.z * r6.w;
    r13.xyz = cb6[1].xyz * cb7[10].xyz;
    r14.xyz = cb3[0].xyz * r5.xxx;
    r15.xyz = cb3[1].xyz * r5.yyy;
    r14.xyz = r14.xyz * r4.www + r15.xyz;
    r14.xyz = r14.xyz + r7.xxx;
    r12.xyz = r12.xyz * r8.zzz + r14.xyz;
    r12.xyz = r13.xyz * r12.xyz;
  } else {
    r13.xyz = cb6[1].xyz * cb7[10].xyz;
    r14.xyz = cb3[0].xyz * r5.xxx;
    r15.xyz = cb3[1].xyz * r5.yyy;
    r14.xyz = r14.xyz * r4.www + r15.xyz;
    r14.xyz = r14.xyz + r7.xxx;
    r12.xyz = r14.xyz * r13.xyz;
  }
  r5.x = -0.5 + w2.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r9.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[1].xyzw * r9.zzzz;
  r13.xyzw = cb2[0].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r9.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[2].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[3].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[4].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[5].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[6].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[7].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.y = cmp(r5.x < 0);
  r8.zw = r5.yy ? float2(1,30) : 0;
  r13.xyzw = cb2[8].xyzw * r8.zzzz + r13.xyzw;
  r5.x = r8.w + r5.x;
  r5.x = -1 + r5.x;
  r5.x = cmp(r5.x < 0);
  r5.x = r5.x ? 1.000000 : 0;
  r13.xyzw = cb2[9].xyzw * r5.xxxx + r13.xyzw;
  r5.x = max(r1.x, r1.y);
  r5.x = max(r5.x, r1.z);
  r1.x = min(r1.x, r1.y);
  r1.x = min(r1.x, r1.z);
  r1.x = r1.x + r5.x;
  r1.y = 0.5 * r1.x;
  r1.z = r13.z + r13.z;
  r5.x = r13.z * 2 + -1;
  r5.y = cmp(0 < r5.x);
  r7.x = r5.y ? 1.000000 : 0;
  r1.x = -r1.x * 0.5 + 1;
  r5.x = 1 + -r5.x;
  r1.x = -r1.x * r5.x + 1;
  r1.y = r1.y * r1.z;
  r1.z = r5.y ? 0 : 1;
  r1.y = r1.y * r1.z;
  r1.xyz = r1.xxx * r7.xxx + r1.yyy;
  r5.x = cmp(0 < r13.y);
  if (r5.x != 0) {
    r5.x = cmp(r1.z < 0.5);
    r14.xyz = float3(1,0.333333343,-0.333333343) + r13.yxx;
    r5.y = r14.x * r1.z;
    r7.x = r1.z + r13.y;
    r7.x = -r13.y * r1.z + r7.x;
    r5.x = r5.x ? r5.y : r7.x;
    r5.y = r1.z * 2 + -r5.x;
    r8.zw = frac(r14.yz);
    r7.x = r5.x + -r5.y;
    r9.z = 6 * r7.x;
    r11.xw = r9.zz * r8.zw + r5.yy;
    r14.xyzw = cmp(r8.zzzw < float4(0.166666672,0.5,0.666666687,0.166666672));
    r13.yz = float2(0.666666687,0.666666687) + -r8.zw;
    r13.yz = r13.yz * r7.xx;
    r13.yz = r13.yz * float2(6,6) + r5.yy;
    r8.z = r14.z ? r13.y : r5.y;
    r8.z = r14.y ? r5.x : r8.z;
    r1.x = r14.x ? r11.x : r8.z;
    r8.z = frac(r13.x);
    r9.z = r9.z * r8.z + r5.y;
    r14.xyz = cmp(r8.zzz < float3(0.166666672,0.5,0.666666687));
    r8.z = 0.666666687 + -r8.z;
    r7.x = r8.z * r7.x;
    r7.x = r7.x * 6 + r5.y;
    r7.x = r14.z ? r7.x : r5.y;
    r7.x = r14.y ? r5.x : r7.x;
    r1.y = r14.x ? r9.z : r7.x;
    r8.zw = cmp(r8.ww < float2(0.5,0.666666687));
    r5.y = r8.w ? r13.z : r5.y;
    r5.x = r8.z ? r5.x : r5.y;
    r1.z = r14.w ? r11.w : r5.x;
  }
  if (r7.z != 0) {
    r5.x = saturate(dot(r3.xyz, -v6.xyz));
    r13.x = v3.w;
    r13.y = v4.w;
    r13.z = v6.w;
    r14.xyz = r13.xyz * r5.xxx;
    r14.xyz = max(float3(0,0,0), r14.xyz);
    r5.y = saturate(dot(r3.xyz, -v7.xyz));
    r15.x = v0.w;
    r15.y = v1.w;
    r15.z = v7.w;
    r16.xyz = r15.xyz * r5.yyy;
    r16.xyz = max(float3(0,0,0), r16.xyz);
    r14.xyz = r16.xyz + r14.xyz;
    r16.xyz = v3.xyz * r2.www + v6.xyz;
    r7.x = dot(r16.xyz, r16.xyz);
    r7.x = rsqrt(r7.x);
    r16.xyz = r16.xyz * r7.xxx;
    r17.xyz = v3.xyz * r2.www + v7.xyz;
    r2.w = dot(r17.xyz, r17.xyz);
    r2.w = rsqrt(r2.w);
    r17.xyz = r17.xyz * r2.www;
    r18.x = saturate(dot(r10.xyz, -v6.xyz));
    r18.y = saturate(dot(r10.xyz, -v7.xyz));
    r7.xz = log2(r18.xy);
    r7.xz = r7.xz * r0.zz;
    r7.xz = exp2(r7.xz);
    r7.xz = r7.xz * r6.ww;
    r10.x = dot(r4.xyz, r16.xyz);
    r10.y = dot(r4.xyz, r17.xyz);
    r4.xy = float2(1,1) + -r10.xy;
    r8.zw = r4.xy * r4.xy;
    r8.zw = r8.zw * r8.zw;
    r8.zw = r8.zw * r5.zz;
    r4.xy = r8.zw * r4.xy + r5.ww;
    r4.xy = r7.xz * r4.xy;
    r0.z = r4.x * r5.x;
    r2.w = r4.y * r5.y;
    r4.xyz = r15.xyz * r2.www;
    r4.xyz = r13.xyz * r0.zzz + r4.xyz;
    r4.xyz = max(float3(0,0,0), r4.xyz);
    r5.xyz = cb6[1].xyz * cb7[10].xyz;
    r4.xyz = r5.xyz * r4.xyz;
    r4.xyz = min(float3(1,1,1), r4.xyz);
  } else {
    r14.xyz = float3(0,0,0);
    r4.xyz = float3(0,0,0);
  }
  r5.xyzw = t14.Sample(s14_s, r6.yz).xyzw;
  r10.xyzw = float4(4,4,4,4) * r5.xyzw;
  r15.xyzw = int4(8192,64,512,0x8000) & asint(cb13[0].xxxx);
  r16.xyzw = r5.xyzw + r5.xyzw;
  r5.xyzw = r5.xyzw / cb1[0].zzzz;
  r5.xyzw = r15.xxxx ? r16.xyzw : r5.xyzw;
  r5.xyzw = r7.wwww ? r10.xyzw : r5.xyzw;
  r5.xyz = r14.xyz + r5.xyz;
  r4.xyz = r5.www + r4.xyz;
  r3.w = 1;
  r10.x = dot(cb2[80].xyzw, r3.xyzw);
  r10.y = dot(cb2[81].xyzw, r3.xyzw);
  r10.z = dot(cb2[82].xyzw, r3.xyzw);
  r10.w = dot(cb2[83].xyzw, r3.xyzw);
  r10.x = dot(r3.xyzw, r10.xyzw);
  r14.x = dot(cb2[84].xyzw, r3.xyzw);
  r14.y = dot(cb2[85].xyzw, r3.xyzw);
  r14.z = dot(cb2[86].xyzw, r3.xyzw);
  r14.w = dot(cb2[87].xyzw, r3.xyzw);
  r10.y = dot(r3.xyzw, r14.xyzw);
  r14.x = dot(cb2[88].xyzw, r3.xyzw);
  r14.y = dot(cb2[89].xyzw, r3.xyzw);
  r14.z = dot(cb2[90].xyzw, r3.xyzw);
  r14.w = dot(cb2[91].xyzw, r3.xyzw);
  r10.z = dot(r3.xyzw, r14.xyzw);
  r3.xzw = max(float3(0.0625,0.0625,0.0625), r10.xyz);
  r0.z = r3.y * 0.5 + 0.5;
  r6.yzw = -cb3[10].xyz + cb3[4].xyz;
  r6.yzw = r0.zzz * r6.yzw + cb3[10].xyz;
  r3.xyz = cb2[79].xxx * r3.xzw + r6.yzw;
  r6.yzw = cb3[0].xyz * r11.yyy;
  r7.xzw = cb3[1].xyz * r11.zzz;
  r0.z = cb7[7].z + -cb7[7].w;
  r10.w = v2.z * r0.z + cb7[7].w;
  r0.z = cb9[2].w * r9.x;
  r2.w = r9.x * r8.x;
  r0.z = min(r2.w, r0.z);
  r8.zw = float2(1,1) + r9.xy;
  r10.yz = float2(0.5,0.5) * r8.wz;
  r9.xyz = t6.Sample(s6_s, r10.zw).xyz;
  r11.xzw = t6.Sample(s6_s, r10.yw).xyz;
  r0.z = 1 + r0.z;
  r10.x = 0.5 * r0.z;
  r10.xyz = t6.Sample(s6_s, r10.xw).xyz;
  r9.xyz = r9.xyz * r4.www + -r10.xyz;
  r9.xyz = r11.yyy * r9.xyz + r10.xyz;
  r10.xyz = cb3[1].xyz * r11.xzw;
  r11.xzw = r6.yzw * r4.www + r7.xzw;
  r9.xyz = cb3[0].xyz * r9.xyz + r10.xyz;
  r0.z = cb9[2].y * r8.y;
  r9.xyz = r9.xyz + -r11.xzw;
  r9.xyz = r0.zzz * r9.xyz + r11.xzw;
  r9.xyz = r9.xyz + r3.xyz;
  r9.xyz = r9.xyz + r5.xyz;
  r10.xyz = r9.xyz * r0.yyy;
  r0.z = r11.y * r4.w;
  r2.w = 1 + -r0.y;
  r2.w = r0.z * r2.w + r0.y;
  r9.xyz = r9.xyz * r2.www;
  r9.xyz = r15.yyy ? r9.xyz : r10.xyz;
  r2.w = saturate(-v2.z + r0.y);
  r3.w = 1 + -r2.w;
  r0.z = r0.z * r3.w + r2.w;
  r10.xyz = r12.xyz * r0.zzz;
  r10.xyz = r15.zzz ? r12.xyz : r10.xyz;
  r10.xyz = r10.xyz + r4.xyz;
  r2.xyz = r2.xyz * r0.www + float3(1,1,1);
  r2.xyz = saturate(float3(0.5,0.5,0.5) * r2.xyz);
  r2.xyz = cb9[11].yyy * r2.xyz;
  r2.xyz = cb9[11].xxx * r1.xyz + r2.xyz;
  r0.z = cb9[11].z * r0.x;
  r11.xyz = cb6[1].xyz * cb7[10].xyz;
  r2.xyz = r0.zzz * r11.xyz + r2.xyz;
  r2.xyz = cb9[11].www * r10.xxx + r2.xyz;
  r0.z = cb9[12].y * r8.y;
  r2.xyz = cb9[12].xxx * r8.xxx + r2.xyz;
  r0.yzw = r0.zzz * r0.yyy + r2.xyz;
  r2.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r2.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r11.xyz + r0.yzw;
  r2.w = r6.x * r6.x;
  r2.w = r2.w * r2.w;
  r2.w = r2.w * r6.x;
  r2.w = r2.w * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r2.www + r0.yzw;
  r0.yzw = cb9[13].www * r3.xyz + r0.yzw;
  r0.yzw = cb9[14].xxx * v2.zzz + r0.yzw;
  r3.xyz = cb9[14].yyy * r2.xyz;
  r0.yzw = r3.xyz * r6.yzw + r0.yzw;
  r3.xyz = cb9[14].zzz * r2.xyz;
  r0.yzw = r3.xyz * r7.xzw + r0.yzw;
  r0.yzw = cb9[14].www * r5.xyz + r0.yzw;
  r3.xyz = cb9[15].xxx * r11.xyz;
  r0.yzw = r3.xyz * r10.xyz + r0.yzw;
  r3.xyz = cb9[15].yyy * r11.xyz;
  r0.yzw = r3.xyz * r10.xyz + r0.yzw;
  r0.yzw = saturate(cb9[15].zzz * r4.xyz + r0.yzw);
  r1.xyz = r9.xyz * r1.xyz;
  r3.xyz = r10.xyz * r0.xxx;
  r1.xyz = r1.xyz * r2.xyz + r3.xyz;
  r0.xyz = r15.www ? r0.yzw : r1.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r0.w = r1.w * r0.w;
  r1.w = r0.w * r13.w;
  r0.xyz = v0.xyz * r0.xyz;
  r2.xy = int2(16,4) & asint(cb13[0].xx);
  r3.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r3.xyz, cb1[0].x);

  r4.xyz = log2(r3.xyz);
  r4.xyz = cb1[0].yyy * r4.xyz;
  r4.xyz = exp2(r4.xyz);
  r5.xyz = r3.xyz + r3.xyz;
  r6.xyz = r3.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r6.xyz = r5.xyz * r6.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r3.xyz = r3.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r3.xyz = r5.xyz * r3.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r3.xyz = r6.xyz / r3.xyz;
  r3.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r3.xyz;
  r3.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r3.xyz);

  MarkerFunction2(r3.xyz);

  r3.xyz = sqrt(r3.xyz);
  r0.xyz = r15.www ? r0.xyz : r3.xyz;
  r0.xyz = r2.xxx ? r4.xyz : r0.xyz;
  r2.xzw = v1.xyz + r0.xyz;
  r0.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r0.xyz = r2.yyy ? r2.xzw : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r15.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.yyyy ? r1.xyzw : r0.xyzw;
  return;
}