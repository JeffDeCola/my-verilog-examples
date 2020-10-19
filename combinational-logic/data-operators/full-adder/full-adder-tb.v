`timescale 1ns / 1ns
`include "full-adder.v"

module full_adder_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     A, B, CIN;
wire    SUM, COUT;
integer i;

// UUT
full_adder uut(
    .a(A), .b(B), .cin(CIN),
    .sum(SUM), .cout(COUT)
);

// FILES
initial begin
    $dumpfile("full-adder-tb.vcd");
    $dumpvars(0, full_adder_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A = 0;
    B = 0;
    CIN = 0;

    for (i = 0; i < 8; i = i + 1) begin
        {A, B, CIN} = i;
        #10;
    end
    
    $display("test complete");
    $finish;
end

endmodule
