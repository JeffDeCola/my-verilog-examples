`timescale 1ns / 1ns

// include files in xor2-headerfiles.vh

module xor2_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        A, B;
wire       Y;

// UUT
xor2 uut(
    .a(A), .b(B),
    .y(Y)
);

// FILES
initial begin
    $dumpfile("xor2-tb.vcd");
    $dumpvars(0, xor2_tb);
end

// TESTCASE
initial begin
    $display("test start");
    B = 0; A = 0;

    #15; B = 0; A = 0;
    #20; B = 0; A = 1;
    #20; B = 1; A = 0;
    #20; B = 1; A = 1;

    #20; B = 0; A = 0;

    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
