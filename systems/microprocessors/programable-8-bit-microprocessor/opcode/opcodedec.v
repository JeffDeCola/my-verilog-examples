// 8-bit microprocessor opcodedec
// Opcode decoding

module opcodedec (
    input  [3:0]    OPCODE,             // 
    input  [7:4]    MW_AD_HIGH,         // 
    input  [12:9]   MW_BOP,             //
    output [7:4]    TO_COUNTER,         //
    output          EIL_BAR             //
);

assign TO_COUNTER = 4'h3;         // ERASE
assign EIL_BAR = 1'b1;             // ERASE

// WIRES
wire          W1;

// ASSIGN VALUES
assign LOW              = 1'b0;

// Four (2x1) multiplexers
ta157_4 U1 (
    .A4(OPCODE),
    .B4(MW_AD_HIGH),
    .S(W1),
    .EN_BAR(LOW),
    .Y4(TO_COUNTER)
);

// FOUR INPUT NAND GATE
nand4 U2 (
    .A(MW_BOP[9]),
    .B(MW_BOP[10]),
    .C(MW_BOP[11]),
    .D(MW_BOP[12]),
    .Y(W1)
);

endmodule