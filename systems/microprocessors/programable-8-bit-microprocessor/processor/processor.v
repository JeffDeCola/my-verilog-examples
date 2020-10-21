// 8-bit microprocessor processor section
// Processor section structural view

`include "core-parts/register_ab8.v"

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

// WIRES
wire [7:0]      DATA_OUT_A;
wire [7:0]      DATA_OUT_B;
wire [7:0]      DATA_OUT_TA;
wire [7:0]      DATA_OUT_TB;
wire [7:0]      ALU_IN_A;
wire [7:0]      ALU_IN_B;
wire [7:0]      ALU_OUT;
wire            A_SOURCE;
wire            B_SOURCE;
wire [19:15]    ALU_FUNC;
wire            CIN;
wire [23:21]    ALU_DEST;
wire [7:0]      IN_ZP;
wire            LOW;

// BREAK UP THE CONTROL_BITS INTO FIELDS
assign A_SOURCE     = CONTROL_BITS[13];
assign B_SOURCE     = CONTROL_BITS[14];
assign ALU_FUNC     = CONTROL_BITS[19:15];
assign CIN          = CONTROL_BITS[20];
assign ALU_DEST     = CONTROL_BITS[23:21];

// ASSIGN VALUES
assign LOW              = 1'b0;

// REGISTER_A SECTION
register_ab8 REGISTER_A (                   // NAMED REGISTERA IN THESIS    
    .DATA_IN(DATA_IN_A),
    .SYSTEM_CLK(SYSTEM_CLK),
    .ENABLE_CLK(EIL_BAR),
    .DATA_OUT(DATA_OUT_A)
);

// REGISTER_B SECTION

// MUX_A SECTION

// MUX_B SECTION

// TEMP_REGISTER_A SECTION

// TEMP_REGISTER_B SECTION

// ALU SECTION

// REGISTER_F SECTION

// ZP_BIT SECTION

endmodule
