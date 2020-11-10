`timescale 1ns / 1ns
`include "simple-8-bit-register.v"

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
`include "../../../basic-code/sequential-logic/d-flip-flop/d-flip-flop.v"

module simple_8_bit_register_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  [7:0] DATA_IN;
reg        CLK;
reg        LD_BAR;
reg        CLR_BAR;
wire [7:0] DATA_OUT;

// UUT
simple_8_bit_register uut(
    .data_in (DATA_IN),
    .clk(CLK),
    .ld_bar(LD_BAR),
    .clr_bar(CLR_BAR),
    .data_out(DATA_OUT)
);

// FILES
initial begin
    $dumpfile("simple-8-bit-register-tb.vcd");
    $dumpvars(0, simple_8_bit_register_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    LD_BAR = 1;
    CLR_BAR = 1;
    DATA_IN = 8'h00;

    // CLEAR
    #15 CLR_BAR = 0;
    #20 CLR_BAR = 1;
    #40

    // LOAD IT UP
    #20; DATA_IN = 8'hF0;
    #20 LD_BAR = 0;
    #20 LD_BAR = 1;
    #40

    // CLEAR
    #20 CLR_BAR = 0;
    #20 CLR_BAR = 1;
    #40

    $display("test complete");
    $finish;
end

endmodule
