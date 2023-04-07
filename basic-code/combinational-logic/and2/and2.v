// 2-input AND gate used in my programable-8-bit-microprocessor

module and2(
    input       a, b,     // 2-Input
    output      y         // Output
);

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = a & b;

endmodule
