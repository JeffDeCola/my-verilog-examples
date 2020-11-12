`timescale 1ns / 1ns

// include files in left-shift-register-headerfiles.vh

module left_shift_register_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLK, RST;
reg        D;
wire [3:0] OUT;
integer    i;
integer    seed=1;

// UUT
left_shift_register uut(
    .clk(CLK), .rst(RST),
    .d(D),
    .out(OUT)
);

// FILES
initial begin
    $dumpfile("left-shift-register-tb.vcd");
    $dumpvars(0, left_shift_register_tb);
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
    D = 0;

    // RESET
    #15
    RST = 1;
    #20
    RST = 0;
    #20

    // PUMP IN RANDOM NUMBERS
    for (i = 0; i < 30; i = i + 1) begin
        @ (posedge CLK) begin
            D <= $random(seed);
        end
    end
    
    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
