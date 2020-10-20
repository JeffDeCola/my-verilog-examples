`timescale 1ns / 1ns
`include "encoder-8-3.v"

module encoder_8_3_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  [7:0] IN;
wire [2:0] OUT;
integer i;

// UUT
encoder_8_3 uut(
    .in(IN), 
    .out(OUT)
);

// FILES
initial begin
    $dumpfile("encoder-8-3-tb.vcd");
    $dumpvars(0, encoder_8_3_tb);
end

// TESTCASE
initial begin
    $display("test start");
    IN = 8'b00000000;

    for (i = 0; i < 8; i = i + 1) begin
        IN = 8'b00000000;
        IN[i] = 1'b1;
        #10;
    end
    
    // WHAT IF YOU GET MORE THAN 1 HOT - should default to 0.
    IN = 8'b00101000;
    #10;

    $display("test complete");
    $finish;
end

endmodule
