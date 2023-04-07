// NOT gate used in my programable-8-bit-microprocessor

module not1 (
    input       a,      // Input
    output      y       // Onput
);

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = ~a;

endmodule
