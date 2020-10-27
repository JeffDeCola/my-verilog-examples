`timescale 1ns / 1ns
`include "jk-flip-flop.v"

module jk_flip_flop_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  CLK, CLR;
reg  J, K;
wire Q, Q_BAR;

// UUT
jk_flip_flop uut(
    .clk(CLK), .clr_bar(CLR),
    .j(J), .k(K),
    .q(Q), .q_bar(Q_BAR)
);

// FILES
initial begin
    $dumpfile("jk-flip-flop-tb.vcd");
    $dumpvars(0, jk_flip_flop_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    CLR = 1;
    J = 0; K = 0;
    
    // CLEAR
    #15; CLR = 0;
    #20; CLR = 1;

    #20; J = 0; K = 0;
    #20; J = 0; K = 1;
    #20; J = 1; K = 0;
    #20; J = 1; K = 1;

    // CLEAR
    #20; CLR = 0;
    #20; CLR = 1;
    #20;

    $display("test complete");
    $finish;
end

endmodule