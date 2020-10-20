`timescale 1ns / 1ns
`include "pattern-recognition.v"

module pattern_recognition_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLK, RST;
reg        IN;
wire       FOUND;
integer    i;

// UUT
pattern_recognition uut(
    .clk(CLK), .rst(RST),
    .in(IN),
    .found(FOUND)
);

// FILES
initial begin
    $dumpfile("pattern-recognition-tb.vcd");
    $dumpvars(0, pattern_recognition_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    RST = 0;
    IN = 0;

    #15; RST = 1;
    #20; RST = 0;

    #20; IN = 1;
    #20; IN = 0;
    #20; IN = 0;
    #20; IN = 0;
    #20; IN = 0;
    #20; IN = 1;
    #20; IN = 0;
    #20; IN = 1;
    #20; IN = 1;
    #20; IN = 0;
    #20; IN = 0; // FOUND
    #20; IN = 1;
    #20; IN = 1;
    #20; IN = 0;
    #20; IN = 0; // FOUND
    #20; IN = 1;
    #20; IN = 0;
    
    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
