#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:10 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t2 : register(t2);

TextureCube<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s5_s : register(s5);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

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
  float2 v2 : TEXCOORD0,
  float w2 : TEXCOORD6,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t2.Sample(s2_s, v2.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xy = t5.Sample(s5_s, v2.xy).xy;
  r0.z = cb7[10].w * r0.z;
  r0.z = max(1, r0.z);
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r2.z = dot(r2.xy, r2.xy);
  r2.z = 1 + -r2.z;
  r2.z = max(0, r2.z);
  r2.z = sqrt(r2.z);
  r3.xyz = v5.yzx * v4.zxy;
  r3.xyz = v4.yzx * v5.zxy + -r3.xyz;
  r3.xyz = v5.www * r3.xyz;
  r4.xyz = v5.xyz * r2.xxx;
  r2.xyw = r2.yyy * r3.xyz + r4.xyz;
  r2.xyz = r2.zzz * v4.xyz + r2.xyw;
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = rsqrt(r2.w);
  r3.xyz = r2.xyz * r2.www;
  r4.x = dot(v3.xyz, v3.xyz);
  r4.x = rsqrt(r4.x);
  r4.yzw = v3.xyz * r4.xxx;
  r5.xyz = v3.xyz * r4.xxx + cb3[6].xyz;
  r5.w = dot(r5.xyz, r5.xyz);
  r5.w = rsqrt(r5.w);
  r5.xyz = r5.xyz * r5.www;
  r5.w = dot(r4.yzw, r3.xyz);
  r5.w = r5.w + r5.w;
  r6.xyz = r3.xyz * -r5.www + r4.yzw;
  r5.w = dot(r6.xyz, r6.xyz);
  r5.w = rsqrt(r5.w);
  r7.xyz = r6.xyz * r5.www;
  r7.xyz = float3(-1,1,1) * r7.xyz;
  r7.xyzw = t1.Sample(s1_s, r7.xyz).xyzw;
  r5.w = max(0.00392156886, r7.w);
  r5.w = 0.25 / r5.w;
  r7.xyz = r7.xyz * r5.www;
  r7.xyz = r7.xyz * r7.xyz;
  r1.xyz = r7.xyz * r0.www + r1.xyz;
  r7.xy = cb12[29].zw * v8.xy;
  r8.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r8.x != 0) {
    r7.zw = t13.Sample(s13_s, r7.xy).xy;
  } else {
    r7.zw = float2(1,1);
  }
  r9.xy = r7.zw * cb1[12].xz + cb1[12].yw;
  r7.zw = r8.xx ? r9.xy : r7.zw;
  r0.w = min(r7.z, r7.w);
  r9.xyz = v3.xyz * r4.xxx + cb3[7].xyz;
  r5.w = dot(r9.xyz, r9.xyz);
  r5.w = rsqrt(r5.w);
  r9.xyz = r9.xyz * r5.www;
  r10.x = saturate(dot(r6.xyz, -cb3[6].xyz));
  r10.y = saturate(dot(r6.xyz, -cb3[7].xyz));
  r6.xy = log2(r10.xy);
  r6.xy = r6.xy * r0.zz;
  r6.xy = exp2(r6.xy);
  r5.w = cb1[0].w * cb7[8].z;
  r6.z = r0.z * 0.0397435986 + 0.0856831968;
  r6.xy = r6.xy * r6.zz;
  r5.x = dot(r4.yzw, r5.xyz);
  r5.y = dot(r4.yzw, r9.xyz);
  r5.xy = float2(1,1) + -r5.xy;
  r6.zw = r5.xy * r5.xy;
  r5.z = -cb7[8].z * cb1[0].w + 1;
  r6.zw = r6.zw * r6.zw;
  r6.zw = r6.zw * r5.zz;
  r5.xy = r6.zw * r5.xy + r5.ww;
  r5.xy = r6.xy * r5.xy;
  r6.x = dot(r3.xyz, -cb3[6].xyz);
  r5.z = saturate(r6.x);
  r5.x = r5.x * r5.z;
  r6.y = dot(r3.xyz, -cb3[7].xyz);
  r6.xyz = saturate(r6.yxy);
  r5.y = r6.x * r5.y;
  r9.xyz = cb6[1].xyz * cb7[10].xyz;
  r5.xzw = cb3[0].xyz * r5.xxx;
  r10.xyz = cb3[1].xyz * r5.yyy;
  r5.xyz = r5.xzw * r0.www + r10.xyz;
  r5.w = -0.5 + w2.x;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.w = cmp(r5.w < 0);
  r7.zw = r6.ww ? float2(1,30) : 0;
  r10.xyzw = cb2[1].xyzw * r7.zzzz;
  r10.xyzw = cb2[0].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r7.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[2].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[3].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[4].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[5].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[6].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[7].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r6.x = cmp(r5.w < 0);
  r6.xw = r6.xx ? float2(1,30) : 0;
  r10.xyzw = cb2[8].xyzw * r6.xxxx + r10.xyzw;
  r5.w = r6.w + r5.w;
  r5.w = -1 + r5.w;
  r5.w = cmp(r5.w < 0);
  r5.w = r5.w ? 1.000000 : 0;
  r10.xyzw = cb2[9].xyzw * r5.wwww + r10.xyzw;
  r5.w = max(r1.x, r1.y);
  r5.w = max(r5.w, r1.z);
  r1.x = min(r1.x, r1.y);
  r1.x = min(r1.x, r1.z);
  r1.x = r1.x + r5.w;
  r1.y = 0.5 * r1.x;
  r1.z = r10.z + r10.z;
  r5.w = r10.z * 2 + -1;
  r6.x = cmp(0 < r5.w);
  r6.w = r6.x ? 1.000000 : 0;
  r1.x = -r1.x * 0.5 + 1;
  r5.w = 1 + -r5.w;
  r1.x = -r1.x * r5.w + 1;
  r1.y = r1.y * r1.z;
  r1.z = r6.x ? 0 : 1;
  r1.y = r1.y * r1.z;
  r1.xyz = r1.xxx * r6.www + r1.yyy;
  r5.w = cmp(0 < r10.y);
  if (r5.w != 0) {
    r5.w = cmp(r1.z < 0.5);
    r11.xyz = float3(1,0.333333343,-0.333333343) + r10.yxx;
    r6.x = r11.x * r1.z;
    r6.w = r1.z + r10.y;
    r6.w = -r10.y * r1.z + r6.w;
    r5.w = r5.w ? r6.x : r6.w;
    r6.x = r1.z * 2 + -r5.w;
    r7.zw = frac(r11.yz);
    r6.w = -r6.x + r5.w;
    r9.w = 6 * r6.w;
    r10.yz = r9.ww * r7.zw + r6.xx;
    r11.xyzw = cmp(r7.zzzw < float4(0.166666672,0.5,0.666666687,0.166666672));
    r12.xy = float2(0.666666687,0.666666687) + -r7.zw;
    r12.xy = r12.xy * r6.ww;
    r12.xy = r12.xy * float2(6,6) + r6.xx;
    r7.z = r11.z ? r12.x : r6.x;
    r7.z = r11.y ? r5.w : r7.z;
    r1.x = r11.x ? r10.y : r7.z;
    r7.z = frac(r10.x);
    r9.w = r9.w * r7.z + r6.x;
    r11.xyz = cmp(r7.zzz < float3(0.166666672,0.5,0.666666687));
    r7.z = 0.666666687 + -r7.z;
    r6.w = r7.z * r6.w;
    r6.w = r6.w * 6 + r6.x;
    r6.w = r11.z ? r6.w : r6.x;
    r6.w = r11.y ? r5.w : r6.w;
    r1.y = r11.x ? r9.w : r6.w;
    r7.zw = cmp(r7.ww < float2(0.5,0.666666687));
    r6.x = r7.w ? r12.y : r6.x;
    r5.w = r7.z ? r5.w : r6.x;
    r1.z = r11.w ? r10.z : r5.w;
  }
  r5.w = saturate(dot(r3.xyz, -v6.xyz));
  r10.x = v3.w;
  r10.y = v4.w;
  r10.z = v6.w;
  r11.xyz = r10.xyz * r5.www;
  r11.xyz = max(float3(0,0,0), r11.xyz);
  r5.w = saturate(dot(r3.xyz, -v7.xyz));
  r12.x = v0.w;
  r12.y = v1.w;
  r12.z = v7.w;
  r13.xyz = r12.xyz * r5.www;
  r13.xyz = max(float3(0,0,0), r13.xyz);
  r11.xyz = r13.xyz + r11.xyz;
  r13.xyz = v3.xyz * r4.xxx + v6.xyz;
  r5.w = dot(r13.xyz, r13.xyz);
  r5.w = rsqrt(r5.w);
  r13.xyz = r13.xyz * r5.www;
  r14.xyz = v3.xyz * r4.xxx + v7.xyz;
  r4.x = dot(r14.xyz, r14.xyz);
  r4.x = rsqrt(r4.x);
  r14.xyz = r14.xyz * r4.xxx;
  r13.x = saturate(dot(-r13.xyz, r3.xyz));
  r13.y = saturate(dot(-r14.xyz, r3.xyz));
  r6.xw = log2(r13.xy);
  r6.xw = r6.xw * r0.zz;
  r6.xw = exp2(r6.xw);
  r12.xyz = r12.xyz * r6.www;
  r10.xyz = r10.xyz * r6.xxx + r12.xyz;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r10.xyz = r10.xyz * r9.xyz;
  r10.xyz = min(float3(1,1,1), r10.xyz);
  r11.xyz = r8.yyy ? r11.xyz : float3(0,0,0);
  r10.xyz = r8.yyy ? r10.xyz : float3(0,0,0);
  r7.xyzw = t14.Sample(s14_s, r7.xy).xyzw;
  r12.xyzw = float4(4,4,4,4) * r7.xyzw;
  r13.xyzw = r7.xyzw + r7.xyzw;
  r7.xyzw = r7.xyzw / cb1[0].zzzz;
  r7.xyzw = r8.wwww ? r13.xyzw : r7.xyzw;
  r7.xyzw = r8.zzzz ? r12.xyzw : r7.xyzw;
  r7.xyz = r11.xyz + r7.xyz;
  r8.yzw = r10.xyz + r7.www;
  r3.w = 1;
  r11.x = dot(cb2[80].xyzw, r3.xyzw);
  r11.y = dot(cb2[81].xyzw, r3.xyzw);
  r11.z = dot(cb2[82].xyzw, r3.xyzw);
  r11.w = dot(cb2[83].xyzw, r3.xyzw);
  r10.x = dot(r3.xyzw, r11.xyzw);
  r11.x = dot(cb2[84].xyzw, r3.xyzw);
  r11.y = dot(cb2[85].xyzw, r3.xyzw);
  r11.z = dot(cb2[86].xyzw, r3.xyzw);
  r11.w = dot(cb2[87].xyzw, r3.xyzw);
  r10.y = dot(r3.xyzw, r11.xyzw);
  r11.x = dot(cb2[88].xyzw, r3.xyzw);
  r11.y = dot(cb2[89].xyzw, r3.xyzw);
  r11.z = dot(cb2[90].xyzw, r3.xyzw);
  r11.w = dot(cb2[91].xyzw, r3.xyzw);
  r10.z = dot(r3.xyzw, r11.xyzw);
  r10.xyz = max(float3(0.0625,0.0625,0.0625), r10.xyz);
  r0.z = r3.y * 0.5 + 0.5;
  r11.xyz = -cb3[10].xyz + cb3[4].xyz;
  r11.xyz = r0.zzz * r11.xyz + cb3[10].xyz;
  r10.xyz = cb2[79].xxx * r10.xyz + r11.xyz;
  r11.xyz = cb3[0].xyz * r6.yyy;
  r6.xzw = cb3[1].xyz * r6.zzz;
  r12.xyz = r11.xyz * r0.www + r6.xzw;
  r12.xyz = r12.xyz + r10.xyz;
  r12.xyz = r12.xyz + r7.xyz;
  r13.xyzw = int4(64,0x8000,16,4) & asint(cb13[0].xxxx);
  r14.xyz = r12.xyz * r0.yyy;
  r0.z = r6.y * r0.w;
  r3.w = 1 + -r0.y;
  r0.z = r0.z * r3.w + r0.y;
  r12.xyz = r12.xyz * r0.zzz;
  r12.xyz = r13.xxx ? r12.xyz : r14.xyz;
  r5.xyz = r9.xyz * r5.xyz + r8.yzw;
  r2.xyz = r2.xyz * r2.www + float3(1,1,1);
  r2.xyz = saturate(float3(0.5,0.5,0.5) * r2.xyz);
  r2.xyz = cb9[11].yyy * r2.xyz;
  r2.xyz = cb9[11].xxx * r1.xyz + r2.xyz;
  r0.z = cb9[11].z * r0.x;
  r2.xyz = r0.zzz * r9.xyz + r2.xyz;
  r2.xyz = cb9[11].www * r5.xxx + r2.xyz;
  r2.xyz = cb9[12].xxx * r0.www + r2.xyz;
  r0.yzw = cb9[12].yyy * r0.yyy + r2.xyz;
  r2.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r2.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r9.xyz + r0.yzw;
  r2.w = dot(-r4.yzw, r3.xyz);
  r2.w = 1 + -r2.w;
  r3.x = r2.w * r2.w;
  r3.x = r3.x * r3.x;
  r2.w = r3.x * r2.w;
  r2.w = r2.w * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r2.www + r0.yzw;
  r0.yzw = cb9[13].www * r10.xyz + r0.yzw;
  r3.xyz = cb9[14].yyy * r2.xyz;
  r0.yzw = r3.xyz * r11.xyz + r0.yzw;
  r3.xyz = cb9[14].zzz * r2.xyz;
  r0.yzw = r3.xyz * r6.xzw + r0.yzw;
  r0.yzw = cb9[14].www * r7.xyz + r0.yzw;
  r3.xyz = cb9[15].xxx * r9.xyz;
  r0.yzw = r3.xyz * r5.xyz + r0.yzw;
  r3.xyz = cb9[15].yyy * r9.xyz;
  r0.yzw = r3.xyz * r5.xyz + r0.yzw;
  r0.yzw = saturate(cb9[15].zzz * r8.yzw + r0.yzw);
  r1.xyz = r12.xyz * r1.xyz;
  r3.xyz = r5.xyz * r0.xxx;
  r1.xyz = r1.xyz * r2.xyz + r3.xyz;
  r0.xyz = r13.yyy ? r0.yzw : r1.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r0.w = r1.w * r0.w;
  r1.w = r0.w * r10.w;
  r0.xyz = v0.xyz * r0.xyz;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r2.xyz + r2.xyz;
  r5.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.xyz * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r4.xyz * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r5.xyz / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MaterialPostTonemap(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r13.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r13.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v1.xyz + r0.xyz;
  r2.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r2.www * r3.xyz + r0.xyz;
  r0.xyz = r13.www ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r13.yyy ? r2.xyz : r0.xyz;
  r0.x = r0.w * r10.w + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r8.xxxx ? r1.xyzw : r0.xyzw;
  return;
}