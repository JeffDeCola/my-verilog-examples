// A few different ways to model an AND gate

module and_gates(
    input       a,        // a
    input       b,        // b
    output      y1,       // CONTINUOUS ASSIGNMENT STATEMENT
    output reg  y2,       // ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    output reg  y3,       // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    output      y4        // GATE PRIMATIVES
);

    // METHOD 1 - CONTINUOUS ASSIGNMENT STATEMENT
    assign y1 = a & b;

    // METHOD 2 - ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * ) begin
        y2 <= a & b;
    end

    // METHOD 3 - ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    //          - ONLY USE IN TESTBENCHES
    always @ ( * ) begin
        y3 = a & b;
    end

    // METHOD 4 - GATE PRIMITIVES
    and (y4, a, b);

endmodule
