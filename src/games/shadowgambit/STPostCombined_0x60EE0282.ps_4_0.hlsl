#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 15:40:54 2025
Texture2D<float4> t9 : register(t9);

Texture2D<float4> t8 : register(t8);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

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
  float4 cb3[1];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[21];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[8];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[58];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cb0[46].x * 0.0500000715 + 1.04999995;
  r1.xyzw = t1.Sample(s3_s, v1.zw).xyzw;
  r0.y = cb1[7].x * r1.x + cb1[7].y;
  r0.y = 1 / r0.y;
  r1.xyz = r0.yyy * v2.xyz + cb0[40].xyz;
  r2.xyz = -cb0[47].xyz + r1.xyz;
  r0.z = dot(r2.xyz, r2.xyz);
  r0.z = sqrt(r0.z);
  r0.z = 0.00899999961 * r0.z;
  r0.z = min(1, r0.z);
  r0.z = 1 + -r0.z;
  r0.x = saturate(r0.z * r0.x);
  r0.x = log2(r0.x);
  r0.x = 25 * r0.x;
  r0.x = exp2(r0.x);
  r0.z = 1 + -r0.x;
  r0.z = r0.z + r0.z;
  r2.xy = float2(3,1.5) * cb0[14].wy;
  r3.xyzw = t2.Sample(s0_s, v6.xy).xyzw;

  r3.rgb = renodx::draw::InvertIntermediatePass(r3.rgb);
  
  //r3.rgb = renodx::tonemap::renodrt::NeutralSDR(r3.rgb);

  r0.w = dot(r3.xyz, float3(0.0396819152,0.45802179,0.00609653955));
  r0.w = max(9.99999975e-05, r0.w);
  r2.zw = cb0[14].wy * r0.ww;
  r2.zw = log2(r2.zw);
  r2.xy = r2.xy * r2.zw;
  r2.xy = exp2(r2.xy);
  r2.xy = min(float2(1,1), r2.xy);
  r1.w = 1 + -r2.y;
  r0.z = -r0.z * r1.w + 1;
  r1.w = r0.x + r0.x;
  r1.w = r1.w * r2.y + -r0.z;
  r2.z = cmp(0.5 >= r0.x);
  r2.z = r2.z ? 1.000000 : 0;
  r0.z = r2.z * r1.w + r0.z;
  r1.w = r0.z * r0.x;
  r2.z = frac(-cb0[46].y);
  r0.x = r0.z * r0.x + -r2.z;
  r0.x = frac(r0.x);
  r0.x = frac(-r0.x);
  r0.z = r0.x * r0.x;
  r0.z = r0.z * r0.z;
  r0.x = r0.x * r0.z;
  r0.z = saturate(r3.w);
  r0.x = r0.x * r0.z;
  r0.x = saturate(r0.x * r1.w);
  r1.w = r0.x * r2.z;
  r2.w = r1.w * 2 + -1;
  r2.w = 50 * r2.w;
  r4.xyzw = float4(2.5,5,15,7.5) * r1.wwww;
  r1.w = 10 * r1.w;
  r4.xyw = min(float3(1,1,1), r4.xyw);
  r2.w = r4.y * r2.w;
  r4.y = log2(r0.x);
  r5.xy = float2(2.5,7.5) * r4.yy;
  r5.xy = exp2(r5.xy);
  r5.xy = r5.xy * r2.zz;
  r4.y = r5.x + r5.x;
  r4.y = max(cb0[9].x, r4.y);
  r5.zw = float2(-0.5,-0.5) + v6.xy;
  r6.x = dot(r5.zw, r5.zw);
  r6.x = sqrt(r6.x);
  r4.y = r6.x * r4.y;
  r6.yz = r4.yy * r5.zw;
  r6.yz = -r6.yz * float2(0.00999999978,0.00999999978) + r5.zw;
  r5.zw = r5.zw + r5.zw;
  r4.y = dot(r5.zw, r5.zw);
  r5.zw = float2(0.5,0.5) + r6.yz;
  r7.xyz = float3(0.5,0.5,1) + -r5.zww;
  r6.w = dot(r7.xy, r7.xy);
  r6.w = rsqrt(r6.w);
  r7.xy = r7.xy * r6.ww + r2.ww;
  r2.w = r7.z + r7.z;
  r8.xyzw = t3.Sample(s7_s, r5.zw).xyzw;
  r6.w = dot(r8.xyzw, r8.xyzw);
  r6.w = rsqrt(r6.w);
  r7.zw = r8.xy * r6.ww;
  r7.xy = r7.zw * float2(0.699999988,0.699999988) + r7.xy;
  r6.w = dot(r7.xy, r7.xy);
  r6.w = rsqrt(r6.w);
  r7.xy = r7.xy * r6.ww;
  r6.w = 5 * cb0[9].y;
  r6.w = max(cb0[42].w, r6.w);
  r4.z = max(r6.w, r4.z);
  r7.xy = r7.xy * r4.zz;
  sincos(cb0[41].w, r8.x, r9.x);
  r10.x = -r8.x;
  r10.y = r9.x;
  r10.z = r8.x;
  r8.x = dot(r7.yx, r10.yz);
  r4.z = dot(r7.yx, r10.xy);
  r8.y = -r4.z;
  r4.z = saturate(max(cb0[42].x, cb0[9].x));
  r7.xy = -r8.xy * r4.zz + r1.xz;
  r8.xyzw = r8.xyxy * r4.zzzz;
  r4.z = 15 + r1.y;
  r4.z = saturate(0.200000003 * r4.z);
  r7.xy = r4.zz * r7.xy + r8.zw;
  r7.xy = cb0[18].zz * r7.xy;
  r9.xyzw = t4.Sample(s6_s, r7.xy).xyzw;
  r7.xy = float2(5,5) * r7.xy;
  r7.xyzw = t4.Sample(s6_s, r7.xy).xyzw;
  r6.w = -0.5 + r9.z;
  r6.w = r4.z * r6.w + 0.5;
  r7.x = 1 + -r6.w;
  r7.w = cb0[11].x * r4.y;
  r9.z = max(cb0[9].x, r4.x);
  r7.w = saturate(r9.z * r7.w);
  r9.w = 1 + -r7.w;
  r9.w = r9.w + r9.w;
  r7.x = -r9.w * r7.x + 1;
  r6.w = dot(r6.ww, r7.ww);
  r7.w = cmp(0.5 >= r7.w);
  r7.w = r7.w ? 1.000000 : 0;
  r6.w = r6.w + -r7.x;
  r6.w = r7.w * r6.w + r7.x;
  r7.x = 1 + -r6.w;
  r7.x = r7.x + r7.x;
  r7.z = -0.75 + r7.z;
  r4.z = r4.z * r7.z + 0.75;
  r7.z = 1 + -r4.z;
  r4.z = dot(r4.zz, r6.ww);
  r6.w = cmp(0.5 >= r6.w);
  r6.w = r6.w ? 1.000000 : 0;
  r7.x = -r7.x * r7.z + 1;
  r4.z = -r7.x + r4.z;
  r4.z = r6.w * r4.z + r7.x;
  r6.w = log2(r9.x);
  r6.w = r9.x * r6.w;
  r6.w = exp2(r6.w);
  r7.x = min(1, r6.w);
  r6.w = saturate(dot(r6.ww, cb0[42].yy));
  r7.z = -1 + cb0[11].y;
  r10.xyzw = t0.Sample(s1_s, v6.xy).xyzw;
  r7.w = -1 + r10.y;
  r7.z = r7.w / r7.z;
  r7.z = saturate(0.5 + r7.z);
  r7.x = r7.x * r7.z;
  r7.z = 0.5 * r4.y;
  r4.y = log2(r4.y);
  r4.y = cb0[42].z * r4.y;
  r4.y = exp2(r4.y);
  r4.y = min(1, r4.y);
  r7.z = min(1, r7.z);
  r7.x = r7.x * r7.z + r4.z;
  r7.x = r7.x * r9.z;
  r7.w = r10.w * 2 + -1;
  r7.w = max(0, r7.w);
  r7.x = saturate(r7.x * r7.w);
  r7.w = 12 + -cb0[16].x;
  r9.x = -cb0[16].x + r1.y;
  r7.w = r9.x / r7.w;
  r7.w = -1 + r7.w;
  r7.w = saturate(cb0[42].y * 2 + r7.w);
  r6.w = r7.w * r6.w;
  r4.y = r6.w * r4.y;
  r4.y = max(r4.y, r7.x);
  r6.w = r0.x * r0.x;
  r6.w = r6.w * r6.w;
  r0.x = r6.w * r0.x;
  r0.x = r0.x * r2.z;
  r0.x = max(r4.y, r0.x);
  r2.z = 3.14159274 * r0.x;
  r0.x = r0.z * r0.x;
  r2.z = sin(r2.z);
  r9.xzw = cb0[43].xyz * r0.yyy;
  r10.xzw = -r0.yyy * cb0[43].xyz + r0.www;
  r9.xzw = r2.zzz * r10.xzw + r9.xzw;
  r9.xzw = r9.xzw * float3(0.5,0.5,0.5) + float3(0.5,0.5,0.5);
  r4.y = cb0[53].x * r0.w;
  r10.xzw = r0.www + -r3.xyz;
  r10.xzw = r2.zzz * r10.xzw + r3.xyz;
  r0.w = log2(r4.y);
  r0.w = cb0[53].y * r0.w;
  r0.w = exp2(r0.w);
  r0.w = min(1, r0.w);
  r2.z = -r7.x * r0.w + 1;
  r2.z = r2.z + r2.z;
  r4.y = 1 + -r0.w;
  r2.z = -r2.z * r4.y + 1;
  r4.y = r7.x * r0.w;
  r6.w = r4.y + r4.y;
  r4.y = cmp(0.5 >= r4.y);
  r4.y = r4.y ? 1.000000 : 0;
  r0.w = r6.w * r0.w + -r2.z;
  r0.w = r4.y * r0.w + r2.z;
  r9.xzw = r9.xzw + r0.www;
  r9.xzw = r9.xzw * cb0[43].xyz + -r10.xzw;
  r9.xzw = r0.xxx * r9.xzw + r10.xzw;
  r9.xzw = r9.xzw + -r3.xyz;
  r9.xzw = r0.zzz * r9.xzw + r3.xyz;
  r10.xzw = r9.xzw * cb0[27].yyy + -r9.xzw;
  r9.xzw = r4.www * r10.xzw + r9.xzw;
  r0.x = 1 + -r4.x;
  r4.xyw = r9.xzw * r2.yyy + -r9.xzw;
  r11.xyzw = cb1[0].yyyy * cb0[21].xzxz;
  r8.xyzw = r11.xyzw * cb0[22].xxxx + r8.xyzw;
  r11.xyzw = cb0[19].yyww * r8.xyzw;
  r8.xy = cb0[18].ww * r8.zw;
  r8.xy = r1.xz * cb0[18].zz + -r8.xy;
  r8.xyzw = t4.Sample(s6_s, r8.xy).xyzw;
  r11.xyzw = r1.xzxz * cb0[19].xxzz + -r11.xyzw;
  r12.xyzw = t4.Sample(s6_s, r11.xy).xyzw;
  r0.w = cb0[20].x * cb0[18].x;
  r2.z = -cb0[18].x * cb0[20].x + cb0[18].x;
  r0.w = r12.x * r2.z + r0.w;
  r1.xz = -cb0[35].zw + r1.xz;
  r1.xz = -cb0[35].xx + r1.xz;
  r1.xz = r1.xz / -cb0[35].xx;
  r1.xz = float2(1,1) + -r1.xz;
  r13.xyzw = t8.Sample(s4_s, r1.xz).xyzw;
  r0.w = r13.x * cb0[16].x + r0.w;
  r2.z = r13.x * cb0[16].x + cb0[26].x;
  r2.z = cb0[16].y + r2.z;
  r2.z = -r2.z + r1.y;
  r2.z = min(0, r2.z);
  r2.z = r2.z * r2.z;
  r0.w = cb0[16].y + r0.w;
  r0.w = r1.y + -r0.w;
  r1.y = -cb0[23].x + r1.y;
  r0.w = min(0, r0.w);
  r0.w = r0.w * r0.w;
  r6.w = r0.y * v2.y + 9.99999975e-06;
  r0.w = r0.w / abs(r6.w);
  r2.z = r2.z / abs(r6.w);
  r10.xzw = v2.xyz * r0.yyy;
  r13.xyz = cb0[18].yyy * r10.xzw;
  r10.xzw = cb0[26].www * r10.xzw;
  r6.w = dot(r10.xzw, r10.xzw);
  r6.w = sqrt(r6.w);
  r2.z = r6.w * r2.z;
  r6.w = dot(r13.xyz, r13.xyz);
  r6.w = sqrt(r6.w);
  r0.w = r6.w * r0.w;
  r0.w = r0.w * r8.x;
  r6.w = 0.699999988 + cb2[20].y;
  r6.w = saturate(1.42857146 * r6.w);
  r7.w = r6.w * -2 + 3;
  r6.w = r6.w * r6.w;
  r6.w = r7.w * r6.w;
  r10.xz = r6.ww * float2(-0.899999976,-0.99000001) + float2(1,1);
  r0.w = r10.x * r0.w;
  r0.w = max(0, r0.w);
  r0.w = cb0[29].x * r0.w;
  r0.w = -r0.w * r0.w;
  r0.w = exp2(r0.w);
  r0.w = 1 + -r0.w;
  r11.y = r8.x;
  r11.x = r12.x;
  r10.xw = r11.xy * cb0[20].ww + r11.zw;
  r11.xyzw = t4.Sample(s6_s, r10.xw).xyzw;
  r6.w = r11.y + -r11.w;
  r7.w = r8.x + -r8.z;
  r13.xyzw = t9.Sample(s4_s, r1.xz).xyzw;
  r14.xyzw = t7.Sample(s4_s, r1.xz).xyzw;
  r1.x = r13.z * r12.w;
  r1.x = r1.x * r7.w + r8.z;
  r1.z = r1.x * r6.w + r11.w;
  r1.x = cb0[42].x * r1.x;
  r1.x = r1.x * r0.z;
  r1.x = max(r14.x, r1.x);
  r1.x = dot(r1.xx, r2.zz);
  r1.x = r1.x * r10.z;
  r2.z = 1 + -cb0[20].y;
  r2.z = max(r2.z, r1.z);
  r6.w = -r0.w * r2.z + 1;
  r0.w = r2.z * r0.w;
  r11.xyzw = t5.Sample(s5_s, r0.ww).xyzw;
  r2.z = r11.x + r11.x;
  r8.xz = float2(1,1) + -r11.xy;
  r7.w = r8.x + r8.x;
  r7.w = -r7.w * r8.z + 1;
  r2.z = r2.z * r11.y + -r7.w;
  r8.x = cmp(0.5 >= r11.x);
  r8.z = 0.75 * r11.y;
  r8.z = log2(r8.z);
  r8.z = 0.75 * r8.z;
  r8.z = exp2(r8.z);
  r8.z = min(1, r8.z);
  r8.z = max(r8.z, r4.z);
  r4.z = saturate(50 * r4.z);
  r8.x = r8.x ? 1.000000 : 0;
  r2.z = r8.x * r2.z + r7.w;
  r7.w = 1 + -r2.z;
  r7.w = r7.w + r7.w;
  r6.w = -r7.w * r6.w + 1;
  r7.w = r2.z + r2.z;
  r2.z = cmp(0.5 >= r2.z);
  r2.z = r2.z ? 1.000000 : 0;
  r7.w = r7.w * r0.w + -r6.w;
  r2.z = r2.z * r7.w + r6.w;
  r2.z = max(r2.z, r0.w);
  r6.w = 1 + -r7.z;
  r7.z = 5 * r7.z;
  r7.z = log2(r7.z);
  r7.z = 1.5 * r7.z;
  r7.z = exp2(r7.z);
  r7.z = min(1, r7.z);
  r7.z = 1 + -r7.z;
  r0.w = r7.z * r0.w;
  r6.w = log2(r6.w);
  r6.w = 100 * r6.w;
  r6.w = exp2(r6.w);
  r6.w = cb0[42].x * -r6.w + 1;
  r7.z = cb0[9].x * r0.z;
  r7.z = max(r7.z, r13.z);
  r7.w = cb0[42].x * r0.z;
  r7.w = max(r13.z, r7.w);
  r7.z = max(r7.w, r7.z);
  r6.w = r7.z * r6.w;
  r1.w = max(r6.w, r1.w);
  r6.w = cb0[23].y + -cb0[23].x;
  r1.y = saturate(r1.y / r6.w);
  r1.w = r1.w * r1.y;
  r6.w = r2.z * r1.w;
  r6.w = r6.w * r1.y;
  r7.z = 0.5 * r4.z;
  r4.z = -r4.z * 0.5 + 1;
  r7.z = dot(r7.zz, r2.zz);
  r7.w = 1 + -r2.z;
  r2.z = cmp(0.5 >= r2.z);
  r2.z = r2.z ? 1.000000 : 0;
  r7.w = r7.w + r7.w;
  r4.z = -r7.w * r4.z + 1;
  r7.z = r7.z + -r4.z;
  r2.z = r2.z * r7.z + r4.z;
  r4.z = log2(r10.y);
  r7.z = 1 + -r10.y;
  r7.z = cb0[51].w * r7.z;
  r4.z = 15 * r4.z;
  r4.z = exp2(r4.z);
  r4.z = min(1, r4.z);
  r2.z = r4.z * r2.z;
  r2.z = r2.z * r1.y + -r6.w;
  r4.z = saturate(cb0[9].x);
  r2.z = r4.z * r2.z + r6.w;
  r4.z = cb0[14].z * r2.z;
  r4.z = log2(r4.z);
  r4.z = cb0[14].z * r4.z;
  r4.z = exp2(r4.z);
  r4.z = min(1, r4.z);
  r4.z = 1 + -r4.z;
  r4.z = cb0[14].x * r4.z;
  r4.z = saturate(cb0[9].x * r4.z);
  r4.xyz = r4.zzz * r4.xyw + r9.xzw;
  r9.xzw = cb0[54].xyz + -cb0[50].xyz;
  r9.xzw = cb0[55].xxx * r9.xzw + cb0[50].xyz;
  r10.xyz = cb0[51].xyz + -r9.xzw;
  r9.xzw = r7.zzz * r10.xyz + r9.xzw;
  r10.xyz = log2(r9.xzw);
  r10.xyz = float3(0.300000012,0.300000012,0.300000012) * r10.xyz;
  r10.xyz = exp2(r10.xyz);
  r10.xyz = r10.xyz * float3(1,0.150000006,0.150000006) + -r9.xzw;
  r9.xzw = cb0[55].xxx * r10.xyz + r9.xzw;
  r4.w = cmp(r9.z >= r9.w);
  r4.w = r4.w ? 1.000000 : 0;
  r10.xy = r9.wz;
  r11.xy = -r10.xy + r9.zw;
  r10.zw = float2(-1,0.666666687);
  r11.zw = float2(1,-1);
  r10.xyzw = r4.wwww * r11.xywz + r10.xywz;
  r4.w = cmp(r9.x >= r10.x);
  r4.w = r4.w ? 1.000000 : 0;
  r11.z = r10.w;
  r10.w = r9.x;
  r9.xzw = r9.xzw * r5.yyy;
  r11.xyw = r10.wyx;
  r11.xyzw = r11.xyzw + -r10.xyzw;
  r10.xyzw = r4.wwww * r11.xyzw + r10.xyzw;
  r4.w = min(r10.w, r10.y);
  r4.w = r10.x + -r4.w;
  r5.y = r4.w * 6 + 1.00000001e-10;
  r6.w = r10.w + -r10.y;
  r5.y = r6.w / r5.y;
  r5.y = r10.z + r5.y;
  r6.w = r8.z * 2 + -1;
  r7.z = r8.z * 1.20000005 + -1;
  r7.z = r7.z * -0.5 + r10.x;
  r7.w = 1.00000001e-10 + r10.x;
  r4.w = r4.w / r7.w;
  r7.w = 0.0500000007 * r6.w;
  r7.w = frac(r7.w);
  r5.y = r7.w + abs(r5.y);
  r8.xzw = float3(1,0.666666687,0.333333343) + r5.yyy;
  r8.xzw = frac(r8.xzw);
  r8.xzw = r8.xzw * float3(6,6,6) + float3(-3,-3,-3);
  r8.xzw = saturate(float3(-1,-1,-1) + abs(r8.xzw));
  r8.xzw = float3(-1,-1,-1) + r8.xzw;
  r10.xyzw = cb0[55].xxxx * float4(-0.100000009,0.25,-4,-0.145000011) + float4(0.150000006,0.75,5,0.245000005);
  r4.w = r6.w * r10.x + r4.w;
  r8.xzw = r4.www * r8.xzw + float3(1,1,1);
  r11.xyz = r7.zzz * r8.xzw + -r4.xyz;
  r4.xyz = r2.zzz * r11.xyz + r4.xyz;
  r8.xzw = r7.zzz * r8.xzw + float3(-1,-1,-1);
  r8.xzw = r0.www * r8.xzw + float3(1,1,1);
  r9.xzw = r5.xxx * r4.xyz + r9.xzw;
  r4.xyz = r9.xzw * float3(5,5,5) + r4.xyz;
  r0.w = cmp(r4.y >= r4.z);
  r0.w = r0.w ? 1.000000 : 0;
  r11.xy = r4.zy;
  r15.xy = -r11.xy + r4.yz;
  r11.zw = float2(-1,0.666666687);
  r15.zw = float2(1,-1);
  r11.xyzw = r0.wwww * r15.xywz + r11.xywz;
  r0.w = cmp(r4.x >= r11.x);
  r0.w = r0.w ? 1.000000 : 0;
  r15.z = r11.w;
  r11.w = r4.x;
  r15.xyw = r11.wyx;
  r15.xyzw = r15.xyzw + -r11.xyzw;
  r11.xyzw = r0.wwww * r15.xyzw + r11.xyzw;
  r0.w = min(r11.w, r11.y);
  r0.w = r11.x + -r0.w;
  r2.z = r0.w * 6 + 1.00000001e-10;
  r4.w = r11.w + -r11.y;
  r2.z = r4.w / r2.z;
  r2.z = r11.z + r2.z;
  r4.w = dot(r6.yz, r6.yz);
  r4.w = sqrt(r4.w);
  r4.w = 1 + -r4.w;
  r4.w = log2(r4.w);
  r4.w = r10.z * r4.w;
  r4.w = exp2(r4.w);
  r4.w = min(1, r4.w);
  r4.w = min(r4.w, r10.y);
  r5.x = 1 + -r4.w;
  r5.x = 1.75 * r5.x;
  r5.x = log2(r5.x);
  r5.x = 1.5 * r5.x;
  r5.x = exp2(r5.x);
  r5.x = min(1, r5.x);
  r5.x = r5.x + -r4.w;
  r4.w = cb0[55].x * r5.x + r4.w;
  r5.x = r4.w * 2 + -1;
  r2.z = r5.x * r10.w + abs(r2.z);
  r2.z = frac(r2.z);
  r9.xzw = float3(1,0.666666687,0.333333343) + r2.zzz;
  r9.xzw = frac(r9.xzw);
  r9.xzw = r9.xzw * float3(6,6,6) + float3(-3,-3,-3);
  r9.xzw = saturate(float3(-1,-1,-1) + abs(r9.xzw));
  r9.xzw = float3(-1,-1,-1) + r9.xzw;
  r2.z = 1.00000001e-10 + r11.x;
  r0.w = r0.w / r2.z;
  r5.xy = cb0[55].xx * float2(-2.05999994,0.649999976) + float2(0.0599999987,0.100000001);
  r0.w = saturate(r4.w * r5.x + r0.w);
  r2.z = saturate(r4.w * r5.y + r11.x);
  r1.w = r4.w * r1.w;
  r9.xzw = r0.www * r9.xzw + float3(1,1,1);
  r9.xzw = r2.zzz * r9.xzw + -r4.xyz;
  r0.w = saturate(cb0[42].x);
  r0.w = r1.w * r0.w;
  r0.x = r0.w * r0.x;
  r4.xyz = r0.xxx * r9.xzw + r4.xyz;
  r10.xyzw = cb0[31].wxyz + -cb0[30].wxyz;
  r9.xzw = r14.yyy * r10.yzw + cb0[30].xyz;
  r0.x = r13.z * r10.x + cb0[30].w;
  r0.x = r1.x * r0.x;
  r0.x = r0.x * r1.y;
  r0.x = max(0, r0.x);
  r0.x = cb0[29].x * r0.x;
  r0.x = -r0.x * r0.x;
  r0.x = exp2(r0.x);
  r0.w = dot(r9.xzw, float3(0.0396819152,0.45802179,0.00609653955));
  r10.xyz = r0.www + -r9.xzw;
  r9.xzw = cb0[55].xxx * r10.xyz + r9.xzw;
  r4.xyz = -r9.xzw + r4.xyz;
  r4.xyz = r0.xxx * r4.xyz + r9.xzw;
  r0.x = 1 + -r1.y;
  r0.w = max(cb0[42].x, r1.y);
  r0.w = min(1, r0.w);
  r0.x = cb0[55].x * r0.x;
  r0.x = r0.x * r0.z;
  r1.xyw = r0.xxx * r8.xzw;
  r3.xyz = r1.xyw * cb0[42].xxx + r4.xyz;
  r0.x = dot(cb3[0].xyz, float3(0.0396819152,0.45802179,0.00609653955));
  r4.xyzw = -cb3[0].xyzw + r0.xxxx;
  r4.xyzw = cb0[55].xxxx * r4.xyzw + cb3[0].xyzw;
  r4.xyzw = r4.xyzw + -r3.xyzw;
  r0.x = dot(r0.yy, r5.ww);
  r0.z = 1 + -r0.y;
  r0.z = -r2.w * r0.z + 1;
  r0.x = r0.x + -r0.z;
  r1.x = cmp(0.5 >= r5.w);
  r1.x = r1.x ? 1.000000 : 0;
  r0.x = r1.x * r0.x + r0.z;
  r0.x = r0.x + -r0.y;
  r0.z = cb0[41].y * 0.5 + 0.5;
  r0.z = saturate(10 * r0.z);
  r0.z = 1 + -r0.z;
  r0.x = r0.z * r0.x + r0.y;
  r0.x = -cb0[17].z + r0.x;
  r0.y = cb0[17].w + -cb0[17].z;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.y = -cb0[17].y + r5.w;
  r1.x = 1 + -cb0[17].y;
  r1.x = 1 / r1.x;
  r0.y = saturate(r1.x * r0.y);
  r1.x = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r1.x * r0.y;
  r0.x = r0.x * r0.y;
  r0.x = cb0[17].x * r0.x;
  r0.y = cb0[25].y + -cb0[25].x;
  r0.y = 1 / r0.y;
  r1.x = -cb2[20].y + -cb0[25].x;
  r0.y = saturate(r1.x * r0.y);
  r1.x = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = -r1.x * r0.y + 1;
  r1.x = 1 + -r0.y;
  r0.y = r0.z * r1.x + r0.y;
  r0.z = -r0.x * r0.y + 1;
  r0.x = r0.x * r0.y;
  r0.y = r12.y + r12.y;
  r1.x = 1 + -r7.y;
  r1.y = 1 + -r12.y;
  r1.y = r1.y + r1.y;
  r1.x = -r1.y * r1.x + 1;
  r0.y = r0.y * r7.y + -r1.x;
  r1.y = cmp(0.5 >= r12.y);
  r1.y = r1.y ? 1.000000 : 0;
  r0.y = r1.y * r0.y + r1.x;
  r1.x = r9.y + r9.y;
  r1.y = 1 + -r9.y;
  r1.w = cmp(0.5 >= r9.y);
  r1.w = r1.w ? 1.000000 : 0;
  r1.y = r1.y + r1.y;
  r2.z = 1 + -r1.z;
  r1.y = -r1.y * r2.z + 1;
  r1.x = r1.x * r1.z + -r1.y;
  r1.x = r1.w * r1.x + r1.y;
  r1.x = r1.x + -r0.y;
  r0.y = r8.y * r1.x + r0.y;
  r1.x = 1 + -r0.y;
  r1.x = r1.x + r1.x;
  r0.z = -r1.x * r0.z + 1;
  r1.x = r0.y + r0.y;
  r0.y = cmp(0.5 >= r0.y);
  r0.y = r0.y ? 1.000000 : 0;
  r1.x = r1.x * r0.x + -r0.z;
  r0.y = r0.y * r1.x + r0.z;
  r0.x = r0.w * r0.y + r0.x;
  r0.xyzw = r0.xxxx * r4.xyzw + r3.xyzw;
  r1.x = saturate(cb0[9].x + cb0[9].x);
  r1.x = r6.x * r1.x;
  r1.xy = r1.xx * r5.zw;
  r3.xyzw = t6.Sample(s2_s, r5.zw).xyzw;
  r1.xy = -r1.xy * cb0[53].zz + r6.yz;
  r1.xy = float2(0.5,0.5) + r1.xy;
  r1.xyzw = t2.Sample(s0_s, r1.xy).xyzw;

  r1.rgb = renodx::draw::InvertIntermediatePass(r1.rgb);

  //float3 tonemapped = r1.rgb;
  //float3 neutralSdr = renodx::tonemap::renodrt::NeutralSDR(tonemapped);
  //r1.rgb = neutralSdr;

  r4.xyzw = r2.xxxx * -cb0[15].xyzw + cb0[15].xyzw;
  r2.x = cb0[15].w * r2.y;
  r2.x = max(cb0[55].x, r2.x);
  r1.xyzw = r4.xyzw * r1.xyzw;
  r1.xyzw = r1.xyzw * r0.xyzw;
  r1.xyzw = cb0[53].wwww * r1.xyzw;
  r1.xyzw = r1.xyzw * r7.xxxx;
  r1.xyzw = r1.xyzw * r12.xyzw;
  r1.xyzw = r0.xyzw * r7.xxxx + r1.xyzw;
  r2.y = dot(r1.xyz, float3(0.0396819152,0.45802179,0.00609653955));
  r4.xyzw = r2.yyyy + -r1.xyzw;
  r1.xyzw = r2.xxxx * r4.xyzw + r1.xyzw;
  r1.xyzw = r1.xyzw + -r0.xyzw;
  r2.x = 3.14159274 * r7.x;
  r2.x = sin(r2.x);
  r2.x = r7.x * r2.x;
  r0.xyzw = r2.xxxx * r1.xyzw + r0.xyzw;
  r1.xyz = r3.xyz + -r0.xyz;
  r1.w = cb0[3].w * r3.w;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  
  //o0.w = r0.w;
  //r0.xyz = log2(r0.xyz);
  //r0.xyz = cb0[57].xxx * r0.xyz;
  //o0.xyz = exp2(r0.xyz);
  
  o0.rgb = renodx::math::SignPow(r0.xyz, cb0[57].x);
  
  o0.w = r0.w;

  //o0.rgb = renodx::tonemap::UpgradeToneMap(
  //  tonemapped,
  //  neutralSdr,
  //  o0.rgb,
  //  1.f
  //);

  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);
  
  return;
}