`timescale 1ns / 1ns
`include "demux-1x4.v"

module demux_1x4_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     Y;
reg     [1:0] SEL;
wire    A, B, C, D;
integer i;

// UUT
demux_1x4 uut(
    .y(Y),
    .sel(SEL),
    .a(A), .b(B), .c(C), .d(D)
);

// FILES
initial begin
    $dumpfile("demux-1x4-tb.vcd");
    $dumpvars(0, demux_1x4_tb);
end

// TESTCASE
initial begin
    $display("test start");
    Y = 0;
    SEL = 2'b00;

    for (i = 0; i < 8; i = i + 1) begin
        {SEL, Y} = i;
        #10;
    end
    
    $display("test complete");
    $finish;
end

endmodule
