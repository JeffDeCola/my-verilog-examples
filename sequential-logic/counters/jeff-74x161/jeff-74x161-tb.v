`timescale 1ns / 1ns
`include "jeff-74x161.v"

module jeff_74x161_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLR_BAR, LD_BAR;
reg        ENT, ENP;
reg        CLK,
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
    CLR_BAR = 0; LD_BAR = 0;
    ENT = 0; ENP = 0;
    CLK = 0;
    A = 0; B =0; C = 0; D = 0;

    // LOAD
    #15; 

    $display("test complete");
    $finish;
end

endmodule
