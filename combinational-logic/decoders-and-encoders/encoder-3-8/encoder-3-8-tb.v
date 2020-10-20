`timescale 1ns / 1ns
`include "encoder-3-8.v"

module encoder_3_8_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     Y;
reg     [1:0] SEL;
wire    A, B, C, D;
integer i;

// UUT
encoder_3_8 uut(
    .y(Y),
    .sel(SEL),
    .a(A), .b(B), .c(C), .d(D)
);

// FILES
initial begin
    $dumpfile("encoder-3-8-tb.vcd");
    $dumpvars(0, encoder_3_8_tb);
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
