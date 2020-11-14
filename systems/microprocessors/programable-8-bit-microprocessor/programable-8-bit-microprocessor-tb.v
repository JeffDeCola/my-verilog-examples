`timescale 1ns / 1ns

// include files in programable-8-bit-microprocessor-headerfiles.vh

module programable_8_bit_microprocessor_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg     [3:0]   OPCODE;
reg     [7:0]   DATA_IN_A;
reg     [7:0]   DATA_IN_B;
reg             GO_BAR;
reg             RESET;
reg             JAM;
reg             SYSTEM_CLK;
wire    [23:0]  MW;
wire    [7:0]   MICROADDRESS;
wire    [7:0]   DATA_OUT;

// UUT
programable_8_bit_microprocessor uut (
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

// CONTROL_STORE
control_store CS (
    .microaddress(MICROADDRESS),
    .microword(MW) 
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
    OPCODE = 4'b0000;
    DATA_IN_A = 8'h00;
    DATA_IN_B = 8'h00;
    GO_BAR = 1;             // ACTIVE LOW
    RESET = 1;              // ACTIVE LOW
    JAM = 0;                // ACTIVE HIGH CAUSE MICROADDRESS TO BE 8'h11
    SYSTEM_CLK = 0;

    // RESET THE COUNTER - WILL SET MICROADDRESS TO 0
    #15; RESET = 0;
    #20; RESET = 1;
    #100;
    
    // ******************************************************
    // TEST 1 - ADD - 8'h31 PLUS 8'h05 = 8'h36 (49 + 5 = 54)
    OPCODE = 4'b0011;
    GO_BAR = 0;
    DATA_IN_A = 8'h31;
    DATA_IN_B = 8'h05;

    #100
    #20; GO_BAR = 1;
    #120;

    // ******************************************************
    // TEST 2 - SUBTRACT - 8'h31 MINUS 8'h05 = 8'h2C (49 - 5 = 44)
    OPCODE = 4'b0111;
    GO_BAR = 0;
    DATA_IN_A = 8'h31;
    DATA_IN_B = 8'h05;

    #100
    #20; GO_BAR = 1;
    #120;

    // ******************************************************
    // TEST 3 - MULTIPLY - 8'h31 x 8'h05 = 8'hF5 (49 x 5 = 245)
    OPCODE = 4'b1100;
    GO_BAR = 0;
    DATA_IN_A = 8'h31;
    DATA_IN_B = 8'h05;

    #500
    #20; GO_BAR = 1;
    #120;

    // ******************************************************
    // TEST 4 - DIVIDE - 8'h50 / 8'h0D = 8'h06 with remainder 8'h02 (49 / 13 = 6 with 2 remainder)
    // THE OUTPUT WILL BE 8'b00010 110 or 8'h16
    OPCODE = 4'b1110;
    GO_BAR = 0;
    DATA_IN_A = 8'h50;      // DIVIDEND (MUST BE LOWER THAN DIVISOR)
    DATA_IN_B = 8'h68;      // DIVISOR (MUST ADD 3 LEADING ZEROS) 1101 becomes 1101000

    #300
    #20; GO_BAR = 1;
    #120;

    /*
    // ******************************************************
    // TEST 5 - DIVIDE - 8'h2D / 8'h0B = 8'h0B with remainder 8'b01 (45 / 11 = 4 with 1 remainder)
    // THE OUTPUT WILL BE 8'b00001 100 or 8'h0C
    OPCODE = 4'b1110;
    GO_BAR = 0;
    DATA_IN_A = 8'h2D;      // DIVIDEND (MUST BE LOWER THAN DIVISOR)
    DATA_IN_B = 8'h58;      // DIVISOR (MUST ADD 3 LEADING ZEROS) 1011 becomes 01011000

    #300
    #20; GO_BAR = 1;
    #120;

    // ******************************************************
    // TEST 6 - DIVIDE - 8'h4E / 8'h0F = 8'h05 with remainder 8'b03 (78 / 15 = 5 with 3 remainder)
    // THE OUTPUT WILL BE 8'b00011 101 or 8'h1D
    OPCODE = 4'b1110;
    GO_BAR = 0;
    DATA_IN_A = 8'h4E;      // DIVIDEND (MUST BE LOWER THAN DIVISOR)
    DATA_IN_B = 8'h78;      // DIVISOR (MUST ADD 3 LEADING ZEROS) 1111 becomes 01111000

    #300
    #20; GO_BAR = 1;
    #120;
    */

    $display("test complete");
    $finish;
end

endmodule
