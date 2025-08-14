#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Mon Mar 17 22:57:53 2025

cbuffer cbComposite : register(b2)
{
  float4 g_vSceneTexSize : packoffset(c0);
  float4 g_vCompositeInfo : packoffset(c1);
  float4 g_vSun2dInfo : packoffset(c2);
  float4 g_vEtcEffect : packoffset(c3);
  float4 g_vBloomInfo : packoffset(c4);
  float4 g_vLimbDarkenningInfo : packoffset(c5);
  float4 g_vFxaaParams : packoffset(c6);
  float4 g_vGammaCorrection : packoffset(c7);
  float4 g_vRadialBlurCenter : packoffset(c8);
  float4 g_vRadialBlurInfo : packoffset(c9);
  float4 g_vFxaaQualityParams : packoffset(c10);
  float4 g_vCompositeLastViewport : packoffset(c11);
  float4 g_vMaxUV : packoffset(c12);
  float4 g_vMinUV : packoffset(c13);
  float4 g_vP2V : packoffset(c14);
  float4x4 g_mV2W : packoffset(c15);
  float4 g_vDramaticHdrLutInfo0[2] : packoffset(c19);
  float4 g_vDramaticHdrLutInfo1[2] : packoffset(c21);
  float4 g_vDrawFixParams : packoffset(c23);
  float4 g_vDistortionParams : packoffset(c24);
  float4 g_vVerticalLimbDarkenningTopInfo : packoffset(c25);
  float4 g_vVerticalLimbDarkenningBottomInfo : packoffset(c26);
}

SamplerState sampleLinear_s : register(s7);
Texture2D<float4> g_tSceneMap : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8;
  uint4 bitmask, uiDest;
  float4 fDest;

  float4 x0[13];
  r0.x = cmp(0 < g_vFxaaQualityParams.z);
  if (r0.x != 0) {
    r0.x = cmp(g_vFxaaQualityParams.w < 11);
    if (r0.x != 0) {
      r0.xyzw = float4(12,3,1.5,3);
    } else {
      r1.x = cmp(g_vFxaaQualityParams.w < 12);
      if (r1.x != 0) {
        x0[4].x = 12;
        r0.xyzw = float4(3,1.5,1,4);
      } else {
        r1.x = cmp(g_vFxaaQualityParams.w < 13);
        if (r1.x != 0) {
          x0[4].x = 4;
          x0[5].x = 12;
          r0.xyzw = float4(2,1.5,1,5);
        } else {
          r1.x = cmp(g_vFxaaQualityParams.w < 14);
          if (r1.x != 0) {
            x0[4].x = 2;
            x0[5].x = 4;
            x0[6].x = 12;
            r0.xyzw = float4(2,1.5,1,6);
          } else {
            r1.x = cmp(g_vFxaaQualityParams.w < 15);
            if (r1.x != 0) {
              x0[4].x = 2;
              x0[5].x = 2;
              x0[6].x = 4;
              x0[7].x = 12;
              r0.xyzw = float4(2,1.5,1,7);
            } else {
              r1.x = cmp(g_vFxaaQualityParams.w < 20);
              if (r1.x != 0) {
                x0[4].x = 2;
                x0[5].x = 2;
                x0[6].x = 2;
                x0[7].x = 4;
                x0[8].x = 12;
                r0.xyzw = float4(2,1.5,1,8);
              } else {
                r1.x = cmp(g_vFxaaQualityParams.w < 21);
                if (r1.x != 0) {
                  r0.xyzw = float4(8,2,1.5,3);
                } else {
                  r1.x = cmp(g_vFxaaQualityParams.w < 22);
                  if (r1.x != 0) {
                    r1.x = 8;
                    r0.xyw = float3(2,1.5,4);
                  } else {
                    r1.y = cmp(g_vFxaaQualityParams.w < 23);
                    if (r1.y != 0) {
                      r1.xy = float2(2,8);
                      r0.xyw = float3(2,1.5,5);
                    } else {
                      r1.z = cmp(g_vFxaaQualityParams.w < 24);
                      if (r1.z != 0) {
                        r1.xyz = float3(2,2,8);
                        r0.xyw = float3(2,1.5,6);
                      } else {
                        r1.w = cmp(g_vFxaaQualityParams.w < 25);
                        if (r1.w != 0) {
                          r1.xyzw = float4(2,2,3,8);
                          r0.xyw = float3(2,1.5,7);
                        } else {
                          r2.x = cmp(g_vFxaaQualityParams.w < 26);
                          if (r2.x != 0) {
                            r2.x = 8;
                            r1.xyzw = float4(2,2,2,4);
                            r0.xyw = float3(2,1.5,8);
                          } else {
                            r2.y = cmp(g_vFxaaQualityParams.w < 27);
                            if (r2.y != 0) {
                              r2.xy = float2(4,8);
                              r1.xyz = float3(2,2,2);
                              r0.xyw = float3(2,1.5,9);
                            } else {
                              r2.z = cmp(g_vFxaaQualityParams.w < 28);
                              if (r2.z != 0) {
                                r2.yz = float2(4,8);
                                r1.xyz = float3(2,2,2);
                                r0.xyw = float3(2,1.5,10);
                              } else {
                                r2.w = cmp(g_vFxaaQualityParams.w < 29);
                                if (r2.w != 0) {
                                  r2.zw = float2(4,8);
                                  r1.xyz = float3(2,2,2);
                                  r0.xyw = float3(2,1.5,11);
                                } else {
                                  r3.x = cmp(g_vFxaaQualityParams.w < 30);
                                  if (r3.x != 0) {
                                    r1.xyz = float3(2,2,2);
                                    r0.xy = float2(2,1.5);
                                  } else {
                                    r1.xyz = float3(1,1,1.5);
                                    r0.xy = float2(1,1);
                                  }
                                  x0[12].x = 8;
                                  r2.zw = float2(2,4);
                                  r0.w = 12;
                                }
                                x0[11].x = r2.w;
                                r2.y = 2;
                              }
                              x0[10].x = r2.z;
                              r2.x = 2;
                            }
                            x0[9].x = r2.y;
                            r1.w = 2;
                          }
                          x0[8].x = r2.x;
                        }
                        x0[7].x = r1.w;
                      }
                      x0[6].x = r1.z;
                    }
                    x0[5].x = r1.y;
                  }
                  x0[4].x = r1.x;
                  r0.z = 1;
                }
              }
            }
          }
        }
      }
    }
    x0[3].x = r0.x;
    x0[2].x = r0.y;
    x0[1].x = r0.z;
    x0[0].x = r0.w;
    r1.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0).xyz;
    r0.x = dot(r1.xyz, float3(0.222014993,0.706655025,0.0713300034));
    r2.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(0, 1)).xyz;
    r1.w = dot(r2.xyz, float3(0.222014993,0.706655025,0.0713300034));
    r2.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(1, 0)).xyz;
    r2.x = dot(r2.xyz, float3(0.222014993,0.706655025,0.0713300034));
    r2.yzw = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(0, -1)).xyz;
    r2.y = dot(r2.yzw, float3(0.222014993,0.706655025,0.0713300034));
    r3.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(-1, 0)).xyz;
    r2.z = dot(r3.xyz, float3(0.222014993,0.706655025,0.0713300034));
    r2.w = max(r1.w, r0.x);
    r3.x = min(r1.w, r0.x);
    r2.w = max(r2.x, r2.w);
    r3.x = min(r3.x, r2.x);
    r3.y = max(r2.y, r2.z);
    r3.z = min(r2.y, r2.z);
    r2.w = max(r3.y, r2.w);
    r3.x = min(r3.z, r3.x);
    r3.y = g_vFxaaQualityParams.x * r2.w;
    r2.w = -r3.x + r2.w;
    r3.x = max(g_vFxaaQualityParams.y, r3.y);
    r3.x = cmp(r2.w >= r3.x);
    if (r3.x != 0) {
      g_tSceneMap.GetDimensions(0, fDest.x, fDest.y, fDest.z);
      r3.xy = fDest.xy;
      r3.xy = float2(1,1) / r3.xy;
      r4.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(-1, -1)).xyz;
      r3.z = dot(r4.xyz, float3(0.222014993,0.706655025,0.0713300034));
      r4.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(1, 1)).xyz;
      r3.w = dot(r4.xyz, float3(0.222014993,0.706655025,0.0713300034));
      r4.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(1, -1)).xyz;
      r4.x = dot(r4.xyz, float3(0.222014993,0.706655025,0.0713300034));
      r4.yzw = g_tSceneMap.SampleLevel(sampleLinear_s, v1.xy, 0, int2(-1, 1)).xyz;
      r4.y = dot(r4.yzw, float3(0.222014993,0.706655025,0.0713300034));
      r4.z = r2.y + r1.w;
      r4.w = r2.z + r2.x;
      r2.w = 1 / r2.w;
      r5.x = r4.z + r4.w;
      r4.z = r0.x * -2 + r4.z;
      r4.w = r0.x * -2 + r4.w;
      r5.y = r4.x + r3.w;
      r4.x = r4.x + r3.z;
      r5.z = r2.x * -2 + r5.y;
      r4.x = r2.y * -2 + r4.x;
      r3.z = r4.y + r3.z;
      r3.w = r4.y + r3.w;
      r4.y = abs(r4.z) * 2 + abs(r5.z);
      r4.x = abs(r4.w) * 2 + abs(r4.x);
      r4.z = r2.z * -2 + r3.z;
      r3.w = r1.w * -2 + r3.w;
      r4.y = abs(r4.z) + r4.y;
      r3.w = abs(r3.w) + r4.x;
      r3.z = r3.z + r5.y;
      r3.w = cmp(r4.y >= r3.w);
      r3.z = r5.x * 2 + r3.z;
      r2.y = r3.w ? r2.y : r2.z;
      r1.w = r3.w ? r1.w : r2.x;
      r2.x = r3.w ? r3.y : r3.x;
      r2.z = r3.z * 0.0833333358 + -r0.x;
      r3.z = r2.y + -r0.x;
      r4.x = r1.w + -r0.x;
      r2.y = r2.y + r0.x;
      r1.w = r1.w + r0.x;
      r4.y = cmp(abs(r3.z) >= abs(r4.x));
      r3.z = max(abs(r4.x), abs(r3.z));
      r2.x = r4.y ? -r2.x : r2.x;
      r2.z = saturate(abs(r2.z) * r2.w);
      r2.w = r3.w ? r3.x : 0;
      r3.x = r3.w ? 0 : r3.y;
      r4.xz = r2.xx * float2(0.5,0.5) + v1.xy;
      r3.y = r3.w ? v1.x : r4.x;
      r4.x = r3.w ? r4.z : v1.y;
      r5.x = -r2.w * r0.z + r3.y;
      r5.y = -r3.x * r0.z + r4.x;
      r6.x = r2.w * r0.z + r3.y;
      r6.y = r3.x * r0.z + r4.x;
      r0.z = r2.z * -2 + 3;
      r4.xzw = g_tSceneMap.SampleLevel(sampleLinear_s, r5.xy, 0).xyz;
      r3.y = dot(r4.xzw, float3(0.222014993,0.706655025,0.0713300034));
      r2.z = r2.z * r2.z;
      r4.xzw = g_tSceneMap.SampleLevel(sampleLinear_s, r6.xy, 0).xyz;
      r4.x = dot(r4.xzw, float3(0.222014993,0.706655025,0.0713300034));
      r1.w = r4.y ? r2.y : r1.w;
      r2.y = 0.25 * r3.z;
      r0.x = -r1.w * 0.5 + r0.x;
      r0.z = r2.z * r0.z;
      r0.x = cmp(r0.x < 0);
      r2.z = -r1.w * 0.5 + r3.y;
      r3.y = -r1.w * 0.5 + r4.x;
      r3.z = cmp(abs(r2.z) >= r2.y);
      r4.x = cmp(abs(r3.y) >= r2.y);
      r4.y = -r2.w * r0.y + r5.x;
      r4.z = -r3.x * r0.y + r5.y;
      r4.yz = r3.zz ? r5.xy : r4.yz;
      r4.w = ~(int)r3.z;
      r5.x = ~(int)r4.x;
      r4.w = (int)r4.w | (int)r5.x;
      r5.x = r2.w * r0.y + r6.x;
      r5.x = r4.x ? r6.x : r5.x;
      r0.y = r3.x * r0.y + r6.y;
      r0.y = r4.x ? r6.y : r0.y;
      r0.w = (int)r0.w;
      r5.yz = r4.yz;
      r5.w = r5.x;
      r6.x = r0.y;
      r6.y = r2.z;
      r6.zw = r3.yz;
      r7.xy = r4.xw;
      r7.z = 3;
      while (true) {
        r7.w = cmp((int)r0.w < (int)r7.z);
        if (r7.w != 0) break;
        if (r7.y != 0) {
          if (r6.w == 0) {
            r8.xy = r5.yz;
            r8.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r8.xy, 0).xyz;
            r6.y = dot(r8.xyz, float3(0.222014993,0.706655025,0.0713300034));
          }
          if (r7.x == 0) {
            r8.x = r5.w;
            r8.y = r6.x;
            r8.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r8.xy, 0).xyz;
            r6.z = dot(r8.xyz, float3(0.222014993,0.706655025,0.0713300034));
          }
          r7.w = -r1.w * 0.5 + r6.y;
          r6.y = r6.w ? r6.y : r7.w;
          r7.w = -r1.w * 0.5 + r6.z;
          r6.z = r7.x ? r6.z : r7.w;
          r6.w = cmp(abs(r6.y) >= r2.y);
          r7.x = cmp(abs(r6.z) >= r2.y);
          r7.w = ~(int)r6.w;
          if (r6.w == 0) {
            r8.x = x0[r7.z+0].x;
            r5.y = -r2.w * r8.x + r5.y;
            r5.z = -r3.x * r8.x + r5.z;
          }
          r8.x = ~(int)r7.x;
          r7.y = (int)r7.w | (int)r8.x;
          if (r7.x == 0) {
            r7.w = x0[r7.z+0].x;
            r5.w = r2.w * r7.w + r5.w;
            r6.x = r3.x * r7.w + r6.x;
          }
        }
        r7.z = (int)r7.z + 1;
      }
      r0.y = v1.x + -r5.y;
      r0.w = -v1.x + r5.w;
      r1.w = v1.y + -r5.z;
      r0.y = r3.w ? r0.y : r1.w;
      r1.w = -v1.y + r6.x;
      r0.w = r3.w ? r0.w : r1.w;
      r1.w = cmp(r6.y < 0);
      r1.w = cmp((int)r1.w != (int)r0.x);
      r2.y = r0.w + r0.y;
      r2.z = cmp(r6.z < 0);
      r0.x = cmp((int)r2.z != (int)r0.x);
      r2.y = 1 / r2.y;
      r2.z = cmp(r0.y < r0.w);
      r0.y = min(r0.y, r0.w);
      r0.x = r2.z ? r1.w : r0.x;
      r0.z = r0.z * r0.z;
      r0.y = r0.y * -r2.y + 0.5;
      r0.z = g_vFxaaQualityParams.z * r0.z;
      r0.x = (int)r0.y & (int)r0.x;
      r0.x = max(r0.x, r0.z);
      r0.xy = r0.xx * r2.xx + v1.xy;
      r2.x = r3.w ? v1.x : r0.x;
      r2.y = r3.w ? r0.y : v1.y;
      r1.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r2.xy, 0).xyz;
    }
  } else {
    r0.xy = (int2)v0.xy;
    r0.zw = float2(0,0);
    r0.xyz = g_tSceneMap.Load(r0.xyz).xyz;
    r1.xyz = min(float3(65024,65024,65024), r0.xyz);
  }
  r0.x = cmp(g_vRadialBlurInfo.x != 0.000000);
  if (r0.x != 0) {
    r0.x = (int)g_vRadialBlurInfo.z;
    r0.yz = v1.xy * float2(2,2) + float2(-1,-1);
    r0.yz = -g_vRadialBlurCenter.xy + r0.yz;
    r0.w = dot(r0.yz, r0.yz);
    r0.w = log2(r0.w);
    r0.w = g_vRadialBlurInfo.y * r0.w;
    r0.w = exp2(r0.w);
    r0.yz = -r0.yz * r0.ww;
    r0.yz = g_vRadialBlurInfo.xx * r0.yz;
    r2.xy = g_vSceneTexSize.xy * r0.yz;
    r0.w = dot(r2.xy, r2.xy);
    r0.w = sqrt(r0.w);
    r0.w = (int)r0.w;
    r0.w = max(1, (int)r0.w);
    r0.x = min((int)r0.w, (int)r0.x);
    r0.w = (int)r0.x;
    r0.yz = r0.yz / r0.ww;
    r2.xyz = r1.xyz;
    r3.xy = v1.xy;
    r1.w = 1;
    r2.w = 1;
    while (true) {
      r3.z = cmp((int)r2.w >= (int)r0.x);
      if (r3.z != 0) break;
      r3.xy = r3.xy + r0.yz;
      r4.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r3.xy, 0).xyz;
      r3.z = (int)r2.w;
      r3.z = r3.z / r0.w;
      r3.z = saturate(1 + -r3.z);
      r3.z = log2(r3.z);
      r3.z = g_vRadialBlurInfo.w * r3.z;
      r3.z = exp2(r3.z);
      r4.xyz = r4.xyz * r3.zzz + r2.xyz;
      r3.w = r3.z + r1.w;
      r4.w = 0.00392156886 * r3.w;
      r3.z = cmp(r3.z < r4.w);
      if (r3.z != 0) {
        r2.xyz = r4.xyz;
        r1.w = r3.w;
        break;
      }
      r2.w = (int)r2.w + 1;
      r2.xyz = r4.xyz;
      r1.w = r3.w;
    }
    r1.xyz = r2.xyz / r1.www;
  }
  
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = r1.rgb;
    return;
  }

  // gamma correction doesn't run, but g_vRadialBlurCenter.w (exposure) screws up scaling
  r0.x = cmp(g_vGammaCorrection.y != 1.000000);
  r0.yzw = log2(abs(r1.xyz));
  r0.yzw = g_vGammaCorrection.yyy * r0.yzw;
  r0.yzw = exp2(r0.yzw);
  r0.xyz = r0.xxx ? r0.yzw : r1.xyz;
  o0.xyz = g_vRadialBlurCenter.www * r0.xyz; // exposure
  o0.w = 1;
  return;
}