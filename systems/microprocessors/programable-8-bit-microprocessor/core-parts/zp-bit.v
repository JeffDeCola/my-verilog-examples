// 8-bit microprocessor zp_bit
// ZP status bit
// UPDATE FROM THESIS
//   Replaced nor2 & nand4 in THESIS with Jeff's nor2 & nand4

module zp_bit (
    input  [7:0]    F8,                 // 
    output          ZP_BAR              // 
);

wire [4:0] W;

// Replaced nor2 in THESIS with Jeff's nor2
nor2 U1 (
    .a(F8[0]),
    .b(F8[1]),
    .y(W[0])
);

nor2 U2 (
    .a(F8[2]),
    .b(F8[3]),
    .y(W[1])
);

nor2 U3 (
    .a(F8[4]),
    .b(F8[5]),
    .y(W[2])
);

nor2 U4 (
    .a(F8[6]),
    .b(F8[7]),
    .y(W[3])
);

// Replaced nand4 in THESIS with Jeff's nand4
nand4 U5 (
    .a(W[0]),
    .b(W[1]),
    .c(W[2]),
    .d(W[3]),
    .y(ZP_BAR)
);

endmodule