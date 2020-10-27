`timescale 1ns / 1ns
`include "jeff-74x161.v"

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
`include "sections/output-section.v"
`include "../../../basic-code/sequential-logic/jk-flip-flop/jk-flip-flop.v"

module jeff_74x161_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLR_BAR, LD_BAR;
reg        ENT, ENP;
reg        CLK;
reg        A, B, C, D;
wire       QA, QB, QC, QD;
wire       RCO;

// UUT
jeff_74x161 uut(
    .clr_bar(CLR_BAR), .ld_bar(LD_BAR),
    .ent(ENT), .enp(ENP),
    .clk(CLK),
    .a(A), .b(B), .c(C), .d(D),
    .qa(QA), .qb(QB), .qc(QC), .qd(QD),
    .rco(RCO)
);

// FILES
initial begin
    $dumpfile("jeff-74x161-tb.vcd");
    $dumpvars(0, jeff_74x161_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLR_BAR = 1; LD_BAR = 1;
    ENT = 0; ENP = 0;
    CLK = 0;
    D = 0; C = 0; B = 0; A = 0;

    // ASYNC CLEAR
    #15; CLR_BAR = 0;

    // LOAD - PRESET TO 12
    #20; CLR_BAR = 1; LD_BAR = 0;
         D = 1; C = 1; B = 0; A = 0;
    #20 LD_BAR = 1;

    // WAIT
    #100

    // COUNT - 13,14,15,0,1,2,3,4....
    ENT = 1; ENP = 1;
    #200

    // INHIBIT
    ENT = 0; ENP = 0;
    #100

    $display("test complete");
    $finish;
end

endmodule
