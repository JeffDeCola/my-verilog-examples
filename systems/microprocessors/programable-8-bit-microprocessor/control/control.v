// 8-bit microprocessor control section
// `include "../conrol/control.v"

module control(
    input  [3:0]    OPCODE,             //
    input           GO_BAR,             // 
    input           RESET,              // 
    input           JAM,                // 
    input           SYSTEM_CLK,         //
    input  [3:0]    STATUS_BITS,        // 
    input  [23:0]   MW,                 //
    output [7:0]    MICROADDRESS,       //
    output [23:13]  CONTROL_BITS,       //
    output          EIL_BAR             // 
);

assign MICROADDRESS = 8'h00;
assign CONTROL_BITS = 11'b00000000000;
assign EIL_BAR = 1'b0;

// wire [3:0]      STATUS_BITS;

// MUX8 SECTION

// OPCODEDEC SECTION

// COUNTER8 SECTION

// COND_SELECT SECTION

// XOR2

endmodule