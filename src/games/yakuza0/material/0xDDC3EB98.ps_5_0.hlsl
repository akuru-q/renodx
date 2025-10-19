#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Fri Oct 10 17:02:19 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t2.Sample(s2_s, v2.xy).xyz;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xy = t5.Sample(s5_s, v2.xy).xy;
  r0.w = t4.Sample(s4_s, v2.zw).x;
  r0.w = 1 + -r0.w;
  r0.w = -r0.w * r0.z + 1;
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
  r6.xy = cb7[6].xy * v2.xy;
  r6.xyzw = t7.Sample(s7_s, r6.xy).xyzw;
  r7.xyz = r6.xyz * r6.xyz;
  r6.xyz = -r6.xyz * r6.xyz + float3(1,1,1);
  r8.xy = float2(1,1) + -r0.zy;
  r6.xyz = r8.xxx * r6.xyz;
  r0.z = 1 + -r6.w;
  r6.xyz = r6.xyz * r0.zzz + r7.xyz;
  r1.xyz = r6.xyz * r1.xyz;
  r2.xyzw = r2.yxyz * r2.wwww + float4(0.100000001,1,1,1);
  r2.x = saturate(r2.x);
  r6.xy = cb7[6].wz + float2(2,2.5);
  r0.z = dot(-r4.yzw, v4.xyz);
  r0.z = saturate(1 + -r0.z);
  r5.w = dot(-r4.yzw, r3.xyz);
  r5.w = 1 + -r5.w;
  r6.z = saturate(r5.w);
  r0.z = r6.z * r0.z;
  r0.z = log2(r0.z);
  r6.x = r6.x * r0.z;
  r6.x = exp2(r6.x);
  r6.x = r6.x * r6.y;
  r6.x = r6.x * r2.x;
  r6.x = r6.x * r0.y;
  r7.xyzw = int4(4096,8,1,0x4000) & asint(cb13[0].xxxx);
  r0.z = cb9[9].w * r0.z;
  r0.z = exp2(r0.z);
  r0.z = cb9[9].z * r0.z;
  r0.z = r0.z * r2.x;
  r0.z = r0.z * r0.y;
  r0.z = r7.x ? r0.z : r6.x;
  r0.z = r0.z * cb9[2].x + 1;
  r1.xyz = r1.xyz * r0.zzz;
  r6.xy = cb12[29].zw * v8.xy;
  if (r7.y != 0) {
    r6.zw = t13.Sample(s13_s, r6.xy).xy;
  } else {
    r6.zw = float2(1,1);
  }
  r8.xz = r6.zw * cb1[12].xz + cb1[12].yw;
  r6.zw = r7.yy ? r8.xz : r6.zw;
  r0.z = min(r6.z, r6.w);
  r8.xzw = v3.xyz * r4.xxx + cb3[7].xyz;
  r2.x = dot(r8.xzw, r8.xzw);
  r2.x = rsqrt(r2.x);
  r8.xzw = r8.xzw * r2.xxx;
  r2.x = dot(r4.yzw, r3.xyz);
  r2.x = r2.x + r2.x;
  r9.xyz = r3.xyz * -r2.xxx + r4.yzw;
  r10.x = saturate(dot(r9.xyz, -cb3[6].xyz));
  r10.y = saturate(dot(r9.xyz, -cb3[7].xyz));
  r6.zw = log2(r10.xy);
  r6.zw = cb7[10].ww * r6.zw;
  r6.zw = exp2(r6.zw);
  r2.x = cb1[0].w * cb7[8].z;
  r7.x = cb7[10].w * 0.0397435986 + 0.0856831968;
  r6.zw = r7.xx * r6.zw;
  r5.x = dot(r4.yzw, r5.xyz);
  r5.y = dot(r4.yzw, r8.xzw);
  r4.yz = float2(1,1) + -r5.xy;
  r5.xy = r4.yz * r4.yz;
  r4.w = -cb7[8].z * cb1[0].w + 1;
  r5.xy = r5.xy * r5.xy;
  r5.xy = r5.xy * r4.ww;
  r4.yz = r5.xy * r4.yz + r2.xx;
  r4.yz = r6.zw * r4.yz;
  r5.x = dot(r3.xyz, -cb3[6].xyz);
  r2.x = saturate(r5.x);
  r2.x = r4.y * r2.x;
  r5.y = dot(r3.xyz, -cb3[7].xyz);
  r5.xyz = saturate(r5.yxy);
  r4.y = r5.x * r4.z;
  r8.xzw = cb6[1].xyz * cb7[10].xyz;
  r9.xyz = cb3[0].xyz * r2.xxx;
  r4.yzw = cb3[1].xyz * r4.yyy;
  r4.yzw = r9.xyz * r0.zzz + r4.yzw;
  r2.x = saturate(dot(r3.xyz, -v6.xyz));
  r9.x = v3.w;
  r9.y = v4.w;
  r9.z = v6.w;
  r10.xyz = r9.xyz * r2.xxx;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r2.x = saturate(dot(r3.xyz, -v7.xyz));
  r11.x = v0.w;
  r11.y = v1.w;
  r11.z = v7.w;
  r12.xyz = r11.xyz * r2.xxx;
  r12.xyz = max(float3(0,0,0), r12.xyz);
  r10.xyz = r12.xyz + r10.xyz;
  r12.xyz = v3.xyz * r4.xxx + v6.xyz;
  r2.x = dot(r12.xyz, r12.xyz);
  r2.x = rsqrt(r2.x);
  r12.xyz = r12.xyz * r2.xxx;
  r13.xyz = v3.xyz * r4.xxx + v7.xyz;
  r2.x = dot(r13.xyz, r13.xyz);
  r2.x = rsqrt(r2.x);
  r13.xyz = r13.xyz * r2.xxx;
  r12.x = saturate(dot(-r12.xyz, r3.xyz));
  r12.y = saturate(dot(-r13.xyz, r3.xyz));
  r6.zw = log2(r12.xy);
  r6.zw = cb7[10].ww * r6.zw;
  r6.zw = exp2(r6.zw);
  r11.xyz = r11.xyz * r6.www;
  r9.xyz = r9.xyz * r6.zzz + r11.xyz;
  r9.xyz = max(float3(0,0,0), r9.xyz);
  r9.xyz = r9.xyz * r8.xzw;
  r9.xyz = min(float3(1,1,1), r9.xyz);
  r10.xyz = r7.zzz ? r10.xyz : float3(0,0,0);
  r9.xyz = r7.zzz ? r9.xyz : float3(0,0,0);
  r6.xyzw = t14.Sample(s14_s, r6.xy).xyzw;
  r11.xyzw = float4(4,4,4,4) * r6.xyzw;
  r12.xyzw = int4(8192,64,0x8000,16) & asint(cb13[0].xxxx);
  r13.xyzw = r6.xyzw + r6.xyzw;
  r6.xyzw = r6.xyzw / cb1[0].zzzz;
  r6.xyzw = r12.xxxx ? r13.xyzw : r6.xyzw;
  r6.xyzw = r7.wwww ? r11.xyzw : r6.xyzw;
  r6.xyz = r10.xyz + r6.xyz;
  r7.xzw = r9.xyz + r6.www;
  r3.w = 1;
  r9.x = dot(cb2[80].xyzw, r3.xyzw);
  r9.y = dot(cb2[81].xyzw, r3.xyzw);
  r9.z = dot(cb2[82].xyzw, r3.xyzw);
  r9.w = dot(cb2[83].xyzw, r3.xyzw);
  r9.x = dot(r3.xyzw, r9.xyzw);
  r10.x = dot(cb2[84].xyzw, r3.xyzw);
  r10.y = dot(cb2[85].xyzw, r3.xyzw);
  r10.z = dot(cb2[86].xyzw, r3.xyzw);
  r10.w = dot(cb2[87].xyzw, r3.xyzw);
  r9.y = dot(r3.xyzw, r10.xyzw);
  r10.x = dot(cb2[88].xyzw, r3.xyzw);
  r10.y = dot(cb2[89].xyzw, r3.xyzw);
  r10.z = dot(cb2[90].xyzw, r3.xyzw);
  r10.w = dot(cb2[91].xyzw, r3.xyzw);
  r9.z = dot(r3.xyzw, r10.xyzw);
  r3.xzw = max(float3(0.0625,0.0625,0.0625), r9.xyz);
  r2.x = r3.y * 0.5 + 0.5;
  r9.xyz = -cb3[10].xyz + cb3[4].xyz;
  r9.xyz = r2.xxx * r9.xyz + cb3[10].xyz;
  r3.xyz = cb2[79].xxx * r3.xzw + r9.xyz;
  r9.xyz = cb3[0].xyz * r5.yyy;
  r10.xyz = cb3[1].xyz * r5.zzz;
  r11.xyz = r9.xyz * r0.zzz + r10.xyz;
  r11.xyz = r11.xyz + r3.xyz;
  r11.xyz = r11.xyz + r6.xyz;
  r13.xyz = r11.xyz * r0.yyy;
  r2.x = r5.y * r0.z;
  r2.x = r2.x * r8.y + r0.y;
  r5.xyz = r11.xyz * r2.xxx;
  r5.xyz = r12.yyy ? r5.xyz : r13.xyz;
  r5.xyz = r5.xyz * r0.www;
  r4.xyz = r8.xzw * r4.yzw + r7.xzw;
  r2.xyz = saturate(float3(0.5,0.5,0.5) * r2.yzw);
  r2.xyz = cb9[11].yyy * r2.xyz;
  r2.xyz = cb9[11].xxx * r1.xyz + r2.xyz;
  r0.w = cb9[11].z * r0.x;
  r2.xyz = r0.www * r8.xzw + r2.xyz;
  r2.xyz = cb9[11].www * r4.xxx + r2.xyz;
  r2.xyz = cb9[12].xxx * r0.zzz + r2.xyz;
  r0.yzw = cb9[12].yyy * r0.yyy + r2.xyz;
  r2.xyz = cb6[0].xyz * cb7[9].xyz;
  r0.yzw = cb9[13].xxx * r2.xyz + r0.yzw;
  r0.yzw = cb9[13].yyy * r8.xzw + r0.yzw;
  r2.w = r5.w * r5.w;
  r2.w = r2.w * r2.w;
  r2.w = r2.w * r5.w;
  r2.w = r2.w * 0.972222209 + 0.027777778;
  r0.yzw = cb9[13].zzz * r2.www + r0.yzw;
  r0.yzw = cb9[13].www * r3.xyz + r0.yzw;
  r3.xyz = cb9[14].yyy * r2.xyz;
  r0.yzw = r3.xyz * r9.xyz + r0.yzw;
  r3.xyz = cb9[14].zzz * r2.xyz;
  r0.yzw = r3.xyz * r10.xyz + r0.yzw;
  r0.yzw = cb9[14].www * r6.xyz + r0.yzw;
  r3.xyz = cb9[15].xxx * r8.xzw;
  r0.yzw = r3.xyz * r4.xyz + r0.yzw;
  r3.xyz = cb9[15].yyy * r8.xzw;
  r0.yzw = r3.xyz * r4.xyz + r0.yzw;
  r0.yzw = saturate(cb9[15].zzz * r7.xzw + r0.yzw);
  r1.xyz = r5.xyz * r1.xyz;
  r3.xyz = r4.xyz * r0.xxx;
  r1.xyz = r1.xyz * r2.xyz + r3.xyz;
  r0.xyz = r12.zzz ? r0.yzw : r1.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r1.w = r1.w * r0.w;
  r0.xyz = v0.xyz * r0.xyz;
  r2.xyz = cb1[0].xxx * r0.xyz;

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
  r0.xyz = r12.zzz ? r0.xyz : r2.xyz;
  r0.xyz = r12.www ? r3.xyz : r0.xyz;
  r0.w = 4 & asint(cb13[0].x);
  r2.xyz = v1.xyz + r0.xyz;
  r2.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r2.www * r3.xyz + r0.xyz;
  r0.xyz = r0.www ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r12.zzz ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.yyyy ? r1.xyzw : r0.xyzw;
  return;
}