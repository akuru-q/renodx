// ---- Created with 3Dmigoto v1.3.16 on Sat Aug 24 00:37:18 2024

#include "./shared.h"

Texture3D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

struct t2_t
{
    float val[4];
};
StructuredBuffer<t2_t> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
    float4 cb1[132];
}

cbuffer cb0 : register(b0)
{
    float4 cb0[48];
}

cbuffer cb2 : register(b2)
{
    ShaderInjectData injectedData : packoffset(c0);
}


// 3Dmigoto declarations
#define cmp -


void main(
  linear noperspective float2 v0 : TEXCOORD0,
  linear noperspective float2 w0 : TEXCOORD3,
  linear noperspective float4 v1 : TEXCOORD1,
  linear noperspective float4 v2 : TEXCOORD2,
  float2 v3 : TEXCOORD4,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
    float4 r0, r1, r2, r3, r4, r5, r6, r7, r8;
    uint4 bitmask, uiDest;
    float4 fDest;

    r0.xy = max(cb0[15].xy, v0.xy);
    r0.xy = min(cb0[15].zw, r0.xy);
    r0.xyzw = t0.Sample(s0_s, r0.xy).xyzw; // game in linear
  
    //o0 = r0;
    //return;
  
    r1.xy = cmp(v0.xy < cb0[33].xy);
    r1.x = (int) r1.y | (int) r1.x;
    r1.yz = cmp(cb0[33].zw < v0.xy);
    r1.y = (int) r1.z | (int) r1.y;
    r1.x = (int) r1.y | (int) r1.x;
    if (r1.x == 0)
    {
        r1.xy = -cb0[33].xy + v0.xy;
        r1.zw = cb0[33].zw + -cb0[33].xy;
        r1.xy = r1.xy / r1.zw;
        r2.xyz = cb1[131].zzz * r0.xyz;
        r1.z = dot(r2.xyz, float3(0.300000012, 0.589999974, 0.109999999));
        r3.xy = cb0[9].xy * v0.xy;
        r3.xy = floor(r3.xy);
        r3.xy = (uint2) r3.xy;
        r3.xy = (int2) r3.xy & int2(1, 1);
        r3.xy = (uint2) r3.xy;
        r3.xy = r3.xy * float2(2, 2) + float2(-1, -1);
        r4.x = cb0[9].z * r3.x;
        r4.y = 0;
        r4.xy = v0.xy + r4.xy;
        r4.xy = max(cb0[15].xy, r4.xy);
        r4.xy = min(cb0[15].zw, r4.xy);
        r4.xyz = t0.Sample(s0_s, r4.xy).xyz;
        r5.xyz = cb1[131].zzz * r4.xyz;
        r3.z = 0;
        r3.zw = r3.zy * cb0[9].zw + v0.xy;
        r3.zw = max(cb0[15].xy, r3.zw);
        r3.zw = min(cb0[15].zw, r3.zw);
        r6.xyz = t0.Sample(s0_s, r3.zw).xyz;
        r7.xyz = cb1[131].zzz * r6.xyz;
        r5.x = dot(r5.xyz, float3(0.300000012, 0.589999974, 0.109999999));
        r5.y = dot(r7.xyz, float3(0.300000012, 0.589999974, 0.109999999));
        r7.xyz = ddx_fine(r2.xyz);
        r7.xyz = -r7.xyz * r3.xxx + r2.xyz;
        r8.xyz = ddy_fine(r2.xyz);
        r8.xyz = -r8.xyz * r3.yyy + r2.xyz;
        r1.w = ddx_fine(r1.z);
        r5.z = -r1.w * r3.x + r1.z;
        r1.w = ddy_fine(r1.z);
        r5.w = -r1.w * r3.y + r1.z;
        r3.xyzw = -r5.xyzw + r1.zzzz;
        r1.zw = max(abs(r3.xz), abs(r3.yw));
        r1.z = max(r1.z, r1.w);
        r1.z = saturate(-v1.x * r1.z + 1);
        r1.z = cb0[44].y * -r1.z;
        r3.xyz = r4.xyz * cb1[131].zzz + r7.xyz;
        r3.xyz = r6.xyz * cb1[131].zzz + r3.xyz;
        r3.xyz = r3.xyz + r8.xyz;
        r3.xyz = -r2.xyz * float3(4, 4, 4) + r3.xyz;
        r2.xyz = r3.xyz * r1.zzz + r2.xyz;
        r2.xyz = cb0[41].xyz * r2.xyz;
        r3.x = t2[0].val[0 / 4];
        r3.y = t2[0].val[0 / 4 + 1];
        r3.z = t2[0].val[0 / 4 + 2];
        r1.xy = r1.xy * cb0[31].xy + cb0[31].zw;
        r1.xy = max(cb0[32].xy, r1.xy);
        r1.xy = min(cb0[32].zw, r1.xy);
        r1.xyz = t1.Sample(s1_s, r1.xy).xyz;
        r1.xyz = cb1[131].zzz * r1.xyz;
        r4.xy = w0.xy * cb0[45].zw + cb0[45].xy;
        r4.xy = r4.xy * float2(0.5, -0.5) + float2(0.5, 0.5);
        r4.xyz = t3.Sample(s2_s, r4.xy).xyz;
        r4.xyz = r4.xyz * cb0[42].xyz + float3(1, 1, 1);
        r1.xyz = r4.xyz * r1.xyz;
        r1.xyz = r2.xyz * r3.xyz + r1.xyz;
        r1.xyz = v1.xxx * r1.xyz;
        r2.xy = cb0[44].xx * v1.zw;
        r1.w = dot(r2.xy, r2.xy);
        r1.w = 1 + r1.w;
        r1.w = rcp(r1.w);
        r1.w = r1.w * r1.w;
        
        
        r1.xyz = r1.xyz * r1.www; // vignette
        
        // vanilla code
        //r1.xyz = r1.xyz * r1.www; // vignette
        //r1.xyz = float3(0.00999999978,0.00999999978,0.00999999978) * r1.xyz;
        //r1.xyz = log2(r1.xyz);
        //r1.xyz = float3(0.159301758,0.159301758,0.159301758) * r1.xyz;
        //r1.xyz = exp2(r1.xyz);
        //r2.xyz = r1.xyz * float3(18.8515625,18.8515625,18.8515625) + float3(0.8359375,0.8359375,0.8359375);
        //r1.xyz = r1.xyz * float3(18.6875,18.6875,18.6875) + float3(1,1,1);
        //r1.xyz = rcp(r1.xyz);
        //r1.xyz = r2.xyz * r1.xyz;
        //r1.xyz = log2(r1.xyz);
        //r1.xyz = float3(78.84375,78.84375,78.84375) * r1.xyz;
        //r1.xyz = exp2(r1.xyz);
        //r1.xyz = r1.xyz * float3(0.96875,0.96875,0.96875) + float3(0.015625,0.015625,0.015625);
        //r1.xyz = t4.Sample(s3_s, r1.xyz).xyz;
        
        r1.w = v2.w * 543.309998 + v2.z;
        r1.w = sin(r1.w);
        r1.w = 493013 * r1.w;
        r1.w = frac(r1.w);
        r1.w = r1.w * 0.00390625 + -0.001953125;
        
        // vanilla code
        //r1.xyz = r1.xyz * float3(1.04999995,1.04999995,1.04999995) + r1.www;
        //r1.xyz = log2(r1.xyz);
        //r1.xyz = float3(0.0126833133,0.0126833133,0.0126833133) * r1.xyz;
        //r1.xyz = exp2(r1.xyz);
        //r2.xyz = float3(-0.8359375,-0.8359375,-0.8359375) + r1.xyz;
        //r2.xyz = max(float3(0,0,0), r2.xyz);
        //r1.xyz = -r1.xyz * float3(18.6875,18.6875,18.6875) + float3(18.8515625,18.8515625,18.8515625);
        //r1.xyz = r2.xyz / r1.xyz;
        //r1.xyz = log2(r1.xyz);
        //r1.xyz = float3(6.27739477,6.27739477,6.27739477) * r1.xyz;
        //r1.xyz = exp2(r1.xyz);
        //r1.xyz = float3(10000,10000,10000) * r1.xyz;
        //r1.xyz = max(float3(9.99999975e-05,9.99999975e-05,9.99999975e-05), r1.xyz);
        //r1.xyz = min(float3(1000,1000,1000), r1.xyz);
        //r1.xyz = float3(-9.99999975e-05,-9.99999975e-05,-9.99999975e-05) + r1.xyz;
        //r1.xyz = float3(0.00100000016,0.00100000016,0.00100000016) * r1.xyz;
        //r2.x = dot(float3(1.73125386,-0.604043067,-0.0801077113), r1.xyz);
        //r2.y = dot(float3(-0.131618932,1.13484156,-0.00867943279), r1.xyz);
        //r2.z = dot(float3(-0.0245682523,-0.125750408,1.06563699), r1.xyz);
        //r1.xyz = float3(12.5,12.5,12.5) * r2.xyz;
        if (cb0[47].w != 0)
        {
            // vanilla code
            //r2.xyz = log2(r1.xyz);
            //r2.xyz = float3(0.0126833133,0.0126833133,0.0126833133) * r2.xyz;
            //r2.xyz = exp2(r2.xyz);
            //r3.xyz = float3(-0.8359375,-0.8359375,-0.8359375) + r2.xyz;
            //r3.xyz = max(float3(0,0,0), r3.xyz);
            //r2.xyz = -r2.xyz * float3(18.6875,18.6875,18.6875) + float3(18.8515625,18.8515625,18.8515625);
            //r2.xyz = r3.xyz / r2.xyz;
            //r2.xyz = log2(r2.xyz);
            //r2.xyz = float3(6.27739477,6.27739477,6.27739477) * r2.xyz;
            //r2.xyz = exp2(r2.xyz);
            //r2.xyz = float3(10000,10000,10000) * r2.xyz;
            //r2.xyz = r2.xyz / cb0[47].zzz;
            //r2.xyz = max(float3(6.10351999e-05,6.10351999e-05,6.10351999e-05), r2.xyz);
            //r3.xyz = float3(12.9200001,12.9200001,12.9200001) * r2.xyz;
            //r2.xyz = max(float3(0.00313066994,0.00313066994,0.00313066994), r2.xyz);
            //r2.xyz = log2(r2.xyz);
            //r2.xyz = float3(0.416666657,0.416666657,0.416666657) * r2.xyz;
            //r2.xyz = exp2(r2.xyz);
            //r2.xyz = r2.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
            //r1.xyz = min(r3.xyz, r2.xyz);
        }
        o0.xyz = r1.xyz;
        o0.w = 0;
    }
    else
    {
        o0.xyzw = r0.xyzw;
    }
    
    float4 untonemapped = o0.xyzw;
    
    // -----------
    // custom code
        
    // tonemapper
        
    float3 outputColor = untonemapped.rgb;
    
    if (injectedData.toneMapType == 0) // None
    {
        //outputColor.rgb *= 2.f;
    }
    if (injectedData.toneMapType == 1) // DICE
    {
        //outputColor.rgb *= 2.f;
        outputColor = renodx::color::grade::UserColorGrading(
              outputColor,
              injectedData.colorGradeExposure,
              injectedData.colorGradeHighlights,
              injectedData.colorGradeShadows,
              injectedData.colorGradeContrast,
              injectedData.colorGradeSaturation);
    }
    else if (injectedData.toneMapType == 2 || injectedData.toneMapType == 3) // RenoDX + ACES
    {
        if (injectedData.toneMapHueCorrection == 1.f)
        {
            outputColor = renodx::color::correct::Hue(outputColor, renodx::tonemap::Reinhard(outputColor));
        }
        else if (injectedData.toneMapHueCorrection == 2.f)
        {
            outputColor = renodx::color::correct::Hue(outputColor, renodx::tonemap::ACESFittedBT709(outputColor));
        }
        else if (injectedData.toneMapHueCorrection == 3.f)
        {
            outputColor = renodx::color::correct::Hue(outputColor, renodx::tonemap::ACESFittedAP1(outputColor));
        }
        
        float vanillaMidGray = 0.18f; // old default
        float renoDRTContrast = 1.8f;
        float renoDRTFlare = 0.f;
        float renoDRTShadows = 1.f; // 0.8
        float renoDRTDechroma = injectedData.colorGradeBlowout;
        float renoDRTSaturation = 1.8f; // 1.1f
        float renoDRTHighlights = 1.2f;
        
        renodx::tonemap::Config config = renodx::tonemap::config::Create(
              injectedData.toneMapType,
              injectedData.toneMapPeakNits,
              injectedData.toneMapGameNits,
              1,
              injectedData.colorGradeExposure,
              injectedData.colorGradeHighlights,
              injectedData.colorGradeShadows,
              injectedData.colorGradeContrast,
              injectedData.colorGradeSaturation,
              vanillaMidGray,
              vanillaMidGray * 100.f,
              renoDRTHighlights,
              renoDRTShadows,
              renoDRTContrast,
              renoDRTSaturation,
              renoDRTDechroma,
              renoDRTFlare,
              //renodx::tonemap::config::hue_correction_type::CUSTOM, (injectedData.toneMapHueCorrection), vanillaColor
              renodx::tonemap::config::hue_correction_type::CUSTOM, 0.f, outputColor
            );
        
        outputColor = renodx::tonemap::config::Apply(outputColor, config);
    }
    
    o0.rgb = outputColor.rgb;
    
    if (injectedData.toneMapGammaCorrection)
    {
        o0.rgb = renodx::color::correct::GammaSafe(o0.rgb);
        o0.rgb *= injectedData.toneMapGameNits; // / 100.f?
        o0.rgb = renodx::color::correct::GammaSafe(o0.rgb, true);
    }
    else
    {
        o0.rgb *= injectedData.toneMapGameNits; // scale by game brightness
    }
    
    if (injectedData.toneMapType == 1) // DICE
    {
        o0.rgb = renodx::tonemap::dice::BT709(o0.rgb, injectedData.toneMapPeakNits, injectedData.toneMapGameNits / injectedData.toneMapPeakNits);
    }
            
    // output expected as PQ, so we need linear > PQ conversion
    o0.rgb = mul(renodx::color::BT709_TO_BT2020_MAT, o0.rgb);   // use bt2020
    o0.rgb /= 10000.f;                                          // Scale for PQ
    o0.rgb = max(0, o0.rgb);                                    // clamp out of gamut
    o0.rgb = renodx::color::pq::from::BT2020(o0.rgb);           // convert to PQ
    o0.rgb = min(1.f, o0.rgb);                                  // clamp PQ (10K nits)
        
    return;
}