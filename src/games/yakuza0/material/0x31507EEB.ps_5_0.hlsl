#include "../common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat Oct 11 15:28:53 2025
Texture2D<float4> t14 : register(t14);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

TextureCube<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s14_s : register(s14);

SamplerState s13_s : register(s13);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

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
  float4 v1 : TEXCOORD1,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : TEXCOORD6,
  float4 v9 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v0.xy).xyzw;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyzw = cb7[4].xyzw * v0.xyxy;
  r2.xyz = t3.Sample(s3_s, r1.xy).xyz;
  r1.xy = t5.Sample(s5_s, r1.zw).xy;
  r3.xyzw = t1.Sample(s1_s, v0.zw).xyzw;
  r4.xyzw = cb7[5].xyzw * v0.zwzw;
  r5.xyz = t4.Sample(s4_s, r4.xy).xyz;
  r1.zw = t6.Sample(s6_s, r4.zw).xy;
  r4.xy = t7.Sample(s7_s, v1.zw).xy;
  r2.w = v3.w * r3.w;
  r3.xyz = r3.xyz * r3.xyz + -r0.xyz;
  r0.xyz = r2.www * r3.xyz + r0.xyz;
  r3.xyz = r5.xyz + -r2.xyz;
  r2.xyz = r2.www * r3.xyz + r2.xyz;
  r1.zw = r1.zw + -r1.xy;
  r1.xy = r2.ww * r1.zw + r1.xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r1.z = dot(r1.xy, r1.xy);
  r1.z = 1 + -r1.z;
  r1.z = max(0, r1.z);
  r1.z = sqrt(r1.z);
  r3.xyz = v8.yzx * v4.zxy;
  r3.xyz = v4.yzx * v8.zxy + -r3.xyz;
  r3.xyz = v8.www * r3.xyz;
  r5.xyz = v8.xyz * r1.xxx;
  r1.xyw = r1.yyy * r3.xyz + r5.xyz;
  r1.xyz = r1.zzz * v4.xyz + r1.xyw;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = rsqrt(r1.w);
  r3.xyz = r1.xyz * r1.www;
  r2.w = dot(v5.xyz, v5.xyz);
  r2.w = rsqrt(r2.w);
  r5.xyz = v5.xyz * r2.www;
  r3.w = dot(r3.xyz, -cb3[6].xyz);
  r4.zw = cb12[29].zw * v9.xy;
  r6.xyzw = int4(8,0x4000,8192,2048) & asint(cb13[0].xxxx);
  if (r6.x != 0) {
    r7.xyz = t13.Sample(s13_s, r4.zw).xyw;
  } else {
    r7.xyz = float3(1,1,1);
  }
  r8.xy = r7.xy * cb1[9].xz + cb1[9].yw;
  r8.xy = r6.xx ? r8.xy : r7.xy;
  r4.y = r4.y * cb1[10].x + cb1[10].y;
  r4.y = r4.x * r4.y;
  r9.xyz = -cb3[5].xyz + float3(1,1,1);
  r10.xyz = r4.yyy * r9.xyz + cb3[5].xyz;
  r11.xyzw = t14.Sample(s14_s, r4.zw).xyzw;
  r12.xyzw = r11.xyzw + r11.xyzw;
  r11.xyzw = r11.xyzw / cb1[0].zzzz;
  r11.xyzw = r6.zzzz ? r12.xyzw : r11.xyzw;
  r11.xyzw = r6.yyyy ? r12.xyzw : r11.xyzw;
  r4.yz = r8.xy * cb1[9].xz + cb1[9].yw;
  r4.yz = r6.xx ? r4.yz : r7.xy;
  r4.y = r4.y * r4.z;
  r7.xyw = r4.yyy * r9.xyz + cb3[5].xyz;
  r9.xyz = v2.xyz * r10.xyz;
  r9.xyz = r9.xyz * r7.zzz;
  r12.xyz = r7.xyw * r10.xyz;
  r13.xyz = r7.xyw * cb1[11].xxx + cb1[11].yyy;
  r14.xyz = r10.xyz * cb1[11].zzz + cb1[11].www;
  r13.xyz = r14.xyz * r13.xyz;
  r12.xyz = r6.xxx ? r13.xyz : r12.xyz;
  r12.xyz = r12.xyz * r4.xxx;
  r12.xyz = r12.xyz * r7.zzz;
  r13.xyz = cb6[1].www * cb7[11].xyz;
  r14.xyz = r13.xyz * r0.xyz;
  r15.xyz = r11.xyz * r4.zzz + v6.xyz;
  r16.xyz = r11.www * r4.zzz + v7.xyz;
  r15.xyz = r6.www ? v6.xyz : r15.xyz;
  r16.xyz = r6.www ? v7.xyz : r16.xyz;
  r4.y = saturate(dot(r3.xyz, -cb3[7].xyz));
  r4.w = saturate(r3.w);
  r17.xyz = cb3[0].xyz * r4.www;
  r18.xyz = cb3[1].xyz * r4.yyy;
  r19.xyz = cb6[0].xyz * cb7[9].xyz;
  r20.xyz = r18.xyz * r4.zzz;
  r20.xyz = r17.xyz * r7.xyw + r20.xyz;
  r20.xyz = r19.xyz * r20.xyz + cb1[13].xyz;
  r13.xyz = r13.xyz * r0.xyz + r20.xyz;
  r20.xyz = r15.xyz * r12.xyz;
  r13.xyz = r13.xyz * r9.xyz + r20.xyz;
  r20.xyz = v5.xyz * r2.www + cb3[6].xyz;
  r4.w = dot(r20.xyz, r20.xyz);
  r4.w = rsqrt(r4.w);
  r20.xyz = r20.xyz * r4.www;
  r4.w = saturate(dot(-r20.xyz, r3.xyz));
  r20.xyz = v5.xyz * r2.www + float3(0,-0.300000012,0);
  r2.w = dot(r20.xyz, r20.xyz);
  r2.w = rsqrt(r2.w);
  r20.xyz = r20.xyz * r2.www;
  r2.w = saturate(dot(-r20.xyz, r3.xyz));
  r20.x = log2(r4.w);
  r20.y = log2(r2.w);
  r6.yz = cb7[10].ww * r20.xy;
  r6.yz = exp2(r6.yz);
  r2.w = cb3[11].x + cb3[11].x;
  r20.xyz = cb3[0].xyz * r6.yyy;
  r21.xyz = cb3[1].xyz * r6.zzz;
  r21.xyz = r21.xyz * r2.www;
  r22.xyz = r21.xyz * r4.yyy;
  r22.xyz = r20.xyz * r7.xyw + r22.xyz;
  r23.xyz = cb6[1].xyz * cb7[10].xyz;
  r22.xyz = r23.xyz * r22.xyz;
  r24.xyz = r16.xyz * r6.zzz;
  r24.xyz = r24.xyz * r12.xyz;
  r22.xyz = r22.xyz * r9.xyz + r24.xyz;
  r11.xyz = r11.xyz * r4.zzz + r13.xyz;
  r4.yzw = r11.www * r4.zzz + r22.xyz;
  r11.xyz = r6.www ? r11.xyz : r13.xyz;
  r4.yzw = r6.www ? r4.yzw : r22.xyz;
  r13.xyzw = int4(128,0x8000,16,4) & asint(cb13[0].xxxx);
  r4.yzw = r13.xxx ? float3(0,0,0) : r4.yzw;
  r11.xyz = r11.xyz * r0.xyz;
  r4.yzw = r4.yzw * r2.xyz;
  r1.xyz = r1.xyz * r1.www + float3(1,1,1);
  r1.xyz = saturate(float3(0.5,0.5,0.5) * r1.xyz);
  r1.xyz = cb9[11].yyy * r1.xyz;
  r0.xyz = cb9[11].xxx * r0.xyz + r1.xyz;
  r1.xyz = cb9[11].zzz * r2.xyz;
  r0.xyz = r1.xyz * r23.xyz + r0.xyz;
  r1.x = cb9[11].w * cb7[10].w;
  r0.xyz = r1.xxx * float3(0.00999999978,0.00999999978,0.00999999978) + r0.xyz;
  r0.xyz = cb9[12].xxx * r7.xyw + r0.xyz;
  r0.xyz = cb9[12].yyy * r9.xyz + r0.xyz;
  r0.xyz = cb9[12].zzz * r12.xyz + r0.xyz;
  r0.xyz = cb9[12].www + r0.xyz;
  r0.xyz = cb9[13].xxx * r19.xyz + r0.xyz;
  r0.xyz = cb9[13].yyy * r23.xyz + r0.xyz;
  r1.x = dot(-r5.xyz, r3.xyz);
  r1.x = 1 + -r1.x;
  r1.y = r1.x * r1.x;
  r1.y = r1.y * r1.y;
  r1.x = r1.y * r1.x;
  r1.x = r1.x * 0.972222209 + 0.027777778;
  r0.xyz = cb9[13].zzz * r1.xxx + r0.xyz;
  r0.xyz = cb9[13].www * cb1[13].xyz + r0.xyz;
  r0.xyz = cb9[14].xxx * r14.xyz + r0.xyz;
  r1.xyz = cb9[14].yyy * r19.xyz;
  r0.xyz = r1.xyz * r17.xyz + r0.xyz;
  r1.xyz = cb9[14].zzz * r19.xyz;
  r0.xyz = r1.xyz * r18.xyz + r0.xyz;
  r0.xyz = cb9[14].www * r15.xyz + r0.xyz;
  r1.xyz = cb9[15].xxx * r23.xyz;
  r0.xyz = r1.xyz * r20.xyz + r0.xyz;
  r1.xyz = cb9[15].yyy * r23.xyz;
  r1.xyz = r1.xyz * r21.xyz;
  r0.xyz = r1.xyz * r6.zzz + r0.xyz;
  r1.xyz = cb9[15].zzz * r16.xyz;
  r0.xyz = r1.xyz * r6.zzz + r0.xyz;
  r0.xyz = r13.yyy ? r0.xyz : r11.xyz;
  r1.xyz = r13.yyy ? float3(0,0,0) : r4.yzw;
  r0.xyz = r1.xyz + r0.xyz;
  r1.xyz = r10.xyz * r4.xxx;
  r1.w = dot(r5.xyz, r3.xyz);
  r1.w = r1.w + r1.w;
  r2.xyz = r3.xyz * -r1.www + r5.xyz;
  r2.xyz = float3(-1,1,1) * r2.xyz;
  r2.xyzw = t2.Sample(s2_s, r2.xyz).xyzw;
  r1.w = r8.x * r8.y;
  r3.x = saturate(0.75 + r3.w);
  r1.w = r3.x * r1.w;
  r1.w = max(cb3[11].y, r1.w);
  r2.w = max(0.00392156886, r2.w);
  r2.w = 0.25 / r2.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = r2.xyz * r2.xyz;
  r2.xyz = v4.www * r2.xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = r1.xyz * r1.www + r0.xyz;
  r0.xyz = r0.xyz * float3(0.699999988,0.699999988,0.699999988) + float3(0.300000012,0,0.300000012);
  r1.x = cb5[1].w * cb7[9].w;
  r1.x = cb6[0].w * r1.x;
  r1.w = r1.x * r0.w;
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
  r0.xyz = r13.yyy ? r0.xyz : r2.xyz;
  r0.xyz = r13.zzz ? r3.xyz : r0.xyz;
  r2.xyz = v3.xyz + r0.xyz;
  r0.w = saturate(v3.x);
  r3.xyz = cb1[1].xyz + -r0.xyz;
  r0.xyz = r0.www * r3.xyz + r0.xyz;
  r1.xyz = r13.www ? r2.xyz : r0.xyz;
  r0.xyzw = cb1[3].xyzw * r1.xyzw;
  o0.xyzw = r6.xxxx ? r1.xyzw : r0.xyzw;
  return;
}