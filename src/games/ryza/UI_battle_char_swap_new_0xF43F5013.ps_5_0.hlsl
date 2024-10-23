// ---- Created with 3Dmigoto v1.3.16 on Wed Oct 23 22:33:08 2024

cbuffer _Globals : register(b0)
{
    float4 ColorRate : packoffset(c0);
    float4 ColorBlendStartUV : packoffset(c1);
    float2 ColorRangeCenterUV : packoffset(c2);
    float2 DistRectCenterToEdgeUV : packoffset(c2.z);
    float2 ColorGradationWidth : packoffset(c3);
    int IsInside : packoffset(c3.z);
    float LumiThreshold : packoffset(c3.w);
}

SamplerState smplScene_s : register(s0);
Texture2D<float4> smplScene_Tex : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
    float4 r0, r1, r2, r3;
    uint4 bitmask, uiDest;
    float4 fDest;

    r0.xy = ColorRangeCenterUV.xy + -v1.xy;
    r0.xy = abs(r0.xy) / DistRectCenterToEdgeUV.xy;
    r0.x = cmp(r0.x < r0.y);
    r0.yz = ColorBlendStartUV.zx + -v1.yx;
    r1.xy = -ColorBlendStartUV.wy + v1.yx;
    r1.zw = min(abs(r1.xy), abs(r0.yz));
    r0.yz = max(r1.yx, r0.zy);
    r0.y = max(r0.y, r0.z);
    r0.y = cmp(0 < r0.y);
    r0.zw = saturate(r1.zw / ColorGradationWidth.yx);
    r0.x = r0.x ? r0.z : r0.w;
    r0.x = r0.y ? r0.x : 0;
    r0.y = 1 + -r0.x;
    r0.xy = ColorRate.ww * r0.xy;
    r0.x = IsInside ? r0.y : r0.x;
    r0.y = 1 + -r0.x;
    r1.xyz = smplScene_Tex.Sample(smplScene_s, v1.xy).xyz;
    r0.yzw = r1.xyz * r0.yyy;
    r2.xyz = saturate(r1.xyz / LumiThreshold);
    r2.xyz = trunc(r2.xyz);
    r1.xyz = r2.xyz + -r1.xyz;
    r1.xyz = abs(r1.xyz) + abs(r1.xyz);
    r3.xyz = -ColorRate.xyz + r2.xyz;
    r1.xyz = -r1.xyz * abs(r3.xyz) + r2.xyz;
    //o0.xyz = saturate(r0.xxx * abs(r1.xyz) + r0.yzw);
    o0.xyz = (r0.xxx * abs(r1.xyz) + r0.yzw);

    o0.w = 1;
    return;
}