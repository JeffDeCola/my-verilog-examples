`timescale 1ns / 1ns

// include files in mux-to-demux-headerfiles.vh

module mux_to_demux_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     A_IN, B_IN, C_IN, D_IN;
reg     [1:0] SEL;
wire    A_OUT, B_OUT, C_OUT, D_OUT;
integer i;

// UUT
mux_to_demux uut(
    .a_in(A_IN), .b_in(B_IN), .c_in(C_IN), .d_in(D_IN),
    .sel(SEL),
    .a_out(A_OUT), .b_out(B_OUT), .c_out(C_OUT), .d_out(D_OUT)
);

// FILES
initial begin
    $dumpfile("mux-to-demux-tb.vcd");
    $dumpvars(0, mux_to_demux_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A_IN = 0; B_IN = 0; C_IN = 0; D_IN = 0;
    SEL = 2'b00;

    for (i = 0; i < 64; i = i + 1) begin
        {SEL, D_IN, C_IN, B_IN, A_IN} = i;
        #10;
    end
    
    $display("test complete");
    $finish;
end

endmodule
