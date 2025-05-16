#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Sat May 10 16:32:44 2025
Texture2D<float4> t8 : register(t8);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

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
  r1.xyzw = t1.Sample(s2_s, v1.zw).xyzw;
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
  r1.w = log2(r0.x);
  r4.xy = float2(2.5,7.5) * r1.ww;
  r4.xy = exp2(r4.xy);
  r4.xy = r4.xy * r2.zz;
  r1.w = r4.x + r4.x;
  r1.w = max(cb0[9].x, r1.w);
  r4.zw = float2(-0.5,-0.5) + v6.xy;
  r2.w = dot(r4.zw, r4.zw);
  r2.w = sqrt(r2.w);
  r1.w = r2.w * r1.w;
  r5.xy = r1.ww * r4.zw;
  r5.xy = -r5.xy * float2(0.00999999978,0.00999999978) + r4.zw;
  r4.zw = r4.zw + r4.zw;
  r1.w = dot(r4.zw, r4.zw);
  r4.zw = float2(0.5,0.5) + r5.xy;
  r6.xyz = float3(0.5,0.5,1) + -r4.zww;
  r5.z = dot(r6.xy, r6.xy);
  r5.z = rsqrt(r5.z);
  r5.w = r0.x * r2.z;
  r6.w = r5.w * 2 + -1;
  r6.w = 50 * r6.w;
  r7.xyzw = float4(2.5,5,15,7.5) * r5.wwww;
  r5.w = 10 * r5.w;
  r7.xyw = min(float3(1,1,1), r7.xyw);
  r6.w = r7.y * r6.w;
  r6.xy = r6.xy * r5.zz + r6.ww;
  r5.z = r6.z + r6.z;
  r8.xyzw = t3.Sample(s6_s, r4.zw).xyzw;
  r6.z = dot(r8.xyzw, r8.xyzw);
  r6.z = rsqrt(r6.z);
  r6.zw = r8.xy * r6.zz;
  r6.xy = r6.zw * float2(0.699999988,0.699999988) + r6.xy;
  r6.z = dot(r6.xy, r6.xy);
  r6.z = rsqrt(r6.z);
  r6.xy = r6.xy * r6.zz;
  r6.z = 5 * cb0[9].y;
  r6.z = max(cb0[42].w, r6.z);
  r6.z = max(r6.z, r7.z);
  r6.xy = r6.xy * r6.zz;
  sincos(cb0[41].w, r8.x, r9.x);
  r10.x = -r8.x;
  r10.y = r9.x;
  r10.z = r8.x;
  r8.x = dot(r6.yx, r10.yz);
  r6.x = dot(r6.yx, r10.xy);
  r8.y = -r6.x;
  r6.x = saturate(max(cb0[42].x, cb0[9].x));
  r6.yz = -r8.xy * r6.xx + r1.xz;
  r8.xyzw = r8.xyxy * r6.xxxx;
  r6.x = 15 + r1.y;
  r6.x = saturate(0.200000003 * r6.x);
  r6.yz = r6.xx * r6.yz + r8.zw;
  r6.yz = cb0[18].zz * r6.yz;
  r9.xyzw = t4.Sample(s5_s, r6.yz).xyzw;
  r6.yz = float2(5,5) * r6.yz;
  r10.xyzw = t4.Sample(s5_s, r6.yz).xyzw;
  r6.y = -0.5 + r9.z;
  r6.y = r6.x * r6.y + 0.5;
  r6.z = 1 + -r6.y;
  r6.w = cb0[11].x * r1.w;
  r7.y = max(cb0[9].x, r7.x);
  r6.w = saturate(r7.y * r6.w);
  r7.z = 1 + -r6.w;
  r7.z = r7.z + r7.z;
  r6.z = -r7.z * r6.z + 1;
  r6.y = dot(r6.yy, r6.ww);
  r6.w = cmp(0.5 >= r6.w);
  r6.w = r6.w ? 1.000000 : 0;
  r6.y = r6.y + -r6.z;
  r6.y = r6.w * r6.y + r6.z;
  r6.z = 1 + -r6.y;
  r6.z = r6.z + r6.z;
  r6.w = -0.75 + r10.z;
  r6.x = r6.x * r6.w + 0.75;
  r6.w = 1 + -r6.x;
  r6.x = dot(r6.xx, r6.yy);
  r6.y = cmp(0.5 >= r6.y);
  r6.y = r6.y ? 1.000000 : 0;
  r6.z = -r6.z * r6.w + 1;
  r6.x = r6.x + -r6.z;
  r6.x = r6.y * r6.x + r6.z;
  r6.y = log2(r9.x);
  r6.y = r9.x * r6.y;
  r6.y = exp2(r6.y);
  r6.z = min(1, r6.y);
  r6.y = saturate(dot(r6.yy, cb0[42].yy));
  r6.w = -1 + cb0[11].y;
  r11.xyzw = t0.Sample(s1_s, v6.xy).xyzw;
  r7.z = -1 + r11.y;
  r6.w = r7.z / r6.w;
  r6.w = saturate(0.5 + r6.w);
  r6.z = r6.z * r6.w;
  r6.w = 0.5 * r1.w;
  r1.w = log2(r1.w);
  r1.w = cb0[42].z * r1.w;
  r1.w = exp2(r1.w);
  r1.w = min(1, r1.w);
  r6.w = min(1, r6.w);
  r6.z = r6.z * r6.w + r6.x;
  r6.z = r6.z * r7.y;
  r7.y = r11.w * 2 + -1;
  r7.y = max(0, r7.y);
  r6.z = saturate(r7.y * r6.z);
  r7.y = 12 + -cb0[16].x;
  r7.z = -cb0[16].x + r1.y;
  r7.y = r7.z / r7.y;
  r7.y = -1 + r7.y;
  r7.y = saturate(cb0[42].y * 2 + r7.y);
  r6.y = r7.y * r6.y;
  r1.w = r6.y * r1.w;
  r1.w = max(r1.w, r6.z);
  r6.y = r0.x * r0.x;
  r6.y = r6.y * r6.y;
  r0.x = r6.y * r0.x;
  r0.x = r0.x * r2.z;
  r0.x = max(r1.w, r0.x);
  r1.w = 3.14159274 * r0.x;
  r0.x = r0.z * r0.x;
  r1.w = sin(r1.w);
  r9.xzw = cb0[43].xyz * r0.yyy;
  r10.xzw = -r0.yyy * cb0[43].xyz + r0.www;
  r9.xzw = r1.www * r10.xzw + r9.xzw;
  r9.xzw = r9.xzw * float3(0.5,0.5,0.5) + float3(0.5,0.5,0.5);
  r2.z = cb0[53].x * r0.w;
  r10.xzw = r0.www + -r3.xyz;
  r10.xzw = r1.www * r10.xzw + r3.xyz;
  r0.w = log2(r2.z);
  r0.w = cb0[53].y * r0.w;
  r0.w = exp2(r0.w);
  r0.w = min(1, r0.w);
  r1.w = -r6.z * r0.w + 1;
  r1.w = r1.w + r1.w;
  r2.z = 1 + -r0.w;
  r1.w = -r1.w * r2.z + 1;
  r2.z = r6.z * r0.w;
  r6.y = r2.z + r2.z;
  r2.z = cmp(0.5 >= r2.z);
  r2.z = r2.z ? 1.000000 : 0;
  r0.w = r6.y * r0.w + -r1.w;
  r0.w = r2.z * r0.w + r1.w;
  r9.xzw = r9.xzw + r0.www;
  r9.xzw = r9.xzw * cb0[43].xyz + -r10.xzw;
  r9.xzw = r0.xxx * r9.xzw + r10.xzw;
  r9.xzw = r9.xzw + -r3.xyz;
  r9.xzw = r0.zzz * r9.xzw + r3.xyz;
  r10.xzw = r9.xzw * cb0[27].yyy + -r9.xzw;
  r7.yzw = r7.www * r10.xzw + r9.xzw;
  r0.x = 1 + -r7.x;
  r9.xzw = r7.yzw * r2.yyy + -r7.yzw;
  r12.xyzw = cb1[0].yyyy * cb0[21].xzxz;
  r8.xyzw = r12.xyzw * cb0[22].xxxx + r8.xyzw;
  r12.xyzw = cb0[19].yyww * r8.xyzw;
  r8.xy = cb0[18].ww * r8.zw;
  r8.xy = r1.xz * cb0[18].zz + -r8.xy;
  r8.xyzw = t4.Sample(s5_s, r8.xy).xyzw;
  r12.xyzw = r1.xzxz * cb0[19].xxzz + -r12.xyzw;
  r13.xyzw = t4.Sample(s5_s, r12.xy).xyzw;
  r0.w = cb0[20].x * cb0[18].x;
  r1.w = -cb0[18].x * cb0[20].x + cb0[18].x;
  r0.w = r13.x * r1.w + r0.w;
  r1.xz = -cb0[35].zw + r1.xz;
  r1.xz = -cb0[35].xx + r1.xz;
  r1.xz = r1.xz / -cb0[35].xx;
  r1.xz = float2(1,1) + -r1.xz;
  r14.xyzw = t7.Sample(s3_s, r1.xz).xyzw;
  r0.w = r14.x * cb0[16].x + r0.w;
  r1.w = r14.x * cb0[16].x + cb0[26].x;
  r1.w = cb0[16].y + r1.w;
  r1.w = r1.y + -r1.w;
  r1.w = min(0, r1.w);
  r1.w = r1.w * r1.w;
  r0.w = cb0[16].y + r0.w;
  r0.w = r1.y + -r0.w;
  r1.y = -cb0[23].x + r1.y;
  r0.w = min(0, r0.w);
  r0.w = r0.w * r0.w;
  r2.z = r0.y * v2.y + 9.99999975e-06;
  r0.w = r0.w / abs(r2.z);
  r1.w = r1.w / abs(r2.z);
  r10.xzw = v2.xyz * r0.yyy;
  r11.xzw = cb0[18].yyy * r10.xzw;
  r10.xzw = cb0[26].www * r10.xzw;
  r2.z = dot(r10.xzw, r10.xzw);
  r2.z = sqrt(r2.z);
  r1.w = r2.z * r1.w;
  r2.z = dot(r11.xzw, r11.xzw);
  r2.z = sqrt(r2.z);
  r0.w = r2.z * r0.w;
  r0.w = r0.w * r8.x;
  r2.z = 0.699999988 + cb2[20].y;
  r2.z = saturate(1.42857146 * r2.z);
  r6.y = r2.z * -2 + 3;
  r2.z = r2.z * r2.z;
  r2.z = r6.y * r2.z;
  r10.xz = r2.zz * float2(-0.899999976,-0.99000001) + float2(1,1);
  r0.w = r10.x * r0.w;
  r0.w = max(0, r0.w);
  r0.w = cb0[29].x * r0.w;
  r0.w = -r0.w * r0.w;
  r0.w = exp2(r0.w);
  r0.w = 1 + -r0.w;
  r12.y = r8.x;
  r12.x = r13.x;
  r10.xw = r12.xy * cb0[20].ww + r12.zw;
  r12.xyzw = t4.Sample(s5_s, r10.xw).xyzw;
  r2.z = r12.y + -r12.w;
  r6.y = r8.x + -r8.z;
  r14.xyzw = t8.Sample(s3_s, r1.xz).xyzw;
  r15.xyzw = t6.Sample(s3_s, r1.xz).xyzw;
  r1.x = r14.z * r13.w;
  r1.x = r1.x * r6.y + r8.z;
  r1.z = r1.x * r2.z + r12.w;
  r1.x = cb0[42].x * r1.x;
  r1.x = r1.x * r0.z;
  r1.x = max(r15.x, r1.x);
  r1.x = dot(r1.xx, r1.ww);
  r1.x = r1.x * r10.z;
  r1.w = 1 + -cb0[20].y;
  r1.w = max(r1.z, r1.w);
  r2.z = -r0.w * r1.w + 1;
  r0.w = r1.w * r0.w;
  r12.xyzw = t5.Sample(s4_s, r0.ww).xyzw;
  r1.w = r12.x + r12.x;
  r8.xz = float2(1,1) + -r12.xy;
  r6.y = r8.x + r8.x;
  r6.y = -r6.y * r8.z + 1;
  r1.w = r1.w * r12.y + -r6.y;
  r7.x = cmp(0.5 >= r12.x);
  r8.x = 0.75 * r12.y;
  r8.x = log2(r8.x);
  r8.x = 0.75 * r8.x;
  r8.x = exp2(r8.x);
  r8.x = min(1, r8.x);
  r8.x = max(r8.x, r6.x);
  r6.x = saturate(50 * r6.x);
  r7.x = r7.x ? 1.000000 : 0;
  r1.w = r7.x * r1.w + r6.y;
  r6.y = 1 + -r1.w;
  r6.y = r6.y + r6.y;
  r2.z = -r6.y * r2.z + 1;
  r6.y = r1.w + r1.w;
  r1.w = cmp(0.5 >= r1.w);
  r1.w = r1.w ? 1.000000 : 0;
  r6.y = r6.y * r0.w + -r2.z;
  r1.w = r1.w * r6.y + r2.z;
  r1.w = max(r1.w, r0.w);
  r2.z = 1 + -r6.w;
  r6.y = 5 * r6.w;
  r6.y = log2(r6.y);
  r6.y = 1.5 * r6.y;
  r6.y = exp2(r6.y);
  r6.y = min(1, r6.y);
  r6.y = 1 + -r6.y;
  r0.w = r6.y * r0.w;
  r2.z = log2(r2.z);
  r2.z = 100 * r2.z;
  r2.z = exp2(r2.z);
  r2.z = cb0[42].x * -r2.z + 1;
  r6.y = cb0[9].x * r0.z;
  r6.y = max(r6.y, r14.z);
  r6.w = cb0[42].x * r0.z;
  r6.w = max(r14.z, r6.w);
  r6.y = max(r6.w, r6.y);
  r2.z = r6.y * r2.z;
  r2.z = max(r2.z, r5.w);
  r5.w = cb0[23].y + -cb0[23].x;
  r1.y = saturate(r1.y / r5.w);
  r2.z = r2.z * r1.y;
  r5.w = r2.z * r1.w;
  r5.w = r5.w * r1.y;
  r6.y = 0.5 * r6.x;
  r6.x = -r6.x * 0.5 + 1;
  r6.y = dot(r6.yy, r1.ww);
  r6.w = 1 + -r1.w;
  r1.w = cmp(0.5 >= r1.w);
  r1.w = r1.w ? 1.000000 : 0;
  r6.w = r6.w + r6.w;
  r6.x = -r6.w * r6.x + 1;
  r6.y = r6.y + -r6.x;
  r1.w = r1.w * r6.y + r6.x;
  r6.x = log2(r11.y);
  r6.y = 1 + -r11.y;
  r6.y = cb0[51].w * r6.y;
  r6.x = 15 * r6.x;
  r6.x = exp2(r6.x);
  r6.x = min(1, r6.x);
  r1.w = r6.x * r1.w;
  r1.w = r1.w * r1.y + -r5.w;
  r6.x = saturate(cb0[9].x);
  r1.w = r6.x * r1.w + r5.w;
  r5.w = cb0[14].z * r1.w;
  r5.w = log2(r5.w);
  r5.w = cb0[14].z * r5.w;
  r5.w = exp2(r5.w);
  r5.w = min(1, r5.w);
  r5.w = 1 + -r5.w;
  r5.w = cb0[14].x * r5.w;
  r5.w = saturate(cb0[9].x * r5.w);
  r7.xyz = r5.www * r9.xzw + r7.yzw;
  r9.xzw = cb0[54].xyz + -cb0[50].xyz;
  r9.xzw = cb0[55].xxx * r9.xzw + cb0[50].xyz;
  r10.xzw = cb0[51].xyz + -r9.xzw;
  r6.xyw = r6.yyy * r10.xzw + r9.xzw;
  r9.xzw = log2(r6.xyw);
  r9.xzw = float3(0.300000012,0.300000012,0.300000012) * r9.xzw;
  r9.xzw = exp2(r9.xzw);
  r9.xzw = r9.xzw * float3(1,0.150000006,0.150000006) + -r6.xyw;
  r6.xyw = cb0[55].xxx * r9.xzw + r6.xyw;
  r5.w = cmp(r6.y >= r6.w);
  r5.w = r5.w ? 1.000000 : 0;
  r11.xy = r6.wy;
  r12.xy = -r11.xy + r6.yw;
  r11.zw = float2(-1,0.666666687);
  r12.zw = float2(1,-1);
  r11.xyzw = r5.wwww * r12.xywz + r11.xywz;
  r5.w = cmp(r6.x >= r11.x);
  r5.w = r5.w ? 1.000000 : 0;
  r12.z = r11.w;
  r11.w = r6.x;
  r6.xyw = r6.xyw * r4.yyy;
  r12.xyw = r11.wyx;
  r12.xyzw = r12.xyzw + -r11.xyzw;
  r11.xyzw = r5.wwww * r12.xyzw + r11.xyzw;
  r4.y = min(r11.w, r11.y);
  r4.y = r11.x + -r4.y;
  r5.w = r4.y * 6 + 1.00000001e-10;
  r7.w = r11.w + -r11.y;
  r5.w = r7.w / r5.w;
  r5.w = r11.z + r5.w;
  r7.w = r8.x * 2 + -1;
  r8.x = r8.x * 1.20000005 + -1;
  r8.x = r8.x * -0.5 + r11.x;
  r8.z = 1.00000001e-10 + r11.x;
  r4.y = r4.y / r8.z;
  r8.z = 0.0500000007 * r7.w;
  r8.z = frac(r8.z);
  r5.w = r8.z + abs(r5.w);
  r9.xzw = float3(1,0.666666687,0.333333343) + r5.www;
  r9.xzw = frac(r9.xzw);
  r9.xzw = r9.xzw * float3(6,6,6) + float3(-3,-3,-3);
  r9.xzw = saturate(float3(-1,-1,-1) + abs(r9.xzw));
  r9.xzw = float3(-1,-1,-1) + r9.xzw;
  r11.xyzw = cb0[55].xxxx * float4(-0.100000009,0.25,-4,-0.145000011) + float4(0.150000006,0.75,5,0.245000005);
  r4.y = r7.w * r11.x + r4.y;
  r9.xzw = r4.yyy * r9.xzw + float3(1,1,1);
  r10.xzw = r8.xxx * r9.xzw + -r7.xyz;
  r7.xyz = r1.www * r10.xzw + r7.xyz;
  r8.xzw = r8.xxx * r9.xzw + float3(-1,-1,-1);
  r8.xzw = r0.www * r8.xzw + float3(1,1,1);
  r6.xyw = r4.xxx * r7.xyz + r6.xyw;
  r6.xyw = r6.xyw * float3(5,5,5) + r7.xyz;
  r0.w = cmp(r6.y >= r6.w);
  r0.w = r0.w ? 1.000000 : 0;
  r7.xy = r6.wy;
  r12.xy = -r7.xy + r6.yw;
  r7.zw = float2(-1,0.666666687);
  r12.zw = float2(1,-1);
  r7.xyzw = r0.wwww * r12.xywz + r7.xywz;
  r0.w = cmp(r6.x >= r7.x);
  r0.w = r0.w ? 1.000000 : 0;
  r12.z = r7.w;
  r7.w = r6.x;
  r12.xyw = r7.wyx;
  r12.xyzw = r12.xyzw + -r7.xyzw;
  r7.xyzw = r0.wwww * r12.xyzw + r7.xyzw;
  r0.w = min(r7.w, r7.y);
  r0.w = r7.x + -r0.w;
  r1.w = r0.w * 6 + 1.00000001e-10;
  r4.x = r7.w + -r7.y;
  r1.w = r4.x / r1.w;
  r1.w = r7.z + r1.w;
  r4.x = dot(r5.xy, r5.xy);
  r4.x = sqrt(r4.x);
  r4.x = 1 + -r4.x;
  r4.x = log2(r4.x);
  r4.x = r11.z * r4.x;
  r4.x = exp2(r4.x);
  r4.x = min(1, r4.x);
  r4.x = min(r4.x, r11.y);
  r4.y = 1 + -r4.x;
  r4.y = 1.75 * r4.y;
  r4.y = log2(r4.y);
  r4.y = 1.5 * r4.y;
  r4.y = exp2(r4.y);
  r4.y = min(1, r4.y);
  r4.y = r4.y + -r4.x;
  r4.x = cb0[55].x * r4.y + r4.x;
  r4.y = r4.x * 2 + -1;
  r1.w = r4.y * r11.w + abs(r1.w);
  r1.w = frac(r1.w);
  r7.yzw = float3(1,0.666666687,0.333333343) + r1.www;
  r7.yzw = frac(r7.yzw);
  r7.yzw = r7.yzw * float3(6,6,6) + float3(-3,-3,-3);
  r7.yzw = saturate(float3(-1,-1,-1) + abs(r7.yzw));
  r7.yzw = float3(-1,-1,-1) + r7.yzw;
  r1.w = 1.00000001e-10 + r7.x;
  r0.w = r0.w / r1.w;
  r9.xz = cb0[55].xx * float2(-2.05999994,0.649999976) + float2(0.0599999987,0.100000001);
  r0.w = saturate(r4.x * r9.x + r0.w);
  r1.w = saturate(r4.x * r9.z + r7.x);
  r2.z = r4.x * r2.z;
  r7.xyz = r0.www * r7.yzw + float3(1,1,1);
  r7.xyz = r1.www * r7.xyz + -r6.xyw;
  r0.w = saturate(cb0[42].x);
  r0.w = r2.z * r0.w;
  r0.x = r0.w * r0.x;
  r6.xyw = r0.xxx * r7.xyz + r6.xyw;
  r7.xyzw = cb0[31].wxyz + -cb0[30].wxyz;
  r7.yzw = r15.yyy * r7.yzw + cb0[30].xyz;
  r0.x = r14.z * r7.x + cb0[30].w;
  r0.x = r1.x * r0.x;
  r0.x = r0.x * r1.y;
  r0.x = max(0, r0.x);
  r0.x = cb0[29].x * r0.x;
  r0.x = -r0.x * r0.x;
  r0.x = exp2(r0.x);
  r0.w = dot(r7.yzw, float3(0.0396819152,0.45802179,0.00609653955));
  r9.xzw = r0.www + -r7.yzw;
  r7.xyz = cb0[55].xxx * r9.xzw + r7.yzw;
  r6.xyw = -r7.xyz + r6.xyw;
  r6.xyw = r0.xxx * r6.xyw + r7.xyz;
  r0.x = 1 + -r1.y;
  r0.w = max(cb0[42].x, r1.y);
  r0.w = min(1, r0.w);
  r0.x = cb0[55].x * r0.x;
  r0.x = r0.x * r0.z;
  r1.xyw = r0.xxx * r8.xzw;
  r3.xyz = r1.xyw * cb0[42].xxx + r6.xyw;
  r0.x = dot(cb3[0].xyz, float3(0.0396819152,0.45802179,0.00609653955));
  r7.xyzw = -cb3[0].xyzw + r0.xxxx;
  r7.xyzw = cb0[55].xxxx * r7.xyzw + cb3[0].xyzw;
  r7.xyzw = r7.xyzw + -r3.xyzw;
  r0.x = dot(r0.yy, r4.ww);
  r0.z = 1 + -r0.y;
  r0.z = -r5.z * r0.z + 1;
  r0.x = r0.x + -r0.z;
  r1.x = cmp(0.5 >= r4.w);
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
  r0.y = -cb0[17].y + r4.w;
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
  r0.y = r13.y + r13.y;
  r1.x = 1 + -r10.y;
  r1.y = 1 + -r13.y;
  r1.y = r1.y + r1.y;
  r1.x = -r1.y * r1.x + 1;
  r0.y = r0.y * r10.y + -r1.x;
  r1.y = cmp(0.5 >= r13.y);
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
  r0.xyzw = r0.xxxx * r7.xyzw + r3.xyzw;
  r1.x = saturate(cb0[9].x + cb0[9].x);
  r1.x = r2.w * r1.x;
  r1.xy = r1.xx * r4.zw;
  r1.xy = -r1.xy * cb0[53].zz + r5.xy;
  r1.xy = float2(0.5,0.5) + r1.xy;
  r1.xyzw = t2.Sample(s0_s, r1.xy).xyzw;

  r1.rgb = renodx::draw::InvertIntermediatePass(r1.rgb);

  //float3 tonemapped = r1.rgb;
  //float3 neutralSdr = renodx::tonemap::renodrt::NeutralSDR(tonemapped);
  //r1.rgb = neutralSdr;

  r3.xyzw = r2.xxxx * -cb0[15].xyzw + cb0[15].xyzw;
  r2.x = cb0[15].w * r2.y;
  r2.x = max(cb0[55].x, r2.x);
  r1.xyzw = r3.xyzw * r1.xyzw;
  r1.xyzw = r1.xyzw * r0.xyzw;
  r1.xyzw = cb0[53].wwww * r1.xyzw;
  r1.xyzw = r1.xyzw * r6.zzzz;
  r1.xyzw = r1.xyzw * r13.xyzw;
  r1.xyzw = r0.xyzw * r6.zzzz + r1.xyzw;
  r2.y = dot(r1.xyz, float3(0.0396819152,0.45802179,0.00609653955));
  r3.xyzw = r2.yyyy + -r1.xyzw;
  r1.xyzw = r2.xxxx * r3.xyzw + r1.xyzw;
  r1.xyzw = r1.xyzw + -r0.xyzw;
  r2.x = 3.14159274 * r6.z;
  r2.x = sin(r2.x);
  r2.x = r6.z * r2.x;
  r0.xyzw = r2.xxxx * r1.xyzw + r0.xyzw;
  
  //r0.xyz = log2(r0.xyz);
  //o0.w = r0.w;
  //r0.xyz = cb0[57].xxx * r0.xyz;
  //o0.xyz = exp2(r0.xyz);
  
  o0.rgb = renodx::math::SignPow(r0.xyz, cb0[57].x);
  
  o0.w = log2(r0.w);

  //o0.rgb = renodx::tonemap::UpgradeToneMap(
  //  tonemapped,
  //  neutralSdr,
  //  o0.rgb,
  //  1.f
  //);

  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);
  
  return;
}