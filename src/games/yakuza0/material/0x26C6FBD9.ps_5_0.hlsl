#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:52 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s5_s : register(s5);

SamplerState s3_s : register(s3);

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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = t2.Sample(s2_s, v2.xy).yz;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyz = r1.xyz * r1.xyz;
  r2.xyz = t3.Sample(s3_s, v2.xy).xyz;
  r0.zw = t5.Sample(s5_s, v2.xy).xy;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r2.w = dot(r0.zw, r0.zw);
  r2.w = 1 + -r2.w;
  r2.w = max(0, r2.w);
  r2.w = sqrt(r2.w);
  r3.xyz = v5.yzx * v4.zxy;
  r3.xyz = v4.yzx * v5.zxy + -r3.xyz;
  r3.xyz = v5.www * r3.xyz;
  r4.xyz = v5.xyz * r0.zzz;
  r3.xyz = r0.www * r3.xyz + r4.xyz;
  r3.xyz = r2.www * v4.xyz + r3.xyz;
  r0.z = dot(r3.xyz, r3.xyz);
  r0.z = rsqrt(r0.z);
  r4.xyz = r3.xyz * r0.zzz;
  r0.w = dot(v3.xyz, v3.xyz);
  r0.w = rsqrt(r0.w);
  r5.xyz = v3.xyz * r0.www;
  r6.xyz = v3.xyz * r0.www + cb3[6].xyz;
  r2.w = dot(r6.xyz, r6.xyz);
  r2.w = rsqrt(r2.w);
  r6.xyz = r6.xyz * r2.www;
  r7.xyzw = t7.Sample(s7_s, v2.zw).xyzw;
  r8.xyz = r7.xyz * r7.xyz;
  r7.xyz = -r7.xyz * r7.xyz + float3(1,1,1);
  r9.xy = float2(1,1) + -r0.yx;
  r7.xyz = r9.xxx * r7.xyz;
  r0.y = 1 + -r7.w;
  r7.xyz = r7.xyz * r0.yyy + r8.xyz;
  r1.xyz = r7.xyz * r1.xyz;
  r3.xyzw = r3.yxyz * r0.zzzz + float4(0.100000001,1,1,1);
  r3.x = saturate(r3.x);
  r0.yz = cb7[6].wz + float2(2,2.5);
  r2.w = dot(-r5.xyz, v4.xyz);
  r2.w = saturate(1 + -r2.w);
  r5.w = dot(-r5.xyz, r4.xyz);
  r5.w = 1 + -r5.w;
  r6.w = saturate(r5.w);
  r2.w = r6.w * r2.w;
  r2.w = log2(r2.w);
  r0.y = r2.w * r0.y;
  r0.y = exp2(r0.y);
  r0.y = r0.y * r0.z;
  r0.y = r0.y * r3.x;
  r7.xyzw = int4(4096,8,1,0x4000) & asint(cb13[0].xxxx);
  r0.z = cb9[9].w * r2.w;
  r0.z = exp2(r0.z);
  r0.z = cb9[9].z * r0.z;
  r0.z = r0.z * r3.x;
  r0.yz = r0.yz * r0.xx;
  r0.y = r7.x ? r0.z : r0.y;
  r0.y = r0.y * cb9[2].x + 1;
  r1.xyz = r1.xyz * r0.yyy;
  r0.yz = cb12[29].zw * v8.xy;
  if (r7.y != 0) {
    r8.xy = t13.Sample(s13_s, r0.yz).xy;
  } else {
    r8.xy = float2(1,1);
  }
  r8.zw = r8.xy * cb1[12].xz + cb1[12].yw;
  r8.xy = r7.yy ? r8.zw : r8.xy;
  r2.w = min(r8.x, r8.y);
  r9.xzw = v3.xyz * r0.www + cb3[7].xyz;
  r3.x = dot(r9.xzw, r9.xzw);
  r3.x = rsqrt(r3.x);
  r9.xzw = r9.xzw * r3.xxx;
  r3.x = dot(r5.xyz, r4.xyz);
  r3.x = r3.x + r3.x;
  r10.xyz = r4.xyz * -r3.xxx + r5.xyz;
  r11.x = saturate(dot(r10.xyz, -cb3[6].xyz));
  r11.y = saturate(dot(r10.xyz, -cb3[7].xyz));
  r8.zw = log2(r11.xy);
  r8.zw = cb7[10].ww * r8.zw;
  r8.zw = exp2(r8.zw);
  r3.x = cb1[0].w * cb7[8].z;
  r6.w = cb7[10].w * 0.0397435986 + 0.0856831968;
  r8.zw = r8.zw * r6.ww;
  r6.x = dot(r5.xyz, r6.xyz);
  r6.y = dot(r5.xyz, r9.xzw);
  r5.xy = float2(1,1) + -r6.xy;
  r6.xy = r5.xy * r5.xy;
  r5.z = -cb7[8].z * cb1[0].w + 1;
  r6.xy = r6.xy * r6.xy;
  r6.xy = r6.xy * r5.zz;
  r5.xy = r6.xy * r5.xy + r3.xx;
  r5.xy = r8.zw * r5.xy;
  r6.x = dot(r4.xyz, -cb3[6].xyz);
  r3.x = saturate(r6.x);
  r3.x = r5.x * r3.x;
  r6.y = dot(r4.xyz, -cb3[7].xyz);
  r6.xyz = saturate(r6.yxy);
  r5.x = r6.x * r5.y;
  r9.xzw = cb6[1].xyz * cb7[10].xyz;
  r10.xyz = cb3[0].xyz * r3.xxx;
  r5.xyz = cb3[1].xyz * r5.xxx;
  r5.xyz = r10.xyz * r2.www + r5.xyz;
  r3.x = saturate(dot(r4.xyz, -v6.xyz));
  r10.x = v3.w;
  r10.y = v4.w;
  r10.z = v6.w;
  r11.xyz = r10.xyz * r3.xxx;
  r11.xyz = max(float3(0,0,0), r11.xyz);
  r3.x = saturate(dot(r4.xyz, -v7.xyz));
  r12.x = v0.w;
  r12.y = v1.w;
  r12.z = v7.w;
  r13.xyz = r12.xyz * r3.xxx;
  r13.xyz = max(float3(0,0,0), r13.xyz);
  r11.xyz = r13.xyz + r11.xyz;
  r13.xyz = v3.xyz * r0.www + v6.xyz;
  r3.x = dot(r13.xyz, r13.xyz);
  r3.x = rsqrt(r3.x);
  r13.xyz = r13.xyz * r3.xxx;
  r14.xyz = v3.xyz * r0.www + v7.xyz;
  r0.w = dot(r14.xyz, r14.xyz);
  r0.w = rsqrt(r0.w);
  r14.xyz = r14.xyz * r0.www;
  r13.x = saturate(dot(-r13.xyz, r4.xyz));
  r13.y = saturate(dot(-r14.xyz, r4.xyz));
  r6.xw = log2(r13.xy);
  r6.xw = cb7[10].ww * r6.xw;
  r6.xw = exp2(r6.xw);
  r12.xyz = r12.xyz * r6.www;
  r10.xyz = r10.xyz * r6.xxx + r12.xyz;
  r10.xyz = max(float3(0,0,0), r10.xyz);
  r10.xyz = r10.xyz * r9.xzw;
  r10.xyz = min(float3(1,1,1), r10.xyz);
  r11.xyz = r7.zzz ? r11.xyz : float3(0,0,0);
  r10.xyz = r7.zzz ? r10.xyz : float3(0,0,0);
  r12.xyzw = t14.Sample(s14_s, r0.yz).xyzw;
  r13.xyzw = float4(4,4,4,4) * r12.xyzw;
  r14.xyzw = int4(8192,64,0x8000,16) & asint(cb13[0].xxxx);
  r15.xyzw = r12.xyzw + r12.xyzw;
  r12.xyzw = r12.xyzw / cb1[0].zzzz;
  r12.xyzw = r14.xxxx ? r15.xyzw : r12.xyzw;
  r12.xyzw = r7.wwww ? r13.xyzw : r12.xyzw;
  r0.yzw = r12.xyz + r11.xyz;
  r7.xzw = r12.www + r10.xyz;
  r4.w = 1;
  r10.x = dot(cb2[80].xyzw, r4.xyzw);
  r10.y = dot(cb2[81].xyzw, r4.xyzw);
  r10.z = dot(cb2[82].xyzw, r4.xyzw);
  r10.w = dot(cb2[83].xyzw, r4.xyzw);
  r10.x = dot(r4.xyzw, r10.xyzw);
  r11.x = dot(cb2[84].xyzw, r4.xyzw);
  r11.y = dot(cb2[85].xyzw, r4.xyzw);
  r11.z = dot(cb2[86].xyzw, r4.xyzw);
  r11.w = dot(cb2[87].xyzw, r4.xyzw);
  r10.y = dot(r4.xyzw, r11.xyzw);
  r11.x = dot(cb2[88].xyzw, r4.xyzw);
  r11.y = dot(cb2[89].xyzw, r4.xyzw);
  r11.z = dot(cb2[90].xyzw, r4.xyzw);
  r11.w = dot(cb2[91].xyzw, r4.xyzw);
  r10.z = dot(r4.xyzw, r11.xyzw);
  r4.xzw = max(float3(0.0625,0.0625,0.0625), r10.xyz);
  r3.x = r4.y * 0.5 + 0.5;
  r10.xyz = -cb3[10].xyz + cb3[4].xyz;
  r10.xyz = r3.xxx * r10.xyz + cb3[10].xyz;
  r4.xyz = cb2[79].xxx * r4.xzw + r10.xyz;
  r10.xyz = cb3[0].xyz * r6.yyy;
  r6.xzw = cb3[1].xyz * r6.zzz;
  r11.xyz = r10.xyz * r2.www + r6.xzw;
  r11.xyz = r11.xyz + r4.xyz;
  r11.xyz = r11.xyz + r0.yzw;
  r12.xyz = r11.xyz * r0.xxx;
  r2.w = r6.y * r2.w;
  r2.w = r2.w * r9.y + r0.x;
  r11.xyz = r11.xyz * r2.www;
  r11.xyz = r14.yyy ? r11.xyz : r12.xyz;
  r5.xyz = r9.xzw * r5.xyz + r7.xzw;
  r3.xyz = saturate(float3(0.5,0.5,0.5) * r3.yzw);
  r3.xyz = cb9[11].yyy * r3.xyz;
  r3.xyz = cb9[11].xxx * r1.xyz + r3.xyz;
  r12.xyz = cb9[11].zzz * r2.xyz;
  r3.xyz = r12.xyz * r9.xzw + r3.xyz;
  r3.xyz = cb9[11].www * r5.xxx + r3.xyz;
  r2.w = cb9[12].y * r8.y;
  r3.xyz = cb9[12].xxx * r8.xxx + r3.xyz;
  r3.xyz = r2.www * r0.xxx + r3.xyz;
  r8.xyz = cb6[0].xyz * cb7[9].xyz;
  r3.xyz = cb9[13].xxx * r8.xyz + r3.xyz;
  r3.xyz = cb9[13].yyy * r9.xzw + r3.xyz;
  r0.x = r5.w * r5.w;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r5.w;
  r0.x = r0.x * 0.972222209 + 0.027777778;
  r3.xyz = cb9[13].zzz * r0.xxx + r3.xyz;
  r3.xyz = cb9[13].www * r4.xyz + r3.xyz;
  r4.xyz = cb9[14].yyy * r8.xyz;
  r3.xyz = r4.xyz * r10.xyz + r3.xyz;
  r4.xyz = cb9[14].zzz * r8.xyz;
  r3.xyz = r4.xyz * r6.xzw + r3.xyz;
  r0.xyz = cb9[14].www * r0.yzw + r3.xyz;
  r3.xyz = cb9[15].xxx * r9.xzw;
  r0.xyz = r3.xyz * r5.xyz + r0.xyz;
  r3.xyz = cb9[15].yyy * r9.xzw;
  r0.xyz = r3.xyz * r5.xyz + r0.xyz;
  r0.xyz = saturate(cb9[15].zzz * r7.xzw + r0.xyz);
  r1.xyz = r11.xyz * r1.xyz;
  r2.xyz = r5.xyz * r2.xyz;
  r1.xyz = r1.xyz * r8.xyz + r2.xyz;
  r0.xyz = r14.zzz ? r0.xyz : r1.xyz;
  r0.w = cb5[1].w * cb7[9].w;
  r0.w = cb6[0].w * r0.w;
  r1.w = r1.w * r0.w;
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
  r0.xyz = r14.zzz ? r0.xyz : r2.xyz;
  r0.xyz = r14.www ? r3.xyz : r0.xyz;
  r0.w = 4 & asint(cb13[0].x);
  r2.xyz = v1.xyz + r0.xyz;
  r2.w = saturate(v1.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r2.www * r3.xyz + r0.xyz;
  r0.xyz = r0.www ? r2.xyz : r0.xyz;
  r2.xyz = cb9[12].zzz * cb9[3].xyz + r0.xyz;
  r2.xyz = cb9[12].www * v0.xyz + r2.xyz;
  r1.xyz = r14.zzz ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r7.yyyy ? r1.xyzw : r0.xyzw;
  return;
}