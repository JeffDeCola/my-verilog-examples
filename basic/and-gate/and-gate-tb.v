`timescale 1ns / 1ns
`include "and-gate.v"

module and_gate_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg X, Y;
wire XY;

// UUT
and_gate uut(
    .x(X), .y(Y),
    .xy(XY)
);

// INIT VALUES
initial begin
    $dumpfile("and-gate-tb.vcd");
    $dumpvars(0, and_gate_tb);
end

// SIMULATION
initial begin
    $display("test start");

    #0  X = 0; Y = 0;
    #10 X = 1; Y = 0;
    #10 X = 0; Y = 1;
    #10 X = 1; Y = 1;
    #10
    
    $display("test complete");
    $finish;
end

endmodule
