// 2-input XOR gate used in my programable-8-bit-microprocessor

module xor2(
    input           a, b,          //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
assign y = a ^ b;

endmodule
