// NOT gate used in my programable-8-bit-microprocessor

module not1 (
    input           a,             //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
assign y = ~a;

endmodule
