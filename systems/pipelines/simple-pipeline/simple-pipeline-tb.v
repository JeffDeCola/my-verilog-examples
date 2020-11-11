`timescale 1ns / 1ns
`include "simple-pipeline.v"

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
`include "../../../basic-code/sequential-logic/d-flip-flop/d-flip-flop.v"

module simple_pipeline_tb;

parameter N = 8;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  [N-1:0]    A, B, C, D;
reg             CLK;
wire [N-1:0]    F;

// UUT
simple_pipeline uut(
    .clk(CLK),
    .a (A),
    .b (B),
    .c (C),
    .d (D),
    .f (F)
);

// FILES
initial begin
    $dumpfile("simple-pipeline-tb.vcd");
    $dumpvars(0, simple_pipeline_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    A = 8'h00; B = 8'h00; C = 8'h00; D = 8'h00; 

    // F = ((A+B) + (C-D)) * D
    #15 A = 8'h01; B = 8'h02; C = 8'h05; D = 8'h04; // F = ((1+2) + (5-4)) * 4 = 16 (8'h10)
    #20 A = 8'h16; B = 8'h16; C = 8'h62; D = 8'h01; // F = ((22+22) + (98-1)) * 1 = 141 (8'h8D)
    #20 A = 8'h03; B = 8'h03; C = 8'h09; D = 8'h08; // F = ((3+3) + (9-8)) * 8 = 56 (8'h38) 
    #100

    $display("test complete");
    $finish;
end

endmodule
