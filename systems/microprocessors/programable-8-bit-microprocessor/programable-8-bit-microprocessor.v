// 8-bit microprocessor top
// The top level of the design

// CONTROL SECTION - IN ORDER WHEN FIRST USED
`include "control/control.v"
`include "core-parts/counter8.v"
`include "core-parts/ta161-bar.v"
// Replaced ta161 in Thesis with jeff_74x161
`include "../../../sequential-logic/counters/jeff-74x161/jeff-74x161.v"     
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
`include "alu/alu.v"
`include "core-parts/ta181-bar.v"
// Replaced ta181 in Thesis with jeff_74x181
`include "../../../combinational-logic/alus/jeff-74x181/jeff-74x181.v"  
// Replaced and2 in Thesis with Jeff's and2
`include "../../../basic-code/combinational-logic/and2/and2.v"
`include "core-parts/zp-bit.v"
// Replaced nor2 in Thesis with Jeff's nor2
`include "../../../basic-code/combinational-logic/nor2/nor2.v"

module programable_8_bit_microprocessor (
    input  [3:0]    OPCODE,             //
    input  [7:0]    DATA_IN_A,          // 
    input  [7:0]    DATA_IN_B,          // 
    input           GO_BAR,             // 
    input           RESET,              // 
    input           JAM,                // 
    input           SYSTEM_CLK,         // 
    input  [23:0]   MW,                 //
    output [7:0]    MICROADDRESS,       // 
    output [7:0]    DATA_OUT            // 
);


// WIRES
wire [3:0]     STATUS_BITS;
wire [23:13]   CONTROL_BITS;
wire           EIL_BAR;

// CONTROL_SECTION
control CONTROL_SECTION (
    .OPCODE(OPCODE),
    .GO_BAR(GO_BAR),
    .RESET(RESET),
    .JAM(JAM),
    .SYSTEM_CLK(SYSTEM_CLK),
    .STATUS_BITS(STATUS_BITS),
    .MW(MW),
    .MICROADDRESS(MICROADDRESS),
    .CONTROL_BITS(CONTROL_BITS),        // ORDER DIFFERENT FROM THESIS
    .EIL_BAR(EIL_BAR)
);

// PROCESSOR SECTION
processor PROCESSOR_SECTION (
    .DATA_IN_A(DATA_IN_A),
    .DATA_IN_B(DATA_IN_B),
    .SYSTEM_CLK(SYSTEM_CLK),
    .EIL_BAR(EIL_BAR),
    .CONTROL_BITS(CONTROL_BITS),
    .STATUS_BITS(STATUS_BITS),
    .DATA_OUT(DATA_OUT)
);

endmodule
