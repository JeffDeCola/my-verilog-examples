`timescale 1ns / 1ns

// include files in mux-4x1-headerfiles.vh

module mux_4x1_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     A, B, C, D;
reg     [1:0] SEL;
wire    Y;
integer i;

// UUT
mux_4x1 uut(
    .a(A), .b(B), .c(C), .d(D),
    .sel(SEL),
    .y(Y)
);

// FILES
initial begin
    $dumpfile("mux-4x1-tb.vcd");
    $dumpvars(0, mux_4x1_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A = 0; B = 0; C = 0; D = 0;
    SEL = 2'b00;

    for (i = 0; i < 64; i = i + 1) begin
        {SEL, D, C, B, A} = i;
        #10;
    end
    
    $display("test complete");
    $finish;
end

endmodule
