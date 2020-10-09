`timescale 1ns / 1ns
`include "and-gate.v"

module and_gate_tb;

reg A, B;
wire Y;

and_gate uut(A, B, Y);

initial begin
    
    $dumpfile("and-gate-tb.vcd");
    $dumpvars(0, and_gate_tb);

    A = 0;
    B = 0;
    #20;

    A = 1;
    B = 0;
    #20;

    A = 0;
    B = 1;
    #20;

    A = 1;
    B = 1;
    #20;

    $display("test complete");

end

endmodule
