// 4-input NAND gate used in my programable-8-bit-microprocessor

module nand4(
    input           a, b, c, d,    //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
assign y = ~(a & b & c & d);

endmodule
