// 2-input XOR gate
module xor2(
    input           a, b,          //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
assign y = ~(a | b);

endmodule
