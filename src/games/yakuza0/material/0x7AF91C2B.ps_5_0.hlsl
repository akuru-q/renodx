#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:58 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[12];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[14];
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
  float4 cb7[12];
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
  float4 v0 : TEXCOORD0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float4 v8 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r1.x = t3.Sample(s3_s, r1.xy).y;
  r1.yz = t5.Sample(s5_s, r1.zw).xy;
  r2.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r3.xy = cb7[5].xy * v0.zw;
  r1.w = t4.Sample(s4_s, r3.xy).y;
  r2.w = v2.w * r2.w;
  r1.w = r1.w + -r1.x;
  r1.x = r2.w * r1.w + r1.x;
  r2.xyz = r2.xyz * r2.xyz + -r0.xyz;
  r0.xyz = r2.www * r2.xyz + r0.xyz;
  r1.yz = r1.yz * float2(2,2) + float2(-1,-1);
  r1.w = dot(r1.yz, r1.yz);
  r1.w = 1 + -r1.w;
  r1.w = max(0, r1.w);
  r1.w = sqrt(r1.w);
  r2.xyz = v7.yzx * v3.zxy;
  r2.xyz = v3.yzx * v7.zxy + -r2.xyz;
  r2.xyz = v7.www * r2.xyz;
  r3.xyz = v7.xyz * r1.yyy;
  r2.xyz = r1.zzz * r2.xyz + r3.xyz;
  r1.yzw = r1.www * v3.xyz + r2.xyz;
  r2.x = dot(r1.yzw, r1.yzw);
  r2.x = rsqrt(r2.x);
  r2.yzw = r2.xxx * r1.yzw;
  r3.x = dot(v4.xyz, v4.xyz);
  r3.x = rsqrt(r3.x);
  r3.yzw = v4.xyz * r3.xxx;
  r4.x = saturate(dot(r2.yzw, -cb3[6].xyz));
  r4.yz = cb12[29].zw * v8.xy;
  r5.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r5.x != 0) {
    r6.xyz = t13.Sample(s13_s, r4.yz).xyw;
  } else {
    r6.xyz = float3(1,1,1);
  }
  r7.xy = r6.xy * cb1[9].xz + cb1[9].yw;
  r7.xy = r5.xx ? r7.xy : r6.xy;
  r8.xyz = -cb3[5].xyz + float3(1,1,1);
  r9.xyzw = t14.Sample(s14_s, r4.yz).xyzw;
  r10.xyzw = r9.xyzw + r9.xyzw;
  r9.xyzw = r9.xyzw / cb1[0].zzzz;
  r9.xyzw = r5.zzzz ? r10.xyzw : r9.xyzw;
  r9.xyzw = r5.yyyy ? r10.xyzw : r9.xyzw;
  r4.yz = r7.xy * cb1[9].xz + cb1[9].yw;
  r4.yz = r5.xx ? r4.yz : r6.xy;
  r4.y = r4.y * r4.z;
  r6.xyw = r4.yyy * r8.xyz + cb3[5].xyz;
  r7.xyz = v1.xyz * r6.zzz;
  r8.xyz = r6.xyw * cb1[11].xxx + cb1[11].yyy;
  r4.y = cb1[11].z + cb1[11].w;
  r8.xyz = r8.xyz * r4.yyy;
  r8.xyz = r5.xxx ? r8.xyz : r6.xyw;
  r8.xyz = r8.xyz * r6.zzz;
  r10.xyz = cb6[1].www * cb7[11].xyz;
  r11.xyz = r10.xyz * r0.xyz;
  r12.xyz = r9.xyz * r4.zzz + v5.xyz;
  r13.xyz = r9.www * r4.zzz + v6.xyz;
  r12.xyz = r5.www ? v5.xyz : r12.xyz;
  r13.xyz = r5.www ? v6.xyz : r13.xyz;
  r4.y = saturate(dot(r2.yzw, -cb3[7].xyz));
  r14.xyz = cb3[0].xyz * r4.xxx;
  r15.xyz = cb3[1].xyz * r4.yyy;
  r16.xyz = cb6[0].xyz * cb7[9].xyz;
  r17.xyz = r15.xyz * r4.zzz;
  r17.xyz = r14.xyz * r6.xyw + r17.xyz;
  r17.xyz = r16.xyz * r17.xyz + cb1[13].xyz;
  r10.xyz = r10.xyz * r0.xyz + r17.xyz;
  r17.xyz = r12.xyz * r8.xyz;
  r10.xyz = r10.xyz * r7.xyz + r17.xyz;
  r17.xyz = v4.xyz * r3.xxx + cb3[6].xyz;
  r4.x = dot(r17.xyz, r17.xyz);
  r4.x = rsqrt(r4.x);
  r17.xyz = r17.xyz * r4.xxx;
  r4.x = saturate(dot(-r17.xyz, r2.yzw));
  r17.xyz = v4.xyz * r3.xxx + float3(0,-0.300000012,0);
  r3.x = dot(r17.xyz, r17.xyz);
  r3.x = rsqrt(r3.x);
  r17.xyz = r17.xyz * r3.xxx;
  r3.x = saturate(dot(-r17.xyz, r2.yzw));
  r17.x = log2(r4.x);
  r17.y = log2(r3.x);
  r4.xw = cb7[10].ww * r17.xy;
  r4.xw = exp2(r4.xw);
  r3.x = cb3[11].x + cb3[11].x;
  r17.xyz = cb3[0].xyz * r4.xxx;
  r18.xyz = cb3[1].xyz * r4.www;
  r18.xyz = r18.xyz * r3.xxx;
  r19.xyz = r18.xyz * r4.yyy;
  r19.xyz = r17.xyz * r6.xyw + r19.xyz;
  r20.xyz = cb6[1].xyz * cb7[10].xyz;
  r19.xyz = r20.xyz * r19.xyz;
  r21.xyz = r13.xyz * r4.www;
  r21.xyz = r21.xyz * r8.xyz;
  r19.xyz = r19.xyz * r7.xyz + r21.xyz;
  r9.xyz = r9.xyz * r4.zzz + r10.xyz;
  r4.xyz = r9.www * r4.zzz + r19.xyz;
  r9.xyz = r5.www ? r9.xyz : r10.xyz;
  r4.xyz = r5.www ? r4.xyz : r19.xyz;
  r10.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r4.xyz = r10.xxx ? float3(0,0,0) : r4.xyz;
  r5.yzw = r9.xyz * r0.xyz;
  r4.xyz = r4.xyz * r1.xxx;
  r1.yzw = r1.yzw * r2.xxx + float3(1,1,1);
  r1.yzw = saturate(float3(0.5,0.5,0.5) * r1.yzw);
  r1.yzw = cb9[11].yyy * r1.yzw;
  r0.xyz = cb9[11].xxx * r0.xyz + r1.yzw;
  r1.x = cb9[11].z * r1.x;
  r0.xyz = r1.xxx * r20.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r6.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r7.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r8.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r16.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r20.xyz + r0.xyz;
  r1.x = dot(-r3.yzw, r2.yzw);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r11.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r16.xyz;
  r0.xyz = r1.xyz * r14.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r16.xyz;
  r0.xyz = r1.xyz * r15.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r12.xyz + r0.xyz;
  r1.xyz = cb9[15].xxx * r20.xyz;
  r0.xyz = r1.xyz * r17.xyz + r0.xyz;
  r1.xyz = cb9[15].yyy * r20.xyz;
  r1.xyz = r1.xyz * r18.xyz;
  r0.xyz = r1.xyz * r4.www + r0.xyz;
  r1.xyz = cb9[15].zzz * r13.xyz;
  r0.xyz = r1.xyz * r4.www + r0.xyz;
  r0.xyz = r10.yyy ? r0.xyz : r5.yzw;
  r1.xyz = r10.yyy ? float3(0,0,0) : r4.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
  r2.xyz = cb1[0].xxx * r0.xyz;

  MaterialPreTonemap(r2.xyz, cb1[0].x);

  r3.xyz = log2(r2.xyz);
  r3.xyz = cb1[0].yyy * r3.xyz;
  r3.xyz = exp2(r3.xyz);
  r4.xyz = r2.xyz + r2.xyz;
  r5.yzw = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
  r5.yzw = r4.xyz * r5.yzw + float3(0.00400000019,0.00400000019,0.00400000019);
  r2.xyz = r2.xyz * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
  r2.xyz = r4.xyz * r2.xyz + float3(0.0599999987,0.0599999987,0.0599999987);
  r2.xyz = r5.yzw / r2.xyz;
  r2.xyz = float3(-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyz;
  r2.xyz = saturate(float3(1.37906432,1.37906432,1.37906432) * r2.xyz);

  MaterialPostTonemap(r2.xyz);

  r2.xyz = sqrt(r2.xyz);
  r0.xyz = r10.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r10.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v2.xyz + r0.xyz;
  r0.w = saturate(v2.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r10.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r5.xxxx ? r1.xyzw : r0.xyzw;
  return;
}