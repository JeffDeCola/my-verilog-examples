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

// WIRES
wire [3:0]      MICRO_AD_LOW;
wire [7:4]      MICRO_AD_HIGH;
wire            COUNT;
wire [12:9]     BOP;
wire [3:0]      CONTROL_BITS;

// BREAK UP THE MICROWORD
assign MICRO_AD_LOW   = [3:0]MW
assign MICRO_AD_HIGH  = [7:4]MW
assign COUNT          = [8]MW
assign BOP            = [12:9]MW
assign CONTROL_BITS   = [23:13]MW

// COUNTER8 SECTION
counter8 COUNTER_8 (
    .TBD(TBD)
);

// MUX8 SECTION
 MUX8 (
);

// OPCODEDEC SECTION

// COND_SELECT SECTION

// XOR2 SECTION

endmodule