`timescale 1ns / 1ns
`include "d-flip-flop.v"

module d_flip_flop_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  CLK, RST;
reg  D;
wire Q_1, Q_BAR_1, Q_2, Q_BAR_2, Q_3, Q_BAR_3;

// UUT
d_flip_flop uut(
    .clk(CLK), .rst(RST),
    .d(D),
    .q_1(Q_1), .q_bar_1(Q_BAR_1),
    .q_2(Q_2), .q_bar_2(Q_BAR_2),
    .q_3(Q_3), .q_bar_3(Q_BAR_3)
);

// FILES
initial begin
    $dumpfile("d-flip-flop-tb.vcd");
    $dumpvars(0, d_flip_flop_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    RST = 0;
    D = 0;
    
    #15; D = 1;
    #10; D = 0;
    #20; D = 1;
    #20; D = 0;
    #10; D = 1;
    #5;  D = 0;
    #5;  D = 1;

    // NOW LETS DO THE RESET
    #20; D = 1; RST = 1;
    #20; RST = 0;
    #20;

    $display("test complete");
    $finish;
end

endmodule