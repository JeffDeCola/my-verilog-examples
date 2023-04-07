`timescale 1ns / 1ns

// include files in nand4-headerfiles.vh

module nand4_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        A, B, C, D;
wire       Y;

// UUT
nand4 uut(
    .a(A), .b(B), .c(C), .d(D),
    .y(Y)
);

// FILES
initial begin
    $dumpfile("nand4-tb.vcd");
    $dumpvars(0, nand4_tb);
end

// TESTCASE
initial begin
    $display("test start");
    D = 0; C = 0; B = 0; A = 0;

    #15; D = 0; C = 0; B = 0; A = 0;
    #20; D = 0; C = 0; B = 0; A = 1;
    #20; D = 0; C = 0; B = 1; A = 0;
    #20; D = 0; C = 0; B = 1; A = 1;
    #20; D = 0; C = 1; B = 0; A = 0;
    #20; D = 0; C = 1; B = 0; A = 1;
    #20; D = 0; C = 1; B = 1; A = 0;
    #20; D = 0; C = 1; B = 1; A = 1;
    #20; D = 1; C = 0; B = 0; A = 0;
    #20; D = 1; C = 0; B = 0; A = 1;
    #20; D = 1; C = 0; B = 1; A = 0;
    #20; D = 1; C = 0; B = 1; A = 1;
    #20; D = 1; C = 1; B = 0; A = 0;
    #20; D = 1; C = 1; B = 0; A = 1;
    #20; D = 1; C = 1; B = 1; A = 0;
    #20; D = 1; C = 1; B = 1; A = 1;

    #20; D = 0; C = 0; B = 0; A = 0;

    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
