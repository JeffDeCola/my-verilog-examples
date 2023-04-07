`timescale 1ns / 1ns

// include files in decoder-to-encoder-headerfiles.vh

module decoder_to_encoder_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  [2:0] IN;
wire [2:0] OUT;
integer i;

// UUT
decoder_to_encoder uut(
    .in(IN),
    .out(OUT)
);

// FILES
initial begin
    $dumpfile("decoder-to-encoder-tb.vcd");
    $dumpvars(0, decoder_to_encoder_tb);
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
