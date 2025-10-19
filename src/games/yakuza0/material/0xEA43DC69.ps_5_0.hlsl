#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:20 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float v8 : TEXCOORD6,
  float4 v9 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t0.Sample(s0_s, v2.xy).xyw;
  r0.y = r0.y * r0.y;
  r0.x = -0.498039216 + r0.x;
  r1.xy = t5.Sample(s5_s, v2.xy).xy;
  r2.y = r0.x * 0.25 + -0.0019607842;
  r2.xw = float2(0,1);
  r0.xw = float2(0.5,0.5) * r2.xy + float2(0.5,0.5);
  r1.zw = cmp(r1.xy < float2(0.5,0.5));
  r2.y = r1.y * r0.w;
  r2.x = r1.x;
  r2.xy = float2(1,2) * r2.xy;
  r1.xy = float2(1,1) + -r1.xy;
  r1.xy = r1.xy + r1.xy;
  r0.xw = float2(1,1) + -r0.xw;
  r0.xw = -r1.xy * r0.xw + float2(1,1);
  r0.xw = r1.zw ? r2.xy : r0.xw;
  r0.xw = r0.xw * float2(2,2) + float2(-1,-1);
  r1.x = dot(r0.xw, r0.xw);
  r1.x = 1 + -r1.x;
  r1.x = max(0, r1.x);
  r1.x = sqrt(r1.x);
  r1.yzw = v5.yzx * v4.zxy;
  r1.yzw = v4.yzx * v5.zxy + -r1.yzw;
  r1.yzw = v5.www * r1.yzw;
  r2.xyz = v5.xyz * r0.xxx;
  r1.yzw = r0.www * r1.yzw + r2.xyz;
  r1.xyz = r1.xxx * v4.xyz + r1.yzw;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r2.xyz = r1.xyz * r0.xxx;
  r0.w = dot(v3.xyz, v3.xyz);
  r0.w = rsqrt(r0.w);
  r3.xyz = v3.xyz * r0.www;
  r4.xyz = v3.xyz * r0.www + cb3[6].xyz;
  r1.w = dot(r4.xyz, r4.xyz);
  r1.w = rsqrt(r1.w);
  r4.xyz = r4.xyz * r1.www;
  r5.xy = cb12[29].zw * v9.xy;
  r6.xyzw = int4(8,1,0x4000,8192) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r5.zw = t13.Sample(s13_s, r5.xy).xy;
  } else {
    r5.zw = float2(1,1);
  }
  r7.xy = r5.zw * cb1[12].xz + cb1[12].yw;
  r5.zw = r6.xx ? r7.xy : r5.zw;
  r1.w = min(r5.z, r5.w);
  r7.xyz = v3.xyz * r0.www + cb3[7].xyz;
  r0.w = dot(r7.xyz, r7.xyz);
  r0.w = rsqrt(r0.w);
  r7.xyz = r7.xyz * r0.www;
  r8.xyz = v5.yzx * r2.zxy;
  r8.xyz = r2.yzx * v5.zxy + -r8.xyz;
  r8.xyz = v5.www * r8.xyz;
  r9.xyz = r8.zxy * r2.yzx;
  r9.xyz = r8.yzx * r2.zxy + -r9.xyz;
  r10.x = dot(r2.xyz, -r4.xyz);
  r0.w = dot(-r4.xyz, r8.xyz);
  r0.w = v2.z * r0.w;
  r10.y = r0.w * 0.200000003 + 0.5;
  r0.w = t7.Sample(s7_s, r10.xy).x;
  r3.w = dot(-r4.xyz, r9.xyz);
  r3.w = v2.w * r3.w;
  r10.z = r3.w * 0.200000003 + 0.5;
  r3.w = t7.Sample(s7_s, r10.xz).x;
  r0.w = r3.w * r0.w;
  r10.x = dot(r2.xyz, -r7.xyz);
  r3.w = dot(-r7.xyz, r8.xyz);
  r3.w = v2.z * r3.w;
  r10.y = r3.w * 0.200000003 + 0.5;
  r3.w = t7.Sample(s7_s, r10.xy).x;
  r4.w = dot(-r7.xyz, r9.xyz);
  r4.w = v2.w * r4.w;
  r10.z = r4.w * 0.200000003 + 0.5;
  r4.w = t7.Sample(s7_s, r10.xz).x;
  r3.w = r4.w * r3.w;
  r8.x = log2(r0.w);
  r8.y = log2(r3.w);
  r8.xy = cb7[10].ww * r8.xy;
  r8.xy = exp2(r8.xy);
  r0.w = cb1[0].w * cb7[8].z;
  r3.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r8.xy = r8.xy * r3.ww;
  r4.x = dot(r3.xyz, r4.xyz);
  r4.y = dot(r3.xyz, r7.xyz);
  r4.xy = float2(1,1) + -r4.xy;
  r4.zw = r4.xy * r4.xy;
  r3.w = -cb7[8].z * cb1[0].w + 1;
  r4.zw = r4.zw * r4.zw;
  r4.zw = r4.zw * r3.ww;
  r4.xy = r4.zw * r4.xy + r0.ww;
  r4.xy = r8.xy * r4.xy;
  r7.xyz = cb6[1].xyz * cb7[10].xyz;
  r4.xzw = cb3[0].xyz * r4.xxx;
  r8.xyz = cb3[1].xyz * r4.yyy;
  r4.xyz = r4.xzw * r1.www + r8.xyz;
  r4.xyz = r7.xyz * r4.xyz;
  r0.w = max(r0.y, r0.y);
  r0.w = max(r0.w, r0.y);
  r3.w = min(r0.y, r0.y);
  r0.y = min(r3.w, r0.y);
  r0.y = r0.y + r0.w;
  r0.w = 0.5 * r0.y;
  r3.w = cb2[10].z + cb2[10].z;
  r4.w = cb2[10].z * 2 + -1;
  r7.w = cmp(0 < r4.w);
  r8.x = r7.w ? 1.000000 : 0;
  r0.y = -r0.y * 0.5 + 1;
  r4.w = 1 + -r4.w;
  r0.y = -r0.y * r4.w + 1;
  r0.w = r3.w * r0.w;
  r3.w = r7.w ? 0 : 1;
  r0.w = r3.w * r0.w;
  r8.xyz = r0.yyy * r8.xxx + r0.www;
  r0.y = cmp(0 < cb2[10].y);
  if (r0.y != 0) {
    r0.y = cmp(r8.z < 0.5);
    r9.xyz = cb2[10].yxx + float3(1,0.333333343,-0.333333343);
    r0.w = r9.x * r8.z;
    r3.w = cb2[10].y + r8.z;
    r3.w = -cb2[10].y * r8.z + r3.w;
    r0.y = r0.y ? r0.w : r3.w;
    r0.w = r8.z * 2 + -r0.y;
    r9.xy = frac(r9.yz);
    r3.w = r0.y + -r0.w;
    r4.w = 6 * r3.w;
    r9.zw = r4.ww * r9.xy + r0.ww;
    r10.xyzw = cmp(r9.xxxy < float4(0.166666672,0.5,0.666666687,0.166666672));
    r11.xy = float2(0.666666687,0.666666687) + -r9.xy;
    r11.xy = r11.xy * r3.ww;
    r11.xy = r11.xy * float2(6,6) + r0.ww;
    r7.w = r10.z ? r11.x : r0.w;
    r7.w = r10.y ? r0.y : r7.w;
    r8.x = r10.x ? r9.z : r7.w;
    r7.w = frac(cb2[10].x);
    r4.w = r4.w * r7.w + r0.w;
    r10.xyz = cmp(r7.www < float3(0.166666672,0.5,0.666666687));
    r7.w = 0.666666687 + -r7.w;
    r3.w = r7.w * r3.w;
    r3.w = r3.w * 6 + r0.w;
    r3.w = r10.z ? r3.w : r0.w;
    r3.w = r10.y ? r0.y : r3.w;
    r8.y = r10.x ? r4.w : r3.w;
    r9.xy = cmp(r9.yy < float2(0.5,0.666666687));
    r0.w = r9.y ? r11.y : r0.w;
    r0.y = r9.x ? r0.y : r0.w;
    r8.z = r10.w ? r9.w : r0.y;
  }
  r0.y = saturate(dot(r2.xyz, -v6.xyz));
  r9.x = v3.w;
  r9.y = v4.w;
  r9.z = v6.w;
  r9.xyz = r9.xyz * r0.yyy;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r0.y = saturate(dot(r2.xyz, -v7.xyz));
  r10.x = v0.w;
  r10.y = v1.w;
  r10.z = v7.w;
  r10.xyz = r10.xyz * r0.yyy;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r9.xyz = r10.xyz + r9.xyz;
  r9.xyz = r6.yyy ? r9.xyz : float3(0,0,0);
  r10.xyz = t14.Sample(s14_s, r5.xy).xyz;
  r11.xyz = float3(4,4,4) * r10.xyz;
  r12.xyz = r10.xyz + r10.xyz;
  r10.xyz = r10.xyz / cb1[0].zzz;
  r10.xyz = r6.www ? r12.xyz : r10.xyz;
  r6.yzw = r6.zzz ? r11.xyz : r10.xyz;
  r6.yzw = r9.xyz + r6.yzw;
  r9.x = dot(cb2[80].xyzw, r2.xyzw);
  r9.y = dot(cb2[81].xyzw, r2.xyzw);
  r9.z = dot(cb2[82].xyzw, r2.xyzw);
  r9.w = dot(cb2[83].xyzw, r2.xyzw);
  r9.x = dot(r2.xyzw, r9.xyzw);
  r10.x = dot(cb2[84].xyzw, r2.xyzw);
  r10.y = dot(cb2[85].xyzw, r2.xyzw);
  r10.z = dot(cb2[86].xyzw, r2.xyzw);
  r10.w = dot(cb2[87].xyzw, r2.xyzw);
  r9.y = dot(r2.xyzw, r10.xyzw);
  r10.x = dot(cb2[88].xyzw, r2.xyzw);
  r10.y = dot(cb2[89].xyzw, r2.xyzw);
  r10.z = dot(cb2[90].xyzw, r2.xyzw);
  r10.w = dot(cb2[91].xyzw, r2.xyzw);
  r9.z = dot(r2.xyzw, r10.xyzw);
  r9.xyz = max(float3(0.0625,0.0625,0.0625), r9.xyz);
  r0.y = saturate(dot(r2.xyz, -cb3[6].xyz));
  r0.w = saturate(dot(r2.xyz, -cb3[7].xyz));
  r2.w = r2.y * 0.5 + 0.5;
  r10.xyz = -cb3[10].xyz + cb3[4].xyz;
  r10.xyz = r2.www * r10.xyz + cb3[10].xyz;
  r9.xyz = cb2[79].xxx * r9.xyz + r10.xyz;
  r10.xyz = cb3[0].xyz * r0.yyy;
  r11.xyz = cb3[1].xyz * r0.www;
  r12.xyz = r10.xyz * r1.www + r11.xyz;
  r12.xyz = r12.xyz + r9.xyz;
  r12.xyz = r12.xyz + r6.yzw;
  r13.xyz = int3(0x8000,16,4) & asint(cb13[0].xxx);
  r0.xyw = r1.xyz * r0.xxx + float3(1,1,1);
  r0.xyw = saturate(float3(0.5,0.5,0.5) * r0.xyw);
  r0.xyw = cb9[11].yyy * r0.xyw;
  r0.xyw = cb9[11].xxx * r8.xyz + r0.xyw;
  r0.xyw = cb9[11].zzz * r7.xyz + r0.xyw;
  r0.xyw = cb9[11].www * r4.xxx + r0.xyw;
  r0.xyw = cb9[12].xxx * r5.zzz + r0.xyw;
  r0.xyw = cb9[12].yyy * r5.www + r0.xyw;
  r1.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.xyw = cb9[13].xxx * r1.xyz + r0.xyw;
  r0.xyw = cb9[13].yyy * r7.xyz + r0.xyw;
  r1.w = dot(-r3.xyz, r2.xyz);
  r1.w = 1 + -r1.w;
  r2.x = r1.w * r1.w;
  r2.x = r2.x * r2.x;
  r1.w = r2.x * r1.w;
  r1.w = r1.w * 0.972222209 + 0.027777778;
  r0.xyw = cb9[13].zzz * r1.www + r0.xyw;
  r0.xyw = cb9[13].www * r9.xyz + r0.xyw;
  r2.xyz = cb9[14].yyy * r1.xyz;
  r0.xyw = r2.xyz * r10.xyz + r0.xyw;
  r2.xyz = cb9[14].zzz * r1.xyz;
  r0.xyw = r2.xyz * r11.xyz + r0.xyw;
  r0.xyw = cb9[14].www * r6.yzw + r0.xyw;
  r2.xyz = cb9[15].xxx * r7.xyz;
  r0.xyw = r2.xyz * r4.xyz + r0.xyw;
  r2.xyz = cb9[15].yyy * r7.xyz;
  r0.xyw = saturate(r2.xyz * r4.xyz + r0.xyw);
  r2.xyz = r12.xyz * r8.xyz;
  r1.xyz = r2.xyz * r1.xyz + r4.xyz;
  r0.xyw = r13.xxx ? r0.xyw : r1.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r0.z = r1.x * r0.z;
  r1.w = cb2[10].w * r0.z;
  r0.xyw = v0.xyz * r0.xyw;
  r2.xyz = cb1[0].xxx * r0.xyw;

  MarkerFunction1(r2.xyz, cb1[0].x);

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

  MarkerFunction2(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyw = r13.xxx ? r0.xyw : r2.xyz;
  r0.xyw = r13.yyy ? r3.xyz : r0.xyw;
  r2.xyz = v1.xyz + r0.xyw;
  r2.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyw;
  r0.xyw = r2.www * r3.xyz + r0.xyw;
  r0.xyw = r13.zzz ? r2.xyz : r0.xyw;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyw;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r13.xxx ? r2.xyz : r0.xyw;
  r0.x = r0.z * cb2[10].w + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r6.xxxx ? r1.xyzw : r0.xyzw;
  return;
}