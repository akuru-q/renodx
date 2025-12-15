/*
 * Copyright (C) 2025 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../templates/settings.hpp"
#include "../../utils/date.hpp"
#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

ShaderInjectData shader_injection;

bool AddToCgCount(reshade::api::command_list* cmd_list) {
  shader_injection.custom_cg_count += 1.f;

  return true;
}

renodx::mods::shader::CustomShaders custom_shaders = {
  CustomShaderEntry(0x27B872F2), // final
  CustomShaderEntry(0x6370B56D), // movie
  //CustomShaderEntry(0x755B83C8), // bloom
  //CustomShaderEntry(0xB236AEE0), // bloom
  //CustomShaderEntry(0x652636CE), // bloom
  //CustomShaderEntry(0xE16F9932), // bloom
  //CustomShaderEntry(0xFD753992), // bloom
  CustomShaderEntry(0x416FF167), // bloom
  CustomShaderEntry(0x6A58BC19), // dof1
  CustomShaderEntry(0x7E291495), // dof2
  CustomShaderEntry(0x61D49EC3), // pre fxaa
  CustomShaderEntry(0x2F7287D7), // artifacts

  BypassShaderEntry(0x041C3762), // first person low res overlay that adds nothing
  BypassShaderEntry(0xE8B21A52), // bypass broken batting center shader

  // cg permutations
  CustomShaderEntryCallback(0x058BF000, &AddToCgCount),
  CustomShaderEntryCallback(0x05B43BDB, &AddToCgCount),
  CustomShaderEntryCallback(0x0C595E87, &AddToCgCount),
  CustomShaderEntryCallback(0x0D3202D5, &AddToCgCount),
  CustomShaderEntryCallback(0x1C1CAB76, &AddToCgCount),
  CustomShaderEntryCallback(0x38FD9EBD, &AddToCgCount),
  CustomShaderEntryCallback(0x42D32094, &AddToCgCount),
  CustomShaderEntryCallback(0x43863885, &AddToCgCount),
  CustomShaderEntryCallback(0x48B3F6AE, &AddToCgCount),
  CustomShaderEntryCallback(0x4A134172, &AddToCgCount),
  CustomShaderEntryCallback(0x4BBB3C60, &AddToCgCount),
  CustomShaderEntryCallback(0x4CB0D887, &AddToCgCount),
  //CustomShaderEntryCallback(0x4E764ED8, &AddToCgCount),			
  CustomShaderEntryCallback(0x527D626B, &AddToCgCount),
  CustomShaderEntryCallback(0x55FDC030, &AddToCgCount),
  CustomShaderEntryCallback(0x5AC3F7CD, &AddToCgCount),
  CustomShaderEntryCallback(0x5EE2913B, &AddToCgCount),
  CustomShaderEntryCallback(0x613EADB8, &AddToCgCount),
  CustomShaderEntryCallback(0x64FFC5C7, &AddToCgCount),
  CustomShaderEntryCallback(0x6BE6F0AC, &AddToCgCount),
  CustomShaderEntryCallback(0x6D4B8F91, &AddToCgCount),
  CustomShaderEntryCallback(0x7D90228C, &AddToCgCount),
  CustomShaderEntryCallback(0x81F6BDCB, &AddToCgCount),
  CustomShaderEntryCallback(0x8B3613BE, &AddToCgCount),
  CustomShaderEntryCallback(0x9B9DE740, &AddToCgCount),
  CustomShaderEntryCallback(0x9D6EF05E, &AddToCgCount),
  CustomShaderEntryCallback(0x9F274920, &AddToCgCount),
  CustomShaderEntryCallback(0xA540C9FD, &AddToCgCount),
  CustomShaderEntryCallback(0xAF8C4C85, &AddToCgCount),
  CustomShaderEntryCallback(0xB182D89E, &AddToCgCount),
  CustomShaderEntryCallback(0xB6AFEDAA, &AddToCgCount),
  CustomShaderEntryCallback(0xC416F8B5, &AddToCgCount),
  CustomShaderEntryCallback(0xCF7D978E, &AddToCgCount),
  CustomShaderEntryCallback(0xD0DB8FFB, &AddToCgCount),
  CustomShaderEntryCallback(0xD1E67953, &AddToCgCount),
  CustomShaderEntryCallback(0xD3D23323, &AddToCgCount),
  CustomShaderEntryCallback(0xEA23BEA5, &AddToCgCount),
  CustomShaderEntryCallback(0xEAFA598D, &AddToCgCount),
  CustomShaderEntryCallback(0xED23E647, &AddToCgCount),
  CustomShaderEntryCallback(0xF22A8AF9, &AddToCgCount),
  CustomShaderEntryCallback(0xF4418B04, &AddToCgCount),
  CustomShaderEntryCallback(0xF6463657, &AddToCgCount),
  CustomShaderEntryCallback(0xFA1FD927, &AddToCgCount),
  CustomShaderEntryCallback(0xFD1A82FE, &AddToCgCount),

  CustomShaderEntry(0x000A56D1),
  CustomShaderEntry(0x01F09891),
  CustomShaderEntry(0x02262BE2),
  CustomShaderEntry(0x0271B0F2),
  CustomShaderEntry(0x03F4FA16),
  CustomShaderEntry(0x040DEC7F),
  CustomShaderEntry(0x04188F99),
  CustomShaderEntry(0x04291164),
  CustomShaderEntry(0x04AA0406),
  CustomShaderEntry(0x04AC85D2),
  CustomShaderEntry(0x04F7B5E3),
  CustomShaderEntry(0x050D90D4),
  CustomShaderEntry(0x059826CA),
  CustomShaderEntry(0x05F3C9CD),
  CustomShaderEntry(0x06883050),
  CustomShaderEntry(0x06C956BE),
  CustomShaderEntry(0x0759C824),
  CustomShaderEntry(0x07943659),
  CustomShaderEntry(0x07EF01FF),
  CustomShaderEntry(0x07F6DDC2),
  CustomShaderEntry(0x08067910),
  CustomShaderEntry(0x081E126C),
  CustomShaderEntry(0x09C9B985),
  CustomShaderEntry(0x0BE4F115),
  CustomShaderEntry(0x0C73E2C2),
  CustomShaderEntry(0x0C9453D5),
  CustomShaderEntry(0x0DD5EE60),
  CustomShaderEntry(0x0DE16614),
  CustomShaderEntry(0x0DE1D62B),
  CustomShaderEntry(0x0DEE3884),
  CustomShaderEntry(0x0E643BF7),
  CustomShaderEntry(0x0F952A08),
  CustomShaderEntry(0x0FABDCD7),
  CustomShaderEntry(0x107E7666),
  CustomShaderEntry(0x11DEFBCB),
  CustomShaderEntry(0x120E6B60),
  CustomShaderEntry(0x123854EF),
  CustomShaderEntry(0x128F23B6),
  CustomShaderEntry(0x12BE2F5A),
  CustomShaderEntry(0x12FA75D4),
  CustomShaderEntry(0x132147AD),
  CustomShaderEntry(0x133160B1),
  CustomShaderEntry(0x1386A6C4),
  CustomShaderEntry(0x139D216A),
  CustomShaderEntry(0x1404C7B3),
  CustomShaderEntry(0x14410DEA),
  CustomShaderEntry(0x14661591),
  CustomShaderEntry(0x150599A1),
  CustomShaderEntry(0x1594E42A),
  CustomShaderEntry(0x16717814),
  CustomShaderEntry(0x175C8AA3),
  CustomShaderEntry(0x1783EFCC),
  CustomShaderEntry(0x18004945),
  CustomShaderEntry(0x180057F6),
  CustomShaderEntry(0x180D47DC),
  CustomShaderEntry(0x1869AD3C),
  CustomShaderEntry(0x18BD6B43),
  CustomShaderEntry(0x18C002DE),
  CustomShaderEntry(0x197F88DF),
  CustomShaderEntry(0x19C90D71),
  CustomShaderEntry(0x19DC4C39),
  CustomShaderEntry(0x1A74A893),
  CustomShaderEntry(0x1B2E7A51),
  CustomShaderEntry(0x1BA4AD1B),
  CustomShaderEntry(0x1BF6C280),
  CustomShaderEntry(0x1CB14018),
  CustomShaderEntry(0x1D058DA7),
  CustomShaderEntry(0x1D13E4A1),
  CustomShaderEntry(0x1E8D6503),
  CustomShaderEntry(0x1EB8AD99),
  CustomShaderEntry(0x1F1AA04B),
  CustomShaderEntry(0x1F492DFE),
  CustomShaderEntry(0x1F9CFC00),
  CustomShaderEntry(0x1FCF45B0),
  CustomShaderEntry(0x20F74679),
  CustomShaderEntry(0x212BA502),
  CustomShaderEntry(0x216EBBBE),
  CustomShaderEntry(0x217C4750),
  CustomShaderEntry(0x21D6B41B),
  CustomShaderEntry(0x21E408EA),
  CustomShaderEntry(0x2257CDBA),
  CustomShaderEntry(0x22677FBA),
  CustomShaderEntry(0x237B8BA2),
  CustomShaderEntry(0x237E30D7),
  CustomShaderEntry(0x2387FB8E),
  CustomShaderEntry(0x258BBE7D),
  CustomShaderEntry(0x25C4726C),
  CustomShaderEntry(0x25E360FA),
  CustomShaderEntry(0x2630D46D),
  CustomShaderEntry(0x26514EA6),
  CustomShaderEntry(0x26C6FBD9),
  CustomShaderEntry(0x27474FD4),
  CustomShaderEntry(0x2770423A),
  CustomShaderEntry(0x27E3EA4F),
  CustomShaderEntry(0x286342D6),
  CustomShaderEntry(0x28BF8A97),
  CustomShaderEntry(0x290E622C),
  CustomShaderEntry(0x29D40E9F),
  CustomShaderEntry(0x29D7D2F5),
  CustomShaderEntry(0x2A19EAB2),
  CustomShaderEntry(0x2A2AE8FD),
  CustomShaderEntry(0x2B9D3608),
  CustomShaderEntry(0x2BEAF5CE),
  CustomShaderEntry(0x2DEE397D),
  CustomShaderEntry(0x2E44183D),
  CustomShaderEntry(0x2E7B0AB7),
  CustomShaderEntry(0x2E94F80D),
  CustomShaderEntry(0x2F20FBEA),
  CustomShaderEntry(0x2F261D33),
  CustomShaderEntry(0x2F55951D),
  CustomShaderEntry(0x2FAA2F27),
  CustomShaderEntry(0x30A062B4),
  CustomShaderEntry(0x313489F7),
  CustomShaderEntry(0x31507EEB),
  CustomShaderEntry(0x3219BE31),
  CustomShaderEntry(0x3356503F),
  CustomShaderEntry(0x33F004D1),
  CustomShaderEntry(0x34102D22),
  CustomShaderEntry(0x366280CF),
  CustomShaderEntry(0x36EE54C2),
  CustomShaderEntry(0x36FA7124),
  CustomShaderEntry(0x37AD53F4),
  CustomShaderEntry(0x37BC6851),
  CustomShaderEntry(0x387A4891),
  CustomShaderEntry(0x3882520F),
  CustomShaderEntry(0x39E22249),
  CustomShaderEntry(0x3AB719D1),
  CustomShaderEntry(0x3AF7625A),
  CustomShaderEntry(0x3B9E20BC),
  CustomShaderEntry(0x3BA11C89),
  CustomShaderEntry(0x3CBFD712),
  CustomShaderEntry(0x3E587F3C),
  CustomShaderEntry(0x3E854E72),
  CustomShaderEntry(0x3F3E4162),
  CustomShaderEntry(0x40F2BCA9),
  CustomShaderEntry(0x41B93DF6),
  CustomShaderEntry(0x41E39EE5),
  CustomShaderEntry(0x422BCEA8),
  CustomShaderEntry(0x426032AB),
  CustomShaderEntry(0x4428974E),
  CustomShaderEntry(0x44C2577B),
  CustomShaderEntry(0x4528CE03),
  CustomShaderEntry(0x45A71FF2),
  CustomShaderEntry(0x463A9119),
  CustomShaderEntry(0x4708152A),
  CustomShaderEntry(0x47B102F3),
  CustomShaderEntry(0x483D213C),
  CustomShaderEntry(0x487C8512),
  CustomShaderEntry(0x489E1A2F),
  CustomShaderEntry(0x4983B077),
  CustomShaderEntry(0x499D46EC),
  CustomShaderEntry(0x49B14582),
  CustomShaderEntry(0x4B0026EF),
  CustomShaderEntry(0x4B90D892),
  CustomShaderEntry(0x4BE94B68),
  CustomShaderEntry(0x4C2626DE),
  CustomShaderEntry(0x4D1DBE58),
  CustomShaderEntry(0x4E764ED8),
  CustomShaderEntry(0x4EDCBB6D),
  CustomShaderEntry(0x4F6677C8),
  CustomShaderEntry(0x4F8801E5),
  CustomShaderEntry(0x4FBE4909),
  CustomShaderEntry(0x4FF48E40),
  CustomShaderEntry(0x50AAC7A5),
  CustomShaderEntry(0x52560C0A),
  CustomShaderEntry(0x5273FD09),
  CustomShaderEntry(0x53F8D8B6),
  CustomShaderEntry(0x55820E6C),
  CustomShaderEntry(0x56BC1A13),
  CustomShaderEntry(0x57D8DED8),
  CustomShaderEntry(0x587E741E),
  CustomShaderEntry(0x588CC84E),
  CustomShaderEntry(0x58F5A237),
  CustomShaderEntry(0x59815171),
  CustomShaderEntry(0x59DAB63D),
  CustomShaderEntry(0x59F23320),
  CustomShaderEntry(0x5A91F071),
  CustomShaderEntry(0x5AB95BC8),
  CustomShaderEntry(0x5B2445B8),
  CustomShaderEntry(0x5B9BE425),
  CustomShaderEntry(0x5BA9741B),
  CustomShaderEntry(0x5BD9AD98),
  CustomShaderEntry(0x5CC50AAC),
  CustomShaderEntry(0x5D187FB7),
  CustomShaderEntry(0x5DC90ADA),
  CustomShaderEntry(0x5DCF2929),
  CustomShaderEntry(0x5DD0CCD2),
  CustomShaderEntry(0x5E0E716B),
  CustomShaderEntry(0x5E1CCE85),
  CustomShaderEntry(0x5E483444),
  CustomShaderEntry(0x5ED75555),
  CustomShaderEntry(0x5EFBDCD2),
  CustomShaderEntry(0x5F080949),
  CustomShaderEntry(0x5F49B61B),
  CustomShaderEntry(0x5F4FA0DC),
  CustomShaderEntry(0x60796BB1),
  CustomShaderEntry(0x60CAB5DA),
  CustomShaderEntry(0x61417637),
  CustomShaderEntry(0x61C48B2A),
  CustomShaderEntry(0x61D8DBB3),
  CustomShaderEntry(0x627F4863),
  CustomShaderEntry(0x62854D6D),
  CustomShaderEntry(0x6400C84F),
  CustomShaderEntry(0x644CB5E7),
  CustomShaderEntry(0x6560D55E),
  CustomShaderEntry(0x65D927C6),
  CustomShaderEntry(0x661AED2E),
  CustomShaderEntry(0x66B71602),
  CustomShaderEntry(0x674FFCA4),
  CustomShaderEntry(0x67C4DE89),
  CustomShaderEntry(0x67C57EE9),
  CustomShaderEntry(0x6817146A),
  CustomShaderEntry(0x68B48261),
  CustomShaderEntry(0x69057D61),
  CustomShaderEntry(0x6963ECDA),
  CustomShaderEntry(0x6965BBE8),
  CustomShaderEntry(0x6B9D15C3),
  CustomShaderEntry(0x6BA8E0E6),
  CustomShaderEntry(0x6BB9A1D1),
  CustomShaderEntry(0x6C4CFC71),
  CustomShaderEntry(0x6C7C1D70),
  CustomShaderEntry(0x6D83E64F),
  CustomShaderEntry(0x6D8E0E52),
  CustomShaderEntry(0x6DD38FB3),
  CustomShaderEntry(0x6F24DA69),
  CustomShaderEntry(0x6F732888),
  CustomShaderEntry(0x6FA02922),
  CustomShaderEntry(0x6FA0779F),
  CustomShaderEntry(0x7059A9BE),
  CustomShaderEntry(0x707B857C),
  CustomShaderEntry(0x70BC596C),
  CustomShaderEntry(0x70C898D2),
  CustomShaderEntry(0x711031ED),
  CustomShaderEntry(0x71BC7470),
  CustomShaderEntry(0x72D9154C),
  CustomShaderEntry(0x732521F3),
  CustomShaderEntry(0x7362043B),
  CustomShaderEntry(0x73C6D64E),
  CustomShaderEntry(0x74106BD2),
  CustomShaderEntry(0x7441E091),
  CustomShaderEntry(0x747A991B),
  CustomShaderEntry(0x74833137),
  CustomShaderEntry(0x751CCAD6),
  CustomShaderEntry(0x761143D9),
  CustomShaderEntry(0x7625DBBA),
  CustomShaderEntry(0x76F7191B),
  CustomShaderEntry(0x77CF1D13),
  CustomShaderEntry(0x7863C0CD),
  CustomShaderEntry(0x791C62BD),
  CustomShaderEntry(0x79499F8B),
  CustomShaderEntry(0x79820CC3),
  CustomShaderEntry(0x799623D4),
  CustomShaderEntry(0x79A2C823),
  CustomShaderEntry(0x7A26DCCA),
  CustomShaderEntry(0x7A4976D4),
  CustomShaderEntry(0x7A8622B7),
  CustomShaderEntry(0x7AF91C2B),
  CustomShaderEntry(0x7B3168B2),
  CustomShaderEntry(0x7B4B60C8),
  CustomShaderEntry(0x7BCE8965),
  CustomShaderEntry(0x7BE3F68A),
  CustomShaderEntry(0x7C3F1F9D),
  CustomShaderEntry(0x7C428428),
  CustomShaderEntry(0x7CDB4CFD),
  CustomShaderEntry(0x7CF33021),
  CustomShaderEntry(0x7E8D682B),
  CustomShaderEntry(0x7F1A0401),
  CustomShaderEntry(0x7F8B1902),
  CustomShaderEntry(0x7FB55F3F),
  CustomShaderEntry(0x7FBC6039),
  CustomShaderEntry(0x8018C0F4),
  CustomShaderEntry(0x80BC1C93),
  CustomShaderEntry(0x81C9477C),
  CustomShaderEntry(0x81D42FE9),
  CustomShaderEntry(0x825F7092),
  CustomShaderEntry(0x82B24D83),
  CustomShaderEntry(0x82DE4CA2),
  CustomShaderEntry(0x832EA33E),
  CustomShaderEntry(0x83E62B78),
  CustomShaderEntry(0x84C4BFF6),
  CustomShaderEntry(0x85BDB076),
  CustomShaderEntry(0x86264EF2),
  CustomShaderEntry(0x8652E832),
  CustomShaderEntry(0x86B10CBB),
  CustomShaderEntry(0x86EEA6CA),
  CustomShaderEntry(0x870B1B59),
  CustomShaderEntry(0x887B1A86),
  CustomShaderEntry(0x894B2E9F),
  CustomShaderEntry(0x8A247C18),
  CustomShaderEntry(0x8B131159),
  CustomShaderEntry(0x8BA2F58F),
  CustomShaderEntry(0x8C74F8ED),
  CustomShaderEntry(0x8CAC9773),
  CustomShaderEntry(0x8DBC410C),
  CustomShaderEntry(0x8E29818B),
  CustomShaderEntry(0x8E834711),
  CustomShaderEntry(0x90C3040B),
  CustomShaderEntry(0x916F5CFE),
  CustomShaderEntry(0x919D6B02),
  CustomShaderEntry(0x938E824D),
  CustomShaderEntry(0x93A6BD29),
  CustomShaderEntry(0x93C0B2F1),
  CustomShaderEntry(0x93D9368B),
  CustomShaderEntry(0x95859E2C),
  CustomShaderEntry(0x963FEACA),
  CustomShaderEntry(0x96415B1F),
  CustomShaderEntry(0x96E3E43B),
  CustomShaderEntry(0x97AF9471),
  CustomShaderEntry(0x97B5216C),
  CustomShaderEntry(0x989390B3),
  CustomShaderEntry(0x99A67675),
  CustomShaderEntry(0x99F4630C),
  CustomShaderEntry(0x9AB4668E),
  CustomShaderEntry(0x9AFFAC34),
  CustomShaderEntry(0x9B69482C),
  CustomShaderEntry(0x9C2A8912),
  CustomShaderEntry(0x9CEC86BA),
  CustomShaderEntry(0x9D578AF3),
  CustomShaderEntry(0x9DC20556),
  CustomShaderEntry(0x9DEE9DDA),
  CustomShaderEntry(0x9E612BA0),
  CustomShaderEntry(0x9E8A6689),
  CustomShaderEntry(0x9EBDF87B),
  CustomShaderEntry(0xA0B32FE8),
  CustomShaderEntry(0xA125C1C4),
  CustomShaderEntry(0xA3DA2314),
  CustomShaderEntry(0xA3DE5759),
  CustomShaderEntry(0xA48B58A2),
  CustomShaderEntry(0xA54FD65F),
  CustomShaderEntry(0xA5762397),
  CustomShaderEntry(0xA5AF3819),
  CustomShaderEntry(0xA5F038CC),
  CustomShaderEntry(0xA6194C3B),
  CustomShaderEntry(0xA6791A24),
  CustomShaderEntry(0xA6C3BAC9),
  CustomShaderEntry(0xA72A4AE8),
  CustomShaderEntry(0xA7382E1C),
  CustomShaderEntry(0xA87E2D9D),
  CustomShaderEntry(0xA8E23679),
  CustomShaderEntry(0xAA034E0E),
  CustomShaderEntry(0xAA82B2CB),
  CustomShaderEntry(0xAC7A9B34),
  CustomShaderEntry(0xAD23EE52),
  CustomShaderEntry(0xAD4095D1),
  CustomShaderEntry(0xAD630659),
  CustomShaderEntry(0xAD7CE6D5),
  CustomShaderEntry(0xADE84B4C),
  CustomShaderEntry(0xAE055032),
  CustomShaderEntry(0xAE9C1EB6),
  CustomShaderEntry(0xAEA3DE45),
  CustomShaderEntry(0xAEC8A5F9),
  CustomShaderEntry(0xAF3E449A),
  CustomShaderEntry(0xAF78C961),
  CustomShaderEntry(0xAFC0B37A),
  CustomShaderEntry(0xAFCA9CCE),
  CustomShaderEntry(0xB02E7AFC),
  CustomShaderEntry(0xB09D691D),
  CustomShaderEntry(0xB0DEB785),
  CustomShaderEntry(0xB0FE2E16),
  CustomShaderEntry(0xB1806E09),
  CustomShaderEntry(0xB1BECBB2),
  CustomShaderEntry(0xB1F79668),
  CustomShaderEntry(0xB38A9FDA),
  CustomShaderEntry(0xB3B5622B),
  CustomShaderEntry(0xB422CFD6),
  CustomShaderEntry(0xB457FFDD),
  CustomShaderEntry(0xB5CE9A81),
  CustomShaderEntry(0xB67556E9),
  CustomShaderEntry(0xB68FC734),
  CustomShaderEntry(0xB6F3BA37),
  CustomShaderEntry(0xB8F1440C),
  CustomShaderEntry(0xB94AEA10),
  CustomShaderEntry(0xB9AB17F7),
  CustomShaderEntry(0xB9E3B84F),
  CustomShaderEntry(0xBA8A1E67),
  CustomShaderEntry(0xBB7CB89A),
  CustomShaderEntry(0xBBA8F17A),
  CustomShaderEntry(0xBBBA81AA),
  CustomShaderEntry(0xBBE65973),
  CustomShaderEntry(0xBCA25C2A),
  CustomShaderEntry(0xBCDF4F00),
  CustomShaderEntry(0xBCEEF91B),
  CustomShaderEntry(0xBCF260CF),
  CustomShaderEntry(0xBE445C1F),
  CustomShaderEntry(0xBE820F9F),
  CustomShaderEntry(0xBED11B02),
  CustomShaderEntry(0xBFA5F995),
  CustomShaderEntry(0xBFAA801F),
  CustomShaderEntry(0xBFBD00F6),
  CustomShaderEntry(0xC188F616),
  CustomShaderEntry(0xC1C77B4D),
  CustomShaderEntry(0xC2AA148B),
  CustomShaderEntry(0xC343E42F),
  CustomShaderEntry(0xC3685DC4),
  CustomShaderEntry(0xC3B31B0E),
  CustomShaderEntry(0xC3BC4754),
  CustomShaderEntry(0xC4167BB5),
  CustomShaderEntry(0xC47A680D),
  CustomShaderEntry(0xC4B49B00),
  CustomShaderEntry(0xC4FA1C04),
  CustomShaderEntry(0xC55460F6),
  CustomShaderEntry(0xC58038B9),
  CustomShaderEntry(0xC5CD7567),
  CustomShaderEntry(0xC5D16FE1),
  CustomShaderEntry(0xC625B2D3),
  CustomShaderEntry(0xC6485113),
  CustomShaderEntry(0xC65DC48E),
  CustomShaderEntry(0xC6C9B158),
  CustomShaderEntry(0xC7329441),
  CustomShaderEntry(0xC73B838F),
  CustomShaderEntry(0xC75D350C),
  CustomShaderEntry(0xC79336D0),
  CustomShaderEntry(0xC7D1D9CE),
  CustomShaderEntry(0xC87582AF),
  CustomShaderEntry(0xC87C1F4D),
  CustomShaderEntry(0xC893D8C0),
  CustomShaderEntry(0xC96118CF),
  CustomShaderEntry(0xCA9B5687),
  CustomShaderEntry(0xCAEA2EB2),
  CustomShaderEntry(0xCBD2EAAC),
  CustomShaderEntry(0xCC13ECA2),
  CustomShaderEntry(0xCC631422),
  CustomShaderEntry(0xCC6E2B60),
  CustomShaderEntry(0xCCAB92D1),
  CustomShaderEntry(0xCD0A4944),
  CustomShaderEntry(0xCE491F86),
  CustomShaderEntry(0xCFFE11C9),
  CustomShaderEntry(0xD06B1241),
  CustomShaderEntry(0xD0E33433),
  CustomShaderEntry(0xD0F8F855),
  CustomShaderEntry(0xD0FF92FC),
  CustomShaderEntry(0xD25F199D),
  CustomShaderEntry(0xD34E1C9C),
  CustomShaderEntry(0xD37F4E55),
  CustomShaderEntry(0xD3DD53D3),
  CustomShaderEntry(0xD4AD436D),
  CustomShaderEntry(0xD519882F),
  CustomShaderEntry(0xD52657E6),
  CustomShaderEntry(0xD5C2FE34),
  CustomShaderEntry(0xD5CAF143),
  CustomShaderEntry(0xD5E80069),
  CustomShaderEntry(0xD624AAC9),
  CustomShaderEntry(0xD629D6F1),
  CustomShaderEntry(0xD6BDE69F),
  CustomShaderEntry(0xD77C9DD2),
  CustomShaderEntry(0xD81777E1),
  CustomShaderEntry(0xDA367A82),
  CustomShaderEntry(0xDA787724),
  CustomShaderEntry(0xDB84DECE),
  CustomShaderEntry(0xDC41C20D),
  CustomShaderEntry(0xDCB6E5BD),
  CustomShaderEntry(0xDCCD85A4),
  CustomShaderEntry(0xDCFAF5D0),
  CustomShaderEntry(0xDD31BB69),
  CustomShaderEntry(0xDD625E56),
  CustomShaderEntry(0xDD807A25),
  CustomShaderEntry(0xDDC3EB98),
  CustomShaderEntry(0xDE55DC6E),
  CustomShaderEntry(0xDE566E14),
  CustomShaderEntry(0xDEA911A9),
  CustomShaderEntry(0xDF49A431),
  CustomShaderEntry(0xDF585B60),
  CustomShaderEntry(0xE00CEA5A),
  CustomShaderEntry(0xE075E1DE),
  CustomShaderEntry(0xE0F9E223),
  CustomShaderEntry(0xE119AB02),
  CustomShaderEntry(0xE174F7C6),
  CustomShaderEntry(0xE1CAD14D),
  CustomShaderEntry(0xE1E764D1),
  CustomShaderEntry(0xE28E8031),
  CustomShaderEntry(0xE28ED5EA),
  CustomShaderEntry(0xE3331C91),
  CustomShaderEntry(0xE48AD455),
  CustomShaderEntry(0xE4945FC1),
  CustomShaderEntry(0xE4CB383F),
  CustomShaderEntry(0xE4F6F651),
  CustomShaderEntry(0xE50D821B),
  CustomShaderEntry(0xE57D906A),
  CustomShaderEntry(0xE57DE3F1),
  CustomShaderEntry(0xE59BCD8A),
  CustomShaderEntry(0xE5A4FE96),
  CustomShaderEntry(0xE65DF09F),
  CustomShaderEntry(0xE668335B),
  CustomShaderEntry(0xE6A642A8),
  CustomShaderEntry(0xE6B04B6E),
  CustomShaderEntry(0xE849D806),
  CustomShaderEntry(0xE8802BA5),
  CustomShaderEntry(0xE98DDD1A),
  CustomShaderEntry(0xEA3EFBCA),
  CustomShaderEntry(0xEA43DC69),
  CustomShaderEntry(0xEAD1E8F2),
  CustomShaderEntry(0xEB2650D6),
  CustomShaderEntry(0xEBB99146),
  CustomShaderEntry(0xEBD4D88F),
  CustomShaderEntry(0xED7360C3),
  CustomShaderEntry(0xED87787B),
  CustomShaderEntry(0xED9BA441),
  CustomShaderEntry(0xEF9E0A47),
  CustomShaderEntry(0xEFE91C01),
  CustomShaderEntry(0xF0B96793),
  CustomShaderEntry(0xF0EAA946),
  CustomShaderEntry(0xF1038EDC),
  CustomShaderEntry(0xF1FFF3EE),
  CustomShaderEntry(0xF235EB4F),
  CustomShaderEntry(0xF2977819),
  CustomShaderEntry(0xF4864166),
  CustomShaderEntry(0xF512300B),
  CustomShaderEntry(0xF55FC10A),
  CustomShaderEntry(0xF639BC02),
  CustomShaderEntry(0xF683377B),
  CustomShaderEntry(0xF684F8AF),
  CustomShaderEntry(0xF84D5E59),
  CustomShaderEntry(0xF87D65E4),
  CustomShaderEntry(0xF8C4575C),
  CustomShaderEntry(0xF9AAF9A6),
  CustomShaderEntry(0xFB19379D),
  CustomShaderEntry(0xFB703F82),
  CustomShaderEntry(0xFC3DB6D3),
  CustomShaderEntry(0xFC84162B),
  CustomShaderEntry(0xFD367175),
  CustomShaderEntry(0xFD3A918A),
  CustomShaderEntry(0xFE8C0813),
  CustomShaderEntry(0xFF228EE1),
  CustomShaderEntry(0xFFCED585),

};

renodx::utils::settings::Settings settings = renodx::templates::settings::JoinSettings(
{renodx::templates::settings::CreateDefaultSettings({
  {"ToneMapType", {.binding = &shader_injection.tone_map_type}},
  {"ToneMapPeakNits",  {.binding = &shader_injection.peak_white_nits}},
  {"ToneMapGameNits",  {.binding = &shader_injection.diffuse_white_nits}},
  {"ToneMapUINits", {.binding =  &shader_injection.graphics_white_nits}},
  {"ToneMapGammaCorrection", {.binding =  &shader_injection.gamma_correction}},
  {"ToneMapHueCorrection", {.binding =  &shader_injection.tone_map_hue_correction, .default_value = 50.f}},
  {"ToneMapHueShift", {.binding =  &shader_injection.tone_map_hue_shift, .default_value = 80.f, .label = "Chrominance Correction", .tooltip = "Emulates vanilla SDR chrominance/blowout."}},
  {"ToneMapScaling", {.binding =  &shader_injection.tone_map_per_channel}}, 
  {"ColorGradeExposure",  {.binding = &shader_injection.tone_map_exposure}},
  {"ColorGradeHighlights",  {.binding = &shader_injection.tone_map_highlights}},
  {"ColorGradeShadows",  {.binding = &shader_injection.tone_map_shadows}},
  {"ColorGradeContrast",  {.binding = &shader_injection.tone_map_contrast}},
  {"ColorGradeSaturation",  {.binding = &shader_injection.tone_map_saturation}},
  {"ColorGradeHighlightSaturation", {.binding =  &shader_injection.tone_map_highlight_saturation}},
  {"ColorGradeBlowout", {.binding =  &shader_injection.tone_map_blowout}},
  {"ColorGradeFlare",  {.binding = &shader_injection.tone_map_flare}},
  //{"FxBloom", {.binding = &shader_injection.custom_bloom}},
}),
{
  new renodx::utils::settings::Setting{
      .key = "FxHDRVideos",
      .binding = &shader_injection.custom_hdr_videos,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 1.f,
      .label = "HDR Videos",
      .section = "Effects",
      .labels = {"Off", "On"},
  },
  new renodx::utils::settings::Setting{
      .key = "CustomBloom",
      .binding = &shader_injection.custom_bloom,
      .value_type = renodx::utils::settings::SettingValueType::INTEGER,
      .default_value = 0.f,
      .label = "Broken Bloom",
      .section = "Effects",
      .labels = {"Lowered Intensity", "Off"},
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "HDR Look",
      .section = "Presets",
      .group = "button-line-1",
      .tint = 0xb5b2b1,
      .on_change = []() {
        renodx::utils::settings::UpdateSetting("ToneMapType", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapHueProcessor", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapWorkingColorSpace", 0.f);
        renodx::utils::settings::UpdateSetting("GammaCorrection", 1.f);
        renodx::utils::settings::UpdateSetting("ToneMapScaling", 0.f);
        renodx::utils::settings::UpdateSetting("ColorGradeExposure", 1.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlights", 55.f);
        renodx::utils::settings::UpdateSetting("ColorGradeShadows", 57.f);
        renodx::utils::settings::UpdateSetting("ColorGradeContrast", 60.f);
        renodx::utils::settings::UpdateSetting("ColorGradeSaturation", 60.f);
        renodx::utils::settings::UpdateSetting("ColorGradeHighlightSaturation", 50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeBlowout", 50.f);
        renodx::utils::settings::UpdateSetting("ColorGradeFlare", 0.f);
      }
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "Reset All",
      .section = "Presets",
      .group = "button-line-1",
      .on_change = []() {
        for (auto setting : settings) {
          if (setting->key.empty()) continue;
          if (!setting->can_reset) continue;
          renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
        }
      },
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "The game needs a restart if you change resolution or SSAA settings!",
      .section = "Instructions",
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Game mod by akuru, RenoDX Framework by ShortFuse",
      .section = "About",
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "Special thanks to Chalk for extensive playtesting!",
      .section = "About",
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "RenoDX Discord",
      .section = "Links",
      .group = "button-line-1",
      .tint = 0x5865F2,
      .on_change = []() {
        renodx::utils::platform::LaunchURL("https://discord.gg/Ce9b", "QHQrSV");
      },
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::BUTTON,
      .label = "More RenoDX mods",
      .section = "Links",
      .group = "button-line-1",
      .on_change = []() {
        renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx/wiki/Mods");
      },
  },
  new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
      .section = "About",
  },
}});

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapUINits", 203.f},
      {"ToneMapGammaCorrection", 0.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
  });
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;

  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  settings[2]->can_reset = true;
  if (peak.has_value()) {
    settings[2]->default_value = roundf(peak.value());
  } else {
    settings[2]->default_value = 1000.f;
  }

  //settings[3]->default_value = fmin(renodx::utils::swapchain::ComputeReferenceWhite(settings[2]->default_value), 203.f);

  fired_on_init_swapchain = true;
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
  shader_injection.custom_cg_count = 0.f;
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Yakuza 0";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);

      renodx::mods::shader::expected_constant_buffer_index = 11;
      renodx::mods::swapchain::expected_constant_buffer_index = 11;

      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;
      //renodx::mods::swapchain::swapchain_proxy_revert_state = true;

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float, 
          .use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
          //.ignore_size = true
      });
      
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
      });

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = 16.f / 9.f,
          .aspect_ratio_tolerance = 0.01f, // catches slightly mismatched 16:9 resolutions, like 5160x2902 (in-game 3440x1440 with 2x SSAA, the game still renders in 16:9 behind the scenes for whatever reason)
      });

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = 16.f / 9.f,
          .aspect_ratio_tolerance = 0.01f,
      });

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = 21.f / 9.f,
          .aspect_ratio_tolerance = 0.06f, // catches 3440x1440
      });

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_unorm,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = 21.f / 9.f,
          .aspect_ratio_tolerance = 0.06f,
      });

  	  // dof
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::b8g8r8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float, 
          .use_resource_view_cloning = true,
          .dimensions = {1024, 768}
      });

      //// bloom
      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::b8g8r8a8_typeless,
      //    .new_format = reshade::api::format::r16g16b16a16_float, 
      //    .use_resource_view_cloning = true,
      //    .dimensions = {1024, 512},
      //});
      //
      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::b8g8r8a8_typeless,
      //    .new_format = reshade::api::format::r16g16b16a16_typeless, 
      //    .use_resource_view_cloning = true,
      //    .dimensions = {512, 256}
      //});
//
      //renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      //    .old_format = reshade::api::format::b8g8r8a8_typeless,
      //    .new_format = reshade::api::format::r16g16b16a16_typeless, 
      //    .use_resource_view_cloning = true,
      //    .dimensions = {256, 128}
      //});

      reshade::register_event<reshade::addon_event::present>(OnPresent);
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}