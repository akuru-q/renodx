#include "./shared.h"

float3 applyRenoDice(float3 color) {
  // const float paperWhite = RENODX_DIFFUSE_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;
  float paperWhite = RENODX_GRAPHICS_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;
  float peakWhite = RENODX_PEAK_WHITE_NITS / renodx::color::srgb::REFERENCE_WHITE;
  // const float highlightsShoulderStart = CUSTOM_TONE_MAP_SHOULDER_START;
  const float highlightsShoulderStart = 0.5f;

  if (RENODX_GAMMA_CORRECTION == 1.f) {
    paperWhite = renodx::color::correct::Gamma(paperWhite, true);
    peakWhite = renodx::color::correct::Gamma(peakWhite, true);
  } else if (RENODX_GAMMA_CORRECTION == 2.f) {
    paperWhite = renodx::color::correct::Gamma(paperWhite, true, 2.4f);
    peakWhite = renodx::color::correct::Gamma(peakWhite, true, 2.4f);
  }

  return renodx::tonemap::dice::BT709(color.rgb * paperWhite, peakWhite, highlightsShoulderStart) / paperWhite;
}

float3 lutShaper(float3 color, bool builder = false) {
  color = builder ? renodx::color::pq::Decode(color, 100.f)
                  : renodx::color::pq::Encode(color, 100.f);

  return color;
}

float3 applyUserTonemap(float3 color) {
  color *= (0.82f * 0.92f * 0.18f) / 0.18f; // mid gray matching

  return color = renodx::draw::ToneMapPass(color);
}

float3 uberPostScaling(float3 color) {
  return color = renodx::draw::RenderIntermediatePass(color);
}