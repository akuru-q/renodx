#include "./common.hlsl"

Texture2D<float4> UITexture : register(t0);

Texture2D<float4> SceneTexture : register(t1);

cbuffer $Globals : register(b0) {
  float $Globals_007z : packoffset(c007.z);
  float $Globals_007w : packoffset(c007.w);
};

SamplerState UISampler : register(s0);

SamplerState SceneSampler : register(s1);

float4 main(
    noperspective float2 TEXCOORD: TEXCOORD,
    noperspective float4 SV_Position: SV_Position)
    : SV_Target {
  float4 SV_Target;

  // texture _1 = SceneTexture;
  // texture _2 = UITexture;
  // SamplerState _3 = SceneSampler;
  // SamplerState _4 = UISampler;
  // cbuffer _5 = $Globals;
  // _6 = _5;
  float _7 = TEXCOORD.x;
  float _8 = TEXCOORD.y;
  // _9 = _2;
  // _10 = _4;
  float4 _11 = UITexture.Sample(UISampler, float2(_7, _8));
  float _12 = _11.x;
  float _13 = _11.y;
  float _14 = _11.z;
  float _15 = _11.w;
  float _16 = max(6.103519990574569e-05f, _12);
  float _17 = max(6.103519990574569e-05f, _13);
  float _18 = max(6.103519990574569e-05f, _14);
  float _19 = _16 * 0.07739938050508499f;
  float _20 = _17 * 0.07739938050508499f;
  float _21 = _18 * 0.07739938050508499f;
  float _22 = _16 * 0.9478672742843628f;
  float _23 = _17 * 0.9478672742843628f;
  float _24 = _18 * 0.9478672742843628f;
  float _25 = _22 + 0.05213269963860512f;
  float _26 = _23 + 0.05213269963860512f;
  float _27 = _24 + 0.05213269963860512f;
  float _28 = log2(_25);
  float _29 = log2(_26);
  float _30 = log2(_27);
  float _31 = _28 * 2.4000000953674316f;
  float _32 = _29 * 2.4000000953674316f;
  float _33 = _30 * 2.4000000953674316f;
  float _34 = exp2(_31);
  float _35 = exp2(_32);
  float _36 = exp2(_33);
  bool _37 = (_16 > 0.040449999272823334f);
  bool _38 = (_17 > 0.040449999272823334f);
  bool _39 = (_18 > 0.040449999272823334f);
  float _40 = _37 ? _34 : _19;
  float _41 = _38 ? _35 : _20;
  float _42 = _39 ? _36 : _21;
  float _43 = _40 * 0.6274880170822144f;
  float _44 = mad(0.32926714420318604f, _41, _43);
  float _45 = mad(0.04330150783061981f, _42, _44);
  float _46 = _40 * 0.06910824030637741f;
  float _47 = mad(0.9195171594619751f, _41, _46);
  float _48 = mad(0.011359544470906258f, _42, _47);
  float _49 = _40 * 0.016396233811974525f;
  float _50 = mad(0.08802297711372375f, _41, _49);
  float _51 = mad(0.8954997062683105f, _42, _50);
  float _53 = $Globals_007w;
  _53 = 1.f;  // disable settings UI control

  float _54 = _53 * _45;
  float _55 = _53 * _48;
  float _56 = _53 * _51;

  // _57 = _1;
  // _58 = _3;
  // We don't use finalize here because it messes up with FSR3 FG
  float4 _59 = SceneTexture.Sample(SceneSampler, float2(_7, _8));
  return FinalizeUEOutput(_59, _11, true, true);

  float _60 = _59.x;
  float _61 = _59.y;
  float _62 = _59.z;

  float _63 = log2(_60);
  float _64 = log2(_61);
  float _65 = log2(_62);
  float _66 = _63 * 0.012683313339948654f;
  float _67 = _64 * 0.012683313339948654f;
  float _68 = _65 * 0.012683313339948654f;
  float _69 = exp2(_66);
  float _70 = exp2(_67);
  float _71 = exp2(_68);
  float _72 = _69 + -0.8359375f;
  float _73 = _70 + -0.8359375f;
  float _74 = _71 + -0.8359375f;
  float _75 = max(0.0f, _72);
  float _76 = max(0.0f, _73);
  float _77 = max(0.0f, _74);
  float _78 = _69 * 18.6875f;
  float _79 = _70 * 18.6875f;
  float _80 = _71 * 18.6875f;
  float _81 = 18.8515625f - _78;
  float _82 = 18.8515625f - _79;
  float _83 = 18.8515625f - _80;
  float _84 = _75 / _81;
  float _85 = _76 / _82;
  float _86 = _77 / _83;
  float _87 = log2(_84);
  float _88 = log2(_85);
  float _89 = log2(_86);
  float _90 = _87 * 6.277394771575928f;
  float _91 = _88 * 6.277394771575928f;
  float _92 = _89 * 6.277394771575928f;
  float _93 = exp2(_90);
  float _94 = exp2(_91);
  float _95 = exp2(_92);
  float _96 = _93 * 10000.0f;
  float _97 = _94 * 10000.0f;
  float _98 = _95 * 10000.0f;

  float _99 = $Globals_007z;
  _99 = 1.f;  // Disable game's UI level setting
  bool _100 = (_15 > 0.0f);
  bool _101 = (_15 < 1.0f);
  bool _102 = _100 && _101;
  float _119 = _96;
  float _120 = _97;
  float _121 = _98;
  if (_102) {
    float _104 = max(_96, 0.0f);
    float _105 = max(_97, 0.0f);
    float _106 = max(_98, 0.0f);
    float _107 = dot(float3(_104, _105, _106), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
    float _108 = _107 / _99;
    float _109 = _108 + 1.0f;
    float _110 = 1.0f / _109;
    float _111 = _110 * _99;
    float _112 = _111 + -1.0f;
    float _113 = _112 * _15;
    float _114 = _113 + 1.0f;
    float _115 = _114 * _104;
    float _116 = _114 * _105;
    float _117 = _114 * _106;
    _119 = _115;
    _120 = _116;
    _121 = _117;
  }
  float _122 = 1.0f - _15;
  float _123 = _119 * _122;
  float _124 = _120 * _122;
  float _125 = _121 * _122;

  // merging UI and game
  float _126 = _54 * _99;
  float _127 = _55 * _99;
  float _128 = _56 * _99;
  float _129 = _123 + _126;
  float _130 = _124 + _127;
  float _131 = _125 + _128;

  float _132 = _129 * 9.999999747378752e-05f;
  float _133 = _130 * 9.999999747378752e-05f;
  float _134 = _131 * 9.999999747378752e-05f;
  float _135 = log2(_132);
  float _136 = log2(_133);
  float _137 = log2(_134);
  float _138 = _135 * 0.1593017578125f;
  float _139 = _136 * 0.1593017578125f;
  float _140 = _137 * 0.1593017578125f;
  float _141 = exp2(_138);
  float _142 = exp2(_139);
  float _143 = exp2(_140);
  float _144 = _141 * 18.8515625f;
  float _145 = _142 * 18.8515625f;
  float _146 = _143 * 18.8515625f;
  float _147 = _144 + 0.8359375f;
  float _148 = _145 + 0.8359375f;
  float _149 = _146 + 0.8359375f;
  float _150 = _141 * 18.6875f;
  float _151 = _142 * 18.6875f;
  float _152 = _143 * 18.6875f;
  float _153 = _150 + 1.0f;
  float _154 = _151 + 1.0f;
  float _155 = _152 + 1.0f;
  float _156 = 1.0f / _153;
  float _157 = 1.0f / _154;
  float _158 = 1.0f / _155;
  float _159 = _156 * _147;
  float _160 = _157 * _148;
  float _161 = _158 * _149;
  float _162 = log2(_159);
  float _163 = log2(_160);
  float _164 = log2(_161);
  float _165 = _162 * 78.84375f;
  float _166 = _163 * 78.84375f;
  float _167 = _164 * 78.84375f;
  float _168 = exp2(_165);
  float _169 = exp2(_166);
  float _170 = exp2(_167);
  SV_Target.x = _168;
  SV_Target.y = _169;
  SV_Target.z = _170;
  SV_Target.w = _15;

  return SV_Target;
}
