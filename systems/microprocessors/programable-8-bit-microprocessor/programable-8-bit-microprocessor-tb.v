`timescale 1ns / 1ns
`include "programable-8-bit-microprocessor.v"
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

module programable_8_bit_microprocessor_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     [3:0]   OPCODE;
reg     [7:0]   DATA_IN_A;
reg     [7:0]   DATA_IN_B;
reg             GO_BAR;
reg             RESET;
reg             JAM;
reg             SYSTEM_CLK;
wire    [23:0]  MW;
wire    [7:0]   MICROADDRESS;
wire    [7:0]   DATA_OUT;

// UUT
programable_8_bit_microprocessor uut (
    .OPCODE(OPCODE),
    .DATA_IN_A(DATA_IN_A),
    .DATA_IN_B(DATA_IN_B),
    .GO_BAR(GO_BAR),
    .RESET(RESET),
    .JAM(JAM),
    .SYSTEM_CLK(SYSTEM_CLK),
    .MW(MW),
    .MICROADDRESS(MICROADDRESS),
    .DATA_OUT(DATA_OUT)
);

// CONTROL_STORE
control_store CS (
    .microaddress(MICROADDRESS),
    .microword(MW) 
);

// FILES
initial begin
    $dumpfile("programable-8-bit-microprocessor-tb.vcd");
    $dumpvars(0, programable_8_bit_microprocessor_tb);
end

// CLOCK
always begin
    #10 SYSTEM_CLK = ~SYSTEM_CLK;
end

// TESTCASE
initial begin
    $display("test start");
    OPCODE = 4'b0000;
    DATA_IN_A = 8'h00;
    DATA_IN_B = 8'h00;
    GO_BAR = 1;             // ACTIVE LOW
    RESET = 1;              // ACTIVE LOW
    JAM = 0;                // ACTIVE HIGH CAUSE MICROADDRESS TO BE 8'h11
    SYSTEM_CLK = 0;

    // RESET THE COUNTER - WILL SET MICROADDRESS TO 0
    #15; RESET = 0;
    #20; RESET = 1;
    #100;

    // ******************************************************
    // TEST 1 - ADD - 8'h31 PLUS 8'h05 = 8'h36 (49 + 5 = 54)
    OPCODE = 4'b0011;
    GO_BAR = 0;
    DATA_IN_A = 8'h31;
    DATA_IN_B = 8'h05;

    #100
    #20; GO_BAR = 1;
    #120;

    // ******************************************************
    // TEST 2 - SUBTRACT - 8'h31 MINUS 8'h05 = 8'h2C (49 - 5 = 44)
    OPCODE = 4'b0111;
    GO_BAR = 0;
    DATA_IN_A = 8'h31;
    DATA_IN_B = 8'h05;

    #100
    #20; GO_BAR = 1;
    #120;

    // ******************************************************
    // TEST 3 - MULTIPLY - 8'h31 x 8'h05 = 8'hF5 (49 x 5 = 245)
    OPCODE = 4'b1100;
    GO_BAR = 0;
    DATA_IN_A = 8'h31;
    DATA_IN_B = 8'h05;

    #500
    #20; GO_BAR = 1;
    #120;

    $display("test complete");
    $finish;
end

endmodule
