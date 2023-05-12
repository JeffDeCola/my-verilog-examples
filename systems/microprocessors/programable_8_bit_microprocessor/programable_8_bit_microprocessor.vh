`include "programable_8_bit_microprocessor.v"
`include "control-store/control_store.v"

//**************************************************************************
// CONTROL SECTION - IN ORDER WHEN FIRST USED
//**************************************************************************
`include "control/control.v"
`include "core-parts/counter8.v"
`include "core-parts/ta161_bar.v"
// Replaced ta161 in Thesis with jeff_74x161
`include "../../../sequential-logic/counters/jeff_74x161/jeff_74x161.v"
`include "../../../sequential-logic/counters/jeff_74x161/sections/output_section.v"
`include "../../../basic-code/sequential-logic/jk_flip_flop_pos_edge_sync_clear/jk_flip_flop_pos_edge_sync_clear.v"
`include "core-parts/ta157_8.v"
// Replaced ta157_bar and ta157 in Thesis with jeff_74x157
`include "../../../combinational-logic/multiplexers-and-demultiplexers/jeff_74x157/jeff_74x157.v"
`include "opcode/opcodedec.v"
`include "core-parts/ta157_4.v"
// Replaced nand4 in Thesis with Jeff's nand4
`include "../../../basic-code/combinational-logic/nand4/nand4.v"
`include "core-parts/ta151_bar.v"
// Replaced ta151 in Thesis with jeff_74x151
`include "../../../combinational-logic/multiplexers-and-demultiplexers/jeff_74x151/jeff_74x151.v"
// Replaced xor2 in Thesis with Jeff's xor2
`include "../../../basic-code/combinational-logic/xor2/xor2.v"

//**************************************************************************
// PROCESSOR SECTION - IN ORDER WHEN FIRST USED
//**************************************************************************
`include "processor/processor.v"
`include "core-parts/register_ab8.v"
// Replaced or2 in Thesis with Jeff's or2
`include "../../../basic-code/combinational-logic/or2/or2.v"
`include "core-parts/ta377_bar.v"
// Replaced ta377 in Thesis with jeff_74x377
`include "../../../sequential-logic/registers/jeff_74x377/jeff_74x377.v"
`include "../../../basic-code/sequential-logic/d_flip_flop_pos_edge_sync_en/d_flip_flop_pos_edge_sync_en.v"
`include "alu/alu.v"
`include "core-parts/ta181_bar.v"
// Replaced ta181 in Thesis with jeff_74x181
`include "../../../combinational-logic/alus/jeff_74x181/jeff_74x181.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/input_section.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/invert_m.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/out_section_f3.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/out_section_f2.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/out_section_f1.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/out_section_f0.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/g_p_carry_section.v"
`include "../../../combinational-logic/alus/jeff_74x181/sections/aeqb_section.v"
// Replaced inv in Thesis with Jeff's not1
`include "../../../basic-code/combinational-logic/not1/not1.v"
// Replaced and2 in Thesis with Jeff's and2
`include "../../../basic-code/combinational-logic/and2/and2.v"
`include "core-parts/zp_bit.v"
// Replaced nor2 in Thesis with Jeff's nor2
`include "../../../basic-code/combinational-logic/nor2/nor2.v"
