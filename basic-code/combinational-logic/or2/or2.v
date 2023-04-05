// 2-input OR gate used in my programable-8-bit-microprocessor

module or2(
    input           a, b,          //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
assign y = a | b;

endmodule
