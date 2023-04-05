// A few different ways to model an AND gate

module and_gate(
    input  wire a,        // a
    input  wire b,        // b
    output wire y_1,      // CONTINUOUS ASSIGNMENT STATEMENT
    output reg  y_2,      // ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    output reg  y_3,      // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    output wire y_4       // GATE PRIMATIVES
);

// METHOD 1 - CONTINUOUS ASSIGNMENT STATEMENT
assign y_1 = a & b;

// METHOD 2 - ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
always @ ( * ) begin
    y_2 <= a & b;
end

// METHOD 3 - ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
//          - ONLY USE IN TESTBENCHES
always @ ( * ) begin
    y_3 = a & b;
end

// METHOD 4 - GATE PRIMITIVES
and(y_4, a, b);

endmodule
