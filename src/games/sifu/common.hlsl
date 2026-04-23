#include "./shared.h"

/// Applies Exponential Roll-Off tonemapping using the maximum channel.
/// Used to fit the color into a 0–output_max range for SDR LUT compatibility.
float3 ToneMapMaxCLL(float3 color, float rolloff_start = 0.5f, float output_max = 1.f) {
  float peak = max(color.r, max(color.g, color.b));
  peak = min(peak, 100.f);
  float log_peak = log2(peak);

  // Apply exponential shoulder in log space
  float log_mapped = renodx::tonemap::ExponentialRollOff(log_peak, log2(rolloff_start), log2(output_max));
  float scale = exp2(log_mapped - log_peak);  // How much to compress all channels

  return min(output_max, color * scale);
}

float3 HDRBoost(float3 color, float power = 0.20f, float normalization_point = 0.02f) {
  if (power == 0.f) return color;

  float smoothing = power * 2.f;
  color = max(color, lerp(color, normalization_point * pow(color / normalization_point, 1.f + power), color / ((color / smoothing) + 1)));

  return color;
}

float3 ScaleLutSamples(float3 input, float3 output, float3 lut_black, float3 lut_mid_gray) {
  if (!RENODX_TONE_MAP_TYPE) {
    return output;
  }

  float3 output_linear = output;

  if (CUSTOM_LUT_SCALING != 0.f) {
    float3 input_gamma = renodx::color::srgb::EncodeSafe(input);
    float3 output_gamma = renodx::color::srgb::EncodeSafe(output);
    float3 black_gamma = renodx::color::srgb::EncodeSafe(lut_black);
    float3 midgray_gamma = renodx::color::srgb::EncodeSafe(lut_mid_gray);
    float3 peak_gamma = 1.f;

    float3 unclamped_gamma = renodx::lut::Unclamp(
        output_gamma,
        black_gamma,
        midgray_gamma,
        peak_gamma,
        input_gamma);

    float3 recolored = renodx::lut::RecolorUnclamped(
        output,
        renodx::color::srgb::DecodeSafe(unclamped_gamma));

    output = lerp(output, recolored, CUSTOM_LUT_SCALING);

    // output = renodx::color::correct::Chrominance(output, output_linear);
    // output = renodx::color::correct::Hue(output, output_linear);
  }

  output = lerp(input, output, CUSTOM_LUT_STRENGTH);

  return output;
}

float3 OutputLutSample(float3 color, Texture3D<float4> lutTex, SamplerState lutSampler)
{
  float3 lutInput = log2(color);
  lutInput = saturate(mad(lutInput, 0.071429f, 0.610727f));
  lutInput = mad(lutInput, 0.96875f, 0.015625f);

  float3 lutResult = lutTex.Sample(lutSampler, lutInput).xyz;
  return lutResult * 1.05f;
}