`timescale 1ns / 1ns
`include "jeff-74x157.v"

module jeff_74x157_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg [3:0]  A, B;
reg        S;
reg        EN;
wire [3:0] Y;

// UUT
jeff_74x157 uut(
    .a(A),
    .b(B),
    .s(S),
    .en(EN),
    .y(Y)
);

// FILES
initial begin
    $dumpfile("jeff-74x157-tb.vcd");
    $dumpvars(0, jeff_74x157_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A = 4'h0; B = 4'h1;
    S = 0;
    EN = 0;

    #10; S = 0;
    #10;  A = 4'ha; B = 4'h5;
    #10; S = 1;
    #10;  A = 4'h3; B = 4'h7;
    #10; S = 0;
    #10;  A = 4'h2; B = 4'h8;
    #10; S = 1;
    #10;  A = 4'h9; B = 4'h4;
    #10

    EN = 1;
    #10;
    
    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
