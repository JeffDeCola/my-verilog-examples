`timescale 1ns / 1ns

// include files in half-adder-headerfiles.vh

module half_adder_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     A, B;
wire    SUM, COUT;
integer i;

// UUT
half_adder uut(
    .a(A), .b(B),
    .sum(SUM), .cout(COUT)
);

// FILES
initial begin
    $dumpfile("half-adder-tb.vcd");
    $dumpvars(0, half_adder_tb);
end

// TESTCASE
initial begin
    $display("test start");
    A = 0;
    B = 0;

    for (i = 0; i < 4; i = i + 1) begin
        {A, B} = i;
        #10;
    end
    
    $display("test complete");
    $finish;
end

endmodule
