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

assign MICROADDRESS = 8'h01;
assign CONTROL_BITS = 11'b00000000000;
assign EIL_BAR = 1'b0;

// wire [3:0]      STATUS_BITS;

// MUX8 SECTION
control CONTROL_SECTION (
    .OPCODE(OPCODE),
    .GO_BAR(GO_BAR),
    .RESET(RESET),
    .JAM(JAM),
    .SYSTEM_CLK(SYSTEM_CLK),
    .STATUS_BITS(STATUS_BITS),
    .MW(MW),
    .MICROADDRESS(MICROADDRESS),
    .CONTROL_BITS(CONTROL_BITS),
    .EIL_BAR(EIL_BAR)
);

// OPCODEDEC SECTION

// COUNTER8 SECTION

// COND_SELECT SECTION

// XOR2 SECTION

endmodule