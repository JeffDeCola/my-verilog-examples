`include "programable_8_bit_microprocessor.v"
`include "control-store/control-store.v"

// CONTROL SECTION - IN ORDER WHEN FIRST USED
`include "control/control.v"
`include "core-parts/counter8.v"
`include "core-parts/ta161-bar.v"
// Replaced ta161 in Thesis with jeff_74x161
`include "../../../sequential-logic/counters/jeff-74x161/jeff-74x161.v"
`include "../../../sequential-logic/counters/jeff-74x161/sections/output-section.v"
`include "../../../basic-code/sequential-logic/jk-flip-flop/jk-flip-flop.v"
`include "core-parts/ta157-8.v"
// Replaced ta157_bar and ta157 in Thesis with jeff_74x157
`include "../../../combinational-logic/multiplexers-and-demultiplexers/jeff-74x157/jeff-74x157.v"
`include "opcode/opcodedec.v"
`include "core-parts/ta157-4.v"
// Replaced nand4 in Thesis with Jeff's nand4
`include "../../../basic-code/combinational-logic/nand4/nand4.v"
`include "core-parts/ta151-bar.v"
// Replaced ta151 in Thesis with jeff_74x151
`include "../../../combinational-logic/multiplexers-and-demultiplexers/jeff-74x151/jeff-74x151.v"
// Replaced xor2 in Thesis with Jeff's xor2
`include "../../../basic-code/combinational-logic/xor2/xor2.v"

// PROCESSOR SECTION - IN ORDER WHEN FIRST USED
`include "processor/processor.v"
`include "core-parts/register-ab8.v"
// Replaced or2 in Thesis with Jeff's or2
`include "../../../basic-code/combinational-logic/or2/or2.v"
`include "core-parts/ta377-bar.v"
// Replaced ta377 in Thesis with jeff_74x377
`include "../../../sequential-logic/registers/jeff-74x377/jeff-74x377.v"
`include "../../../basic-code/sequential-logic/d-flip-flop/d-flip-flop.v"
`include "alu/alu.v"
`include "core-parts/ta181-bar.v"
// Replaced ta181 in Thesis with jeff_74x181
`include "../../../combinational-logic/alus/jeff-74x181/jeff-74x181.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/input-section.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/invert-m.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/out-section-f3.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/out-section-f2.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/out-section-f1.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/out-section-f0.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/g-p-carry-section.v"
`include "../../../combinational-logic/alus/jeff-74x181/sections/aeqb-section.v"
// Replaced inv in Thesis with Jeff's not1
`include "../../../basic-code/combinational-logic/not1/not1.v"
// Replaced and2 in Thesis with Jeff's and2
`include "../../../basic-code/combinational-logic/and2/and2.v"
`include "core-parts/zp-bit.v"
// Replaced nor2 in Thesis with Jeff's nor2
`include "../../../basic-code/combinational-logic/nor2/nor2.v"
