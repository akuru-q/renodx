#include "../common.hlsl"

cbuffer CB0 : register(b0)
{
    float4 cb0[69];
}

cbuffer CB1 : register(b1)
{
    float4 cb1[136];
}

SamplerState s0 : register(s0);
SamplerState s1 : register(s1);
SamplerState s2 : register(s2);
Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);
Texture3D<float4> t3 : register(t3);

struct PS_INPUT
{
    noperspective float4 v0 : TEXCOORD0;
    noperspective float3 v1 : TEXCOORD1;
    noperspective float4 v2 : TEXCOORD2;
    noperspective float2 v3 : TEXCOORD4;
    noperspective float4 v4 : SV_Position;
};

struct PS_OUTPUT
{
    float4 SV_Target : SV_Target;
};

// 3Dmigoto declarations
#define cmp -

PS_OUTPUT main(PS_INPUT input)
{
    PS_OUTPUT output;
    float4 o0;
    
    // float4 r0 = cb0[65].xzyw;
    // bool outside = (input.v4.x < r0.x) || (input.v4.y < r0.z) || (r0.y < input.v4.x) || (r0.w < input.v4.y); // decomp issue
    float4 r0 = asint(cb0[65].xzyw);
    r0.xz = cmp(input.v4.xy < r0.xz);
    r0.yw = cmp(r0.yw < input.v4.xy);
    r0.x = (int)r0.y | (int)r0.x;
    r0.x = (int)r0.z | (int)r0.x;
    r0.x = (int)r0.w | (int)r0.x;

    float3 untonemapped = 0.f;

    // if (outside)
    if (r0.x == 0) {
        float sinInput = mad(input.v2.w, 543.309998f, input.v2.z);
        float sinVal;
        sincos(sinInput, sinVal, sinVal);
        float randVal = frac(sinVal * 493013.0f);
        
        float2 r0_yz = input.v3.xy * cb0[54].zw;
        int2 r1_xy = int2(r0_yz);
        
        float r0_y = saturate(cb0[62].y * 6.0f);
        r0_y = mad(r0_y, -3.0f, 8.0f);
        r0_y = rcp(r0_y);
        
        int x = r1_xy.x;
        int y = r1_xy.y;
        
        float3 c_center = t0.Load(int3(x, y, 0)).xyz;
        float3 c_left   = t0.Load(int3(x - 1, y, 0)).xyz;
        float3 c_right  = t0.Load(int3(x + 1, y, 0)).xyz;
        float3 c_up     = t0.Load(int3(x, y - 1, 0)).xyz;
        float3 c_down   = t0.Load(int3(x, y + 1, 0)).xyz;
        
        float3 min_center_right = min(c_center, c_right);
        float3 min_all = min(c_left, min_center_right);
        float3 min_up_down = min(c_down, c_up);
        min_all = min(min_all, min_up_down);
        
        float3 max_center_right = max(c_center, c_right);
        float3 max_all = max(c_left, max_center_right);
        float3 max_up_down = max(c_down, c_up);
        max_all = max(max_all, max_up_down);
        
        uint3 r6_u = asuint(min_all);
        uint3 r7_u = asuint(max_all);
        uint3 r8_u = 0x7ef07ebbu - r7_u;
        float3 r7_f = 1.0f - max_all;
        float3 r6_f = min(min_all, r7_f);
        float3 r8_f = asfloat(r8_u);
        r6_f = saturate(r8_f * r6_f);
        r6_u = asuint(r6_f) >> 1;
        r6_u += 0x1fbc4639u;
        float3 r6 = asfloat(r6_u);
        
        float3 r0_yzw = -r0_y * r6;
        float3 r6_next = mad(r0_yzw, 4.0f, 1.0f);
        uint3 r7_u_next = 0x7ef19fffu - asuint(r6_next);
        float3 r7_f_next = asfloat(r7_u_next);
        r6_next = mad(-r7_f_next, r6_next, 2.0f);
        r6_next = r6_next * r7_f_next;
        
        float3 sum = r0_yzw * c_left;
        sum = mad(c_up, r0_yzw, sum);
        sum = mad(c_right, r0_yzw, sum);
        sum = mad(c_down, r0_yzw, sum);
        sum = c_center + sum;
        //float3 filtered = saturate(r6_next * sum);
        float3 filtered = (r6_next * sum);
        [branch]
        if (RENODX_TONE_MAP_TYPE == 0.f) filtered = saturate(filtered);

        filtered *= cb1[135].z;
        
        float2 t1_coord = mad(cb0[58].zw, input.v0.xy, cb0[59].xy);
        t1_coord = max(t1_coord, cb0[50].zw);
        t1_coord = min(t1_coord, cb0[51].xy);
        float3 t1_col = t1.Sample(s0, t1_coord).xyz * cb1[135].z;
        
        float2 t2_coord = mad(input.v0.zw, cb0[68].zw, cb0[68].xy);
        t2_coord = mad(t2_coord, float2(0.5f, -0.5f), float2(0.5f, 0.5f));
        float3 t2_col = t2.Sample(s1, t2_coord).xyz;
        t2_col = mad(t2_col, cb0[67].xyz, cb0[61].xyz);
        
        float3 combined = t1_col * t2_col;
        combined = mad(filtered, cb0[60].xyz, combined);
        combined *= input.v1.x;

        untonemapped = combined;
        
        float2 r1_xy_2 = input.v1.yz * cb0[62].x;
        float r1_x = dot(r1_xy_2, r1_xy_2) + 1.0f;
        r1_x = rcp(r1_x);
        r1_x = r1_x * r1_x;
        combined *= r1_x;
        
        float lum = dot(combined, float3(0.3f, 0.59f, 0.11f));
        float dither_amount = 1.0f - lum;
        dither_amount = max(dither_amount, 0.0f);
        dither_amount = dither_amount * dither_amount;
        dither_amount = min(dither_amount, 1.0f);
        dither_amount *= cb0[64].x;
        float dither_offset = mad(randVal, dither_amount, mad(dither_amount, -0.5f, 1.0f));
        
        float3 adjusted = mad(combined, dither_offset, float3(0.002668f, 0.002668f, 0.002668f));

        if (RENODX_TONE_MAP_TYPE == 3.f) {
          adjusted = lerp(adjusted, ToneMapMaxCLL(adjusted, CUSTOM_TONEMAP_START, 1), saturate(renodx::color::y::from::BT709(adjusted)));
        }

        float3 lut_input_copy = adjusted;
        
        float3 lut_input = log2(adjusted);
        lut_input = saturate(mad(lut_input, 0.071429f, 0.610727f));
        lut_input = mad(lut_input, 0.96875f, 0.015625f);
        float3 lut_result = t3.Sample(s2, lut_input).xyz;
        
        float3 scaled = lut_result * 1.05f;
        o0.w = saturate(dot(scaled, float3(0.299f, 0.587f, 0.114f)));

        if (RENODX_TONE_MAP_TYPE == 3.f) {
          float3 lut_output = renodx::color::srgb::DecodeSafe(scaled);
          float3 lut_black = renodx::color::srgb::DecodeSafe(OutputLutSample((0.f).xxx, t3, s2));
          float3 lut_mid_gray = renodx::color::srgb::DecodeSafe(OutputLutSample((0.18f).xxx, t3, s2));

          lut_result = ScaleLutSamples(lut_input_copy, lut_output, lut_black, lut_mid_gray);

          lut_result = renodx::color::srgb::EncodeSafe(lut_result);
        }

        float dither_final = mad(randVal, 0.00390625f, -0.001953125f);
        float3 final_color = mad(lut_result, 1.05f, dither_final);
        
        if (cb0[66].y != 0.0f)
        {
            float3 r1 = log2(final_color);
            r1 *= 0.012683f;
            r1 = exp2(r1);
            float3 r2 = r1 - 0.8359375f;
            r2 = max(r2, 0.0f);
            float3 r1_denom = mad(r1, -18.6875f, 18.8515625f);
            r1 = r2 / r1_denom;
            r1 = log2(r1);
            r1 *= 6.277395f;
            r1 = exp2(r1);
            r1 *= 10000.0f;
            r1 /= cb0[66].x;
            r1 = max(r1, 0.000061f);
            float3 r2_mul = r1 * 12.92f;
            float3 r1_alt = max(r1, 0.003131f);
            r1_alt = log2(r1_alt);
            r1_alt *= 0.416667f;
            r1_alt = exp2(r1_alt);
            r1_alt = mad(r1_alt, 1.055f, -0.055f);
            o0.xyz = min(r1_alt, r2_mul);
        }
        else
        {
            o0.xyz = final_color;
        }
    }
    else
    {
        o0 = float4(0.0f, 0.0f, 0.0f, 0.0f);
    }

    o0.rgb = renodx::color::srgb::DecodeSafe(o0.rgb);

    if (RENODX_TONE_MAP_TYPE == 3.f) {
        o0.rgb = renodx::tonemap::UpgradeToneMap(
            untonemapped,
            ToneMapMaxCLL(untonemapped, CUSTOM_TONEMAP_START, 1),
            o0.rgb,
            1.f
            );
        
        o0.rgb = renodx::color::bt2020::from::BT709(o0.rgb);
        o0.rgb = HDRBoost(o0.rgb, CUSTOM_HDR_BOOST_POWER);
        o0.rgb = renodx::color::bt709::from::BT2020(o0.rgb);

        o0.rgb = renodx::draw::ToneMapPass(o0.rgb);
    }

    o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);

    output.SV_Target = o0;
    return output;
}