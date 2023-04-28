// 2-input OR gate used in my programable-8-bit-microprocessor

module or2_gate(
    input       a, b,     // 2-Input
    output      y);       // Output

    // GATE PRIMITIVE
    or (y, a, b);

endmodule

module or2_dataflow(
    input       a, b,     // 2-Input
    output      y);       // Output

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = a | b;

endmodule

module or2_behavioral(
    input       a, b,     // 2-Input
    output reg  y);       // Output

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(a or b) begin
        y <= a | b;
    end

endmodule

