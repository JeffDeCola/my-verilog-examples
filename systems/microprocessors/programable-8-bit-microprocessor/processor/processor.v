// 8-bit microprocessor processor section
// `include "../conrol/control.v"

module processor(
    input  [7:0]    DATA_IN_A,          // 
    input  [7:0]    DATA_IN_B,          // 
    input           SYSTEM_CLK,         //
    input           EIL_BAR,            //
    input  [23:13]  CONTROL_BITS,       //
    output [3:0]    STATUS_BITS,        // 
    output [7:0]    DATA_OUT            // 
);

assign STATUS_BITS = 4'h0;          // ERASE
assign DATA_OUT = 8'h10;            // ERASE

// wire [3:0]      STATUS_BITS;

// REGISTER_A SECTION

// REGISTER_B SECTION

// MUX_A SECTION

// MUX_B SECTION

// TEMP_REGISTER_A SECTION

// TEMP_REGISTER_B SECTION

// ALU SECTION

// REGISTER_F SECTION

// ZP_BIT SECTION

endmodule
