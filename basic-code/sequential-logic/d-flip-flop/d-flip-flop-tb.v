`timescale 1ns / 1ns

// include files in d-flip-flop-headerfiles.vh

module d_flip_flop_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  CLK;
reg  EN;
reg  D;
wire Q, Q_BAR;

// UUT
d_flip_flop uut(
    .clk(CLK),
    .en(EN),
    .d(D),
    .q(Q), .q_bar(Q_BAR)
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
    EN = 0;
    D = 0;
    
    // ENABLE
    #15; EN = 1;
    #20  D = 1;
    #20; D = 0;
    #20; D = 1;
    #20; D = 0;
    #10; D = 0;

    // STOP ENABLE - KEEPS STATE REGARDLESS OF INPUT
    #20; EN = 0;
    #10  D = 1;
    #20; D = 0;
    #10; D = 1;
    #20

    $display("test complete");
    $finish;
end

endmodule