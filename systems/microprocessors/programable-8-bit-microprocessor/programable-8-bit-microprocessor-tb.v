`timescale 1ns / 1ns
`include "programable-8-bit-microprocessor.v"

module programable_8_bit_microprocessor_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     [3:0]   OPCODE;
reg     [7:0]   DATA_IN_A;
reg     [7:0]   DATA_IN_B;
reg             GO_BAR;
reg             RESET;
reg             JAM;
reg             SYSTEM_CLK;
reg     [23:0]  MW;
wire    [7:0]   MICROADDRESS;
wire    [7:0]   DATA_OUT;

// UUT
programable_8_bit_microprocessor uut(
    .OPCODE(OPCODE),
    .DATA_IN_A(DATA_IN_A),
    .DATA_IN_B(DATA_IN_B),
    .GO_BAR(GO_BAR),
    .RESET(RESET),
    .JAM(JAM),
    .SYSTEM_CLK(SYSTEM_CLK),
    .MW(MW),
    .MICROADDRESS(MICROADDRESS),
    .DATA_OUT(DATA_OUT)
);

// FILES
initial begin
    $dumpfile("programable-8-bit-microprocessor-tb.vcd");
    $dumpvars(0, programable_8_bit_microprocessor_tb);
end

// CLOCK
always begin
    #10 SYSTEM_CLK = ~SYSTEM_CLK;
end

// TESTCASE
initial begin
    $display("test start");
    OPCODE = 4'h0;
    DATA_IN_A = 8'h00;
    DATA_IN_B = 8'h00;
    GO_BAR = 0;
    RESET = 0;
    JAM = 0;
    SYSTEM_CLK = 0;
    MW = 23'b00000000000000000000000;

    // RESET
    #15; RESET = 1;
    #20; RESET = 0;

    #200; 
    
    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule