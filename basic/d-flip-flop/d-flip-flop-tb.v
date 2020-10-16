`timescale 1ns / 1ns
`include "d-flip-flop.v"

module d_flip_flop_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg D, CLK;
wire Q, Q_BAR;

// UUT
d_flip_flop uut(.d(D), .clk(CLK), .q(Q), .q_bar(Q_BARr));

// INIT VALUES
initial begin
    $dumpfile("d-flip-flop-tb.vcd");
    $dumpvars(0, d_flip_flop_tb);
end

// CLOCK
initial begin
    CLK = 0;
    forever #10 CLK = ~CLK;
end

// SIMULATION
initial begin
    $display("test start");

    D = 0;

    #15;
    D = 1;
    
    #10;
    D = 0;
 
    #20;
    D = 1;

    #20;
    D = 0;

    #10
    D = 1;

    #5
    D = 0;
    #5
    D = 1;

    #20
    D=0;

    $display("test complete");
    $finish;
end

endmodule