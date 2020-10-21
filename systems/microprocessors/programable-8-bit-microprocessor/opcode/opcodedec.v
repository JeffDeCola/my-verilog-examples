// 8-bit microprocessor opcodedec
// Opcode decoding

module opcodedec(
    input  [3:0]    OPCODE,             // 
    input  [7:4]    MW_AD_HIGH,         // 
    input  [12:9]   MW_BOP,             //
    output [7:4]    TO_COUNTER,         //
    output          EIL_BAR             //
);

assign TO_COUNTER = 4'h3;         // ERASE
assign EIL_BAR = 1'b1;             // ERASE

endmodule