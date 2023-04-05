`timescale 1ns / 1ns

// include files in and-gate-headerfiles.vh

module and_gate_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  A, B;
wire Y_1, Y_2, Y_3, Y_4;

// UUT
and_gate uut(
    .a(A), .b(B),
    .y_1(Y_1), .y_2(Y_2), .y_3(Y_3), .y_4(Y_4)
);

// FILES
initial begin
    $dumpfile("and-gate-tb.vcd");
    $dumpvars(0, and_gate_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A = 0; B = 0;
    
    #10 A = 1; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 1;
    #10
    
    $display("test complete");
    $finish;
end

endmodule
