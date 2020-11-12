`timescale 1ns / 1ns

// include files in decoder-3-8-headerfiles.vh

module decoder_3_8_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     [2:0] IN;
wire    [7:0] OUT;
integer i;

// UUT
decoder_3_8 uut(
    .in(IN),
    .out(OUT)
);

// FILES
initial begin
    $dumpfile("decoder-3-8-tb.vcd");
    $dumpvars(0, decoder_3_8_tb);
end

// TESTCASE
initial begin
    $display("test start");
    IN = 3'b000;

    for (i = 0; i < 8; i = i + 1) begin
        IN = i;
        #10;
    end
    
    $display("test complete");
    $finish;
end

endmodule
