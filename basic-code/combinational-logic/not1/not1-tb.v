`timescale 1ns / 1ns

// include files in not1-headerfiles.vh

module not1_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        A;
wire       Y;

// UUT
not1 uut(
    .a(A),
    .y(Y)
);

// FILES
initial begin
    $dumpfile("not1-tb.vcd");
    $dumpvars(0, not1_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A = 0;

    #15; A = 0;
    #20; A = 1;
    #20; A = 0;
    #20; A = 1;

    #20; A = 0;

    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
