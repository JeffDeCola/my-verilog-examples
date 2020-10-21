// 8-bit microprocessor top
// The top level of the design

`include "control/control.v"
`include "processor/processor.v"

module programable_8_bit_microprocessor(
    input  [3:0]    OPCODE,             //
    input  [7:0]    DATA_IN_A,          // 
    input  [7:0]    DATA_IN_B,          // 
    input           GO_BAR,             // 
    input           RESET,              // 
    input           JAM,                // 
    input           SYSTEM_CLK,         // 
    input  [23:0]   MW,                 //
    output [7:0]    MICROADDRESS,       // 
    output [7:0]    DATA_OUT            // 
);


// WIRES
wire [3:0]     STATUS_BITS;
wire [23:13]   CONTROL_BITS;
wire           EIL_BAR;

// CONTROL_SECTION
control CONTROL_SECTION (
    .OPCODE(OPCODE),
    .GO_BAR(GO_BAR),
    .RESET(RESET),
    .JAM(JAM),
    .SYSTEM_CLK(SYSTEM_CLK),
    .STATUS_BITS(STATUS_BITS),
    .MW(MW),
    .MICROADDRESS(MICROADDRESS),
    .CONTROL_BITS(CONTROL_BITS),        // ORDER DIFFERENT FROM THESIS
    .EIL_BAR(EIL_BAR)
);

// PROCESSOR SECTION
processor PROCESSOR_SECTION (
    .DATA_IN_A(DATA_IN_A),
    .DATA_IN_B(DATA_IN_B),
    .SYSTEM_CLK(SYSTEM_CLK),
    .EIL_BAR(EIL_BAR),
    .CONTROL_BITS(CONTROL_BITS),
    .STATUS_BITS(STATUS_BITS),
    .DATA_OUT(DATA_OUT)
);

endmodule
