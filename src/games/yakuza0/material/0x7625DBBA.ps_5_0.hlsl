#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:58 2025
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
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t0.Sample(s0_s, v2.xy).xyw;
  r0.y = r0.y * r0.y;
  r0.x = -0.498039216 + r0.x;
  r1.xy = t5.Sample(s5_s, v2.xy).xy;
  r2.xyz = cb9[3].xyz * r0.yyy;
  r0.y = r0.x * 0.25 + -0.0019607842;
  r0.x = 0;
  r0.xy = float2(0.5,0.5) * r0.xy + float2(0.5,0.5);
  r1.zw = cmp(r1.xy < float2(0.5,0.5));
  r3.y = r1.y * r0.y;
  r3.x = r1.x;
  r3.xy = float2(1,2) * r3.xy;
  r1.xy = float2(1,1) + -r1.xy;
  r1.xy = r1.xy + r1.xy;
  r0.xy = float2(1,1) + -r0.xy;
  r0.xy = -r1.xy * r0.xy + float2(1,1);
  r0.xy = r1.zw ? r3.xy : r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r0.xy, r0.xy);
  r0.w = 1 + -r0.w;
  r0.w = max(0, r0.w);
  r0.w = sqrt(r0.w);
  r1.xyz = v5.yzx * v4.zxy;
  r1.xyz = v4.yzx * v5.zxy + -r1.xyz;
  r1.xyz = v5.www * r1.xyz;
  r3.xyz = v5.xyz * r0.xxx;
  r1.xyz = r0.yyy * r1.xyz + r3.xyz;
  r0.xyw = r0.www * v4.xyz + r1.xyz;
  r1.x = dot(r0.xyw, r0.xyw);
  r1.x = rsqrt(r1.x);
  r3.xyz = r1.xxx * r0.xyw;
  r1.y = dot(v3.xyz, v3.xyz);
  r1.y = rsqrt(r1.y);
  r4.xyz = v3.xyz * r1.yyy;
  r5.xyz = v3.xyz * r1.yyy + cb3[6].xyz;
  r1.z = dot(r5.xyz, r5.xyz);
  r1.z = rsqrt(r1.z);
  r5.xyz = r5.xyz * r1.zzz;
  r6.xyzw = r0.yxyw * r1.xxxx + float4(0.100000001,1,1,1);
  r6.x = saturate(r6.x);
  r0.xy = cb7[6].wz + float2(2,2.5);
  r0.w = dot(-r4.xyz, v4.xyz);
  r0.w = saturate(1 + -r0.w);
  r1.x = dot(-r4.xyz, r3.xyz);
  r1.x = 1 + -r1.x;
  r1.z = saturate(r1.x);
  r0.w = r1.z * r0.w;
  r0.w = log2(r0.w);
  r0.x = r0.x * r0.w;
  r0.x = exp2(r0.x);
  r0.x = r0.x * r0.y;
  r7.xyzw = int4(4096,8,1,0x4000) & asint(cb13[0].xxxx);
  r0.y = cb9[9].w * r0.w;
  r0.y = exp2(r0.y);
  r0.y = cb9[9].z * r0.y;
  r0.xy = r0.xy * r6.xx;
  r0.x = r7.x ? r0.y : r0.x;
  r0.x = r0.x * cb9[2].x + 1;
  r0.xyw = r2.xyz * r0.xxx;
  r1.zw = cb12[29].zw * v8.xy;
  if (r7.y != 0) {
    r2.xy = t13.Sample(s13_s, r1.zw).xy;
  } else {
    r2.xy = float2(1,1);
  }
  r2.zw = r2.xy * cb1[12].xz + cb1[12].yw;
  r2.xy = r7.yy ? r2.zw : r2.xy;
  r2.z = min(r2.x, r2.y);
  r8.xyz = v3.xyz * r1.yyy + cb3[7].xyz;
  r1.y = dot(r8.xyz, r8.xyz);
  r1.y = rsqrt(r1.y);
  r8.xyz = r8.xyz * r1.yyy;
  r9.xyz = v5.yzx * r3.zxy;
  r9.xyz = r3.yzx * v5.zxy + -r9.xyz;
  r9.xyz = v5.www * r9.xyz;
  r10.xyz = r9.zxy * r3.yzx;
  r10.xyz = r9.yzx * r3.zxy + -r10.xyz;
  r11.x = dot(r3.xyz, -r5.xyz);
  r1.y = dot(-r5.xyz, r9.xyz);
  r1.y = v2.z * r1.y;
  r11.y = r1.y * 0.200000003 + 0.5;
  r1.y = t7.Sample(s7_s, r11.xy).x;
  r2.w = dot(-r5.xyz, r10.xyz);
  r2.w = v2.w * r2.w;
  r11.z = r2.w * 0.200000003 + 0.5;
  r2.w = t7.Sample(s7_s, r11.xz).x;
  r1.y = r2.w * r1.y;
  r11.x = dot(r3.xyz, -r8.xyz);
  r2.w = dot(-r8.xyz, r9.xyz);
  r2.w = v2.z * r2.w;
  r11.y = r2.w * 0.200000003 + 0.5;
  r2.w = t7.Sample(s7_s, r11.xy).x;
  r4.w = dot(-r8.xyz, r10.xyz);
  r4.w = v2.w * r4.w;
  r11.z = r4.w * 0.200000003 + 0.5;
  r4.w = t7.Sample(s7_s, r11.xz).x;
  r2.w = r4.w * r2.w;
  r9.x = log2(r1.y);
  r9.y = log2(r2.w);
  r9.xy = cb7[10].ww * r9.xy;
  r9.xy = exp2(r9.xy);
  r1.y = cb1[0].w * cb7[8].z;
  r2.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r9.xy = r9.xy * r2.ww;
  r5.x = dot(r4.xyz, r5.xyz);
  r5.y = dot(r4.xyz, r8.xyz);
  r4.xy = float2(1,1) + -r5.xy;
  r4.zw = r4.xy * r4.xy;
  r2.w = -cb7[8].z * cb1[0].w + 1;
  r4.zw = r4.zw * r4.zw;
  r4.zw = r4.zw * r2.ww;
  r4.xy = r4.zw * r4.xy + r1.yy;
  r4.xy = r9.xy * r4.xy;
  r5.xyz = cb6[1].xyz * cb7[10].xyz;
  r4.xzw = cb3[0].xyz * r4.xxx;
  r8.xyz = cb3[1].xyz * r4.yyy;
  r4.xyz = r4.xzw * r2.zzz + r8.xyz;
  r4.xyz = r5.xyz * r4.xyz;
  r1.y = saturate(dot(r3.xyz, -v6.xyz));
  r8.x = v3.w;
  r8.y = v4.w;
  r8.z = v6.w;
  r8.xyz = r8.xyz * r1.yyy;
  r8.xyz = max(float3(0,0,0), r8.xyz);
  r1.y = saturate(dot(r3.xyz, -v7.xyz));
  r9.x = v0.w;
  r9.y = v1.w;
  r9.z = v7.w;
  r9.xyz = r9.xyz * r1.yyy;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r8.xyz = r9.xyz + r8.xyz;
  r8.xyz = r7.zzz ? r8.xyz : float3(0,0,0);
  r1.yzw = t14.Sample(s14_s, r1.zw).xyz;
  r9.xyz = float3(4,4,4) * r1.yzw;
  r10.xyzw = int4(8192,0x8000,16,4) & asint(cb13[0].xxxx);
  r11.xyz = r1.yzw + r1.yzw;
  r1.yzw = r1.yzw / cb1[0].zzz;
  r1.yzw = r10.xxx ? r11.xyz : r1.yzw;
  r1.yzw = r7.www ? r9.xyz : r1.yzw;
  r1.yzw = r8.xyz + r1.yzw;
  r3.w = 1;
  r8.x = dot(cb2[80].xyzw, r3.xyzw);
  r8.y = dot(cb2[81].xyzw, r3.xyzw);
  r8.z = dot(cb2[82].xyzw, r3.xyzw);
  r8.w = dot(cb2[83].xyzw, r3.xyzw);
  r8.x = dot(r3.xyzw, r8.xyzw);
  r9.x = dot(cb2[84].xyzw, r3.xyzw);
  r9.y = dot(cb2[85].xyzw, r3.xyzw);
  r9.z = dot(cb2[86].xyzw, r3.xyzw);
  r9.w = dot(cb2[87].xyzw, r3.xyzw);
  r8.y = dot(r3.xyzw, r9.xyzw);
  r9.x = dot(cb2[88].xyzw, r3.xyzw);
  r9.y = dot(cb2[89].xyzw, r3.xyzw);
  r9.z = dot(cb2[90].xyzw, r3.xyzw);
  r9.w = dot(cb2[91].xyzw, r3.xyzw);
  r8.z = dot(r3.xyzw, r9.xyzw);
  r7.xzw = max(float3(0.0625,0.0625,0.0625), r8.xyz);
  r2.w = saturate(dot(r3.xyz, -cb3[6].xyz));
  r3.x = saturate(dot(r3.xyz, -cb3[7].xyz));
  r3.y = r3.y * 0.5 + 0.5;
  r8.xyz = -cb3[10].xyz + cb3[4].xyz;
  r3.yzw = r3.yyy * r8.xyz + cb3[10].xyz;
  r3.yzw = cb2[79].xxx * r7.xzw + r3.yzw;
  r7.xzw = cb3[0].xyz * r2.www;
  r8.xyz = cb3[1].xyz * r3.xxx;
  r9.xyz = r7.xzw * r2.zzz + r8.xyz;
  r9.xyz = r9.xyz + r3.yzw;
  r9.xyz = r9.xyz + r1.yzw;
  r6.xyz = saturate(float3(0.5,0.5,0.5) * r6.yzw);
  r6.xyz = cb9[11].yyy * r6.xyz;
  r6.xyz = cb9[11].xxx * r0.xyw + r6.xyz;
  r6.xyz = cb9[11].zzz * r5.xyz + r6.xyz;
  r6.xyz = cb9[11].www * r4.xxx + r6.xyz;
  r2.xzw = cb9[12].xxx * r2.xxx + r6.xyz;
  r2.xyz = cb9[12].yyy * r2.yyy + r2.xzw;
  r6.xyz = cb6[0].xyz * cb7[9].xyz;
  r2.xyz = cb9[13].xxx * r6.xyz + r2.xyz;
  r2.xyz = cb9[13].yyy * r5.xyz + r2.xyz;
  r2.w = r1.x * r1.x;
  r2.w = r2.w * r2.w;
  r1.x = r2.w * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r2.xyz = cb9[13].zzz * r1.xxx + r2.xyz;
  r2.xyz = cb9[13].www * r3.yzw + r2.xyz;
  r3.xyz = cb9[14].yyy * r6.xyz;
  r2.xyz = r3.xyz * r7.xzw + r2.xyz;
  r3.xyz = cb9[14].zzz * r6.xyz;
  r2.xyz = r3.xyz * r8.xyz + r2.xyz;
  r1.xyz = cb9[14].www * r1.yzw + r2.xyz;
  r2.xyz = cb9[15].xxx * r5.xyz;
  r1.xyz = r2.xyz * r4.xyz + r1.xyz;
  r2.xyz = cb9[15].yyy * r5.xyz;
  r1.xyz = saturate(r2.xyz * r4.xyz + r1.xyz);
  r0.xyw = r9.xyz * r0.xyw;
  r0.xyw = r0.xyw * r6.xyz + r4.xyz;
  r0.xyw = r10.yyy ? r1.xyz : r0.xyw;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r2.w = r1.x * r0.z;
  r0.xyw = v0.xyz * r0.xyw;
  r1.yzw = cb1[0].xxx * r0.xyw;

  MaterialPreTonemap(r1.yzw, cb1[0].x);

  r3.xyz = log2(r1.yzw);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r1.yzw + r1.yzw;
  r5.xyz = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.xyz = r4.xyz * r5.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r1.yzw = r1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r1.yzw = r4.xyz * r1.yzw + float3(0.0599999987,0.0599999987,0.0599999987);
  r1.yzw = r5.xyz / r1.yzw;
  r1.yzw = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r1.yzw;
  r1.yzw = saturate(float3(1.37906432,1.37906432,1.37906432) * r1.yzw);

  MaterialPostTonemap(r1.yzw);

  r1.yzw = sqrt(r1.yzw);
  r0.xyw = r10.yyy ? r0.xyw : r1.yzw;
  r0.xyw = r10.zzz ? r3.xyz : r0.xyw;
  r1.yzw = v1.xyz + r0.xyw;
  r3.x = saturate(v1.x);
  r3.yzw = cb1[1].xyz + -r0.xyw;
  r0.xyw = r3.xxx * r3.yzw + r0.xyw;
  r0.xyw = r10.www ? r1.yzw : r0.xyw;
  r1.yzw = cb9[12].zzz * cb9[3].xyz + r0.xyw;
  r1.yzw = cb9[12].www * v0.xyz + r1.yzw;
  r2.xyz = r10.yyy ? r1.yzw : r0.xyw;
  r0.x = r0.z * r1.x + -cb7[8].x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r2.xyzw;
  o0.xyzw = r7.yyyy ? r2.xyzw : r0.xyzw;
  return;
}