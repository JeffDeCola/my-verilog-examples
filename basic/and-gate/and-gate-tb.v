`timescale 1ns / 1ns
`include "and-gate.v"

module and_gate_tb;

reg x, y;
wire xy;

and_gate uut(x, y, xy);

initial begin
    
    $dumpfile("and-gate-tb.vcd");
    $dumpvars(0, and_gate_tb);

    x = 0;
    y = 0;
    #20;

    x = 1;
    y = 0;
    #20;

    x = 0;
    y = 1;
    #20;

    x = 1;
    y = 1;
    #20;

    $display("test complete");

end

endmodule
