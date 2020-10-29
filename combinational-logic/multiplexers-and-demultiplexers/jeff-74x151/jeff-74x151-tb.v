`timescale 1ns / 1ns
`include "jeff-74x151.v"

module jeff_74x151_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        D0, D1, D2, D3, D4, D5, D6, D7;
reg        A, B, C;
reg        EN;
wire       Y, W;

// UUT
jeff_74x151 uut(
    .d0(D0), .d1(D1), .d2(D2), .d3(D3), .d4(D4), .d5(D5), .d6(D6), .d7(D7),
    .a(A), .b(B), .c(C),
    .en(EN),
    .y(Y), .w(W)
);

// FILES
initial begin
    $dumpfile("jeff-74x151-tb.vcd");
    $dumpvars(0, jeff_74x151_tb);
end

// TESTCASE
initial begin
    $display("test start");
    D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    C = 0; B = 0; A = 0;
    EN = 1;

    #10; C = 0; B = 0; A = 0;
    #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 1;
    #10; C = 0; B = 0; A = 1;
    #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 1; D0 = 0;
    #10; C = 0; B = 1; A = 0;
    #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 1; D1 = 0; D0 = 0;
    #10; C = 0; B = 1; A = 1;
    #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 1; D2 = 0; D1 = 0; D0 = 0;
    #10; C = 1; B = 0; A = 0;
    #10; D7 = 0; D6 = 0; D5 = 0; D4 = 1; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10; C = 1; B = 0; A = 1;
    #10; D7 = 0; D6 = 0; D5 = 1; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10; C = 1; B = 1; A = 0;
    #10; D7 = 0; D6 = 1; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10; C = 1; B = 1; A = 1;
    #10; D7 = 1; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10

    EN = 0;
    #10

    $display("test complete");
    $finish;
end

endmodule
