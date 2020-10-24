// 4-input NAND gate
module nand4(
    input           a, b, c, d,     //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
assign y = ~(a & b & c & d);

endmodule
