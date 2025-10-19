#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:58 2025
Texture2D<float4> t13 : register(t13);

TextureCube<float4> t1 : register(t1);

SamplerState s13_s : register(s13);

SamplerState s1_s : register(s1);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v4.xyz, v4.xyz);
  r0.x = rsqrt(r0.x);
  r1.xyz = v4.xyz * r0.xxx;
  r0.y = dot(v5.xyz, v5.xyz);
  r0.y = rsqrt(r0.y);
  r0.yzw = v5.xyz * r0.yyy;
  r2.xyz = cb9[4].xyz + v3.xyz;
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.xyz = cb9[5].xyz + v3.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = rsqrt(r2.w);
  r3.xyz = r3.xyz * r2.www;
  r2.w = dot(r0.yzw, r1.xyz);
  r2.w = r2.w + r2.w;
  r4.xyz = r1.xyz * -r2.www + r0.yzw;
  r2.w = dot(r4.xyz, r4.xyz);
  r2.w = rsqrt(r2.w);
  r4.xyz = r4.xyz * r2.www;
  r4.xyz = float3(-1,1,1) * r4.xyz;
  r4.xyzw = t1.Sample(s1_s, r4.xyz).xyzw;
  r2.w = max(0.00392156886, r4.w);
  r2.w = 0.25 / r2.w;
  r4.xyz = r4.xyz * r2.www;
  r4.xyz = r4.xyz * r4.xyz;
  r4.xyz = cb9[6].www * r4.xyz;
  r5.xyzw = int4(8,1,0x8000,16) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r6.xy = cb12[29].zw * v8.xy;
    r6.xy = t13.Sample(s13_s, r6.xy).xy;
  } else {
    r6.xy = float2(1,1);
  }
  r6.zw = r6.xy * cb1[12].xz + cb1[12].yw;
  r6.xy = r5.xx ? r6.zw : r6.xy;
  r2.w = min(r6.x, r6.y);
  r6.zw = cb9[6].xy * cb7[10].ww;
  r2.x = saturate(dot(-r2.xyz, r1.xyz));
  r2.x = log2(r2.x);
  r2.x = r6.z * r2.x;
  r2.x = exp2(r2.x);
  r7.xyz = cb6[1].xyz * cb7[10].xyz;
  r8.xyz = cb9[4].www * r7.xyz;
  r2.xyz = r8.xyz * r2.xxx;
  r3.x = saturate(dot(-r3.xyz, r1.xyz));
  r3.x = log2(r3.x);
  r3.x = r6.w * r3.x;
  r3.x = exp2(r3.x);
  r3.yzw = cb9[5].www * r7.xyz;
  r3.xyz = r3.xxx * r3.yzw;
  r3.xyz = cb3[0].xyz * r3.xyz;
  r2.xyz = saturate(r2.xyz * cb3[0].xyz + r3.xyz);
  r3.x = saturate(dot(r1.xyz, -v6.xyz));
  r8.x = v3.w;
  r8.y = v4.w;
  r8.z = v6.w;
  r3.xyz = r8.xyz * r3.xxx;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r3.w = saturate(dot(r1.xyz, -v7.xyz));
  r8.x = v0.w;
  r8.y = v1.w;
  r8.z = v7.w;
  r8.xyz = r8.xyz * r3.www;
  r8.xyz = max(float3(0,0,0), r8.xyz);
  r3.xyz = r8.xyz + r3.xyz;
  r3.xyz = r5.yyy ? r3.xyz : float3(0,0,0);
  r1.w = 1;
  r8.x = dot(cb2[80].xyzw, r1.xyzw);
  r8.y = dot(cb2[81].xyzw, r1.xyzw);
  r8.z = dot(cb2[82].xyzw, r1.xyzw);
  r8.w = dot(cb2[83].xyzw, r1.xyzw);
  r8.x = dot(r1.xyzw, r8.xyzw);
  r9.x = dot(cb2[84].xyzw, r1.xyzw);
  r9.y = dot(cb2[85].xyzw, r1.xyzw);
  r9.z = dot(cb2[86].xyzw, r1.xyzw);
  r9.w = dot(cb2[87].xyzw, r1.xyzw);
  r8.y = dot(r1.xyzw, r9.xyzw);
  r9.x = dot(cb2[88].xyzw, r1.xyzw);
  r9.y = dot(cb2[89].xyzw, r1.xyzw);
  r9.z = dot(cb2[90].xyzw, r1.xyzw);
  r9.w = dot(cb2[91].xyzw, r1.xyzw);
  r8.z = dot(r1.xyzw, r9.xyzw);
  r8.xyz = max(float3(0.0625,0.0625,0.0625), r8.xyz);
  r2.xyz = v2.zzz * r2.xyz;
  r1.w = saturate(dot(r1.xyz, -cb3[6].xyz));
  r3.w = saturate(dot(r1.xyz, -cb3[7].xyz));
  r4.w = r1.y * 0.5 + 0.5;
  r9.xyz = -cb3[10].xyz + cb3[4].xyz;
  r9.xyz = r4.www * r9.xyz + cb3[10].xyz;
  r8.xyz = cb2[79].xxx * r8.xyz + r9.xyz;
  r9.xyz = cb3[0].xyz * r1.www;
  r10.xyz = cb3[1].xyz * r3.www;
  r11.xyz = r9.xyz * r2.www + r10.xyz;
  r11.xyz = r11.xyz + r8.xyz;
  r11.xyz = r11.xyz + r3.xyz;
  r1.w = max(r11.x, r11.y);
  r1.w = max(r1.w, r11.z);
  r1.w = saturate(cb9[6].z + r1.w);
  r2.xyw = r2.yzx * r1.www;
  r12.xyz = v4.xyz * r0.xxx + float3(1,1,1);
  r12.xyz = saturate(float3(0.5,0.5,0.5) * r12.xyz);
  r12.xyz = cb9[11].yyy * r12.xyz;
  r12.xyz = cb9[11].xxx * r4.xyz + r12.xyz;
  r12.xyz = cb9[11].zzz * r7.xyz + r12.xyz;
  r12.xyz = cb9[11].www * r2.www + r12.xyz;
  r6.xzw = cb9[12].xxx * r6.xxx + r12.xyz;
  r6.xyz = cb9[12].yyy * r6.yyy + r6.xzw;
  r12.xyz = cb6[0].xyz * cb7[9].xyz;
  r6.xyz = cb9[13].xxx * r12.xyz + r6.xyz;
  r6.xyz = cb9[13].yyy * r7.xyz + r6.xyz;
  r0.x = dot(-r0.yzw, r1.xyz);
  r0.x = 1 + -r0.x;
  r0.y = r0.x * r0.x;
  r0.y = r0.y * r0.y;
  r0.x = r0.y * r0.x;
  r0.x = r0.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r0.xxx + r6.xyz;
  r0.xyz = cb9[13].www * r8.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r12.xyz;
  r0.xyz = r1.xyz * r9.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r12.xyz;
  r0.xyz = r1.xyz * r10.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r3.xyz + r0.xyz;
  r1.xyz = cb9[15].xxx * r7.xyz;
  r0.xyz = r1.xyz * r2.wxy + r0.xyz;
  r1.xyz = cb9[15].yyy * r7.xyz;
  r0.xyz = saturate(r1.xyz * r2.wxy + r0.xyz);
  r1.xyz = r11.xyz * r4.xyz;
  r2.xyz = r1.xyz * r12.xyz + r2.wxy;
  r0.w = 1;
  r0.xyzw = r5.zzzz ? r0.wxyz : r2.wxyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.y = cb6[0].w * r1.x;
  r1.x = -r1.x * cb6[0].w + 1;
  r0.x = saturate(r0.x);
  r1.w = r1.x * r0.x + r1.y;
  r0.xyz = v0.xyz * r0.yzw;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MarkerFunction1(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r2.xyz + r2.xyz;
  r6.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r6.xyz = r4.xyz * r6.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r4.xyz * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r6.xyz / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MarkerFunction2(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r5.zzz ? r0.xyz : r2.xyz;
  r0.xyz = r5.www ? r3.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r5.zzz ? r2.xyz : r0.xyz;
  r0.x = -cb7[8].x + r1.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r5.xxxx ? r1.xyzw : r0.xyzw;
  return;
}