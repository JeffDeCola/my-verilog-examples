// AND gate designed a few different ways
module and_gate(
    input  x,        // x
    input  y,        // y
    output xy_1,     // CONTINUOUS ASSIGNMENT STATEMENT
    output xy_2,     // ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    output xy_3,     // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    output xy_4      // GATE PRIMATIVES
);

// DATA TYPES
reg xy_2;
reg xy_3;

// METHOD 1 - CONTINUOUS ASSIGNMENT STATEMENT
assign xy_1 = x & y;

// METHOD 2 - ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
always @ ( * ) begin
    xy_2 <= x & y;
end

// METHOD 3 - ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
//          - ONLY USE IN TESTBENCHES
always @ ( * ) begin
    xy_3 = x & y;
end

// METHOD 4 - GATE PRIMITIVES
and(xy_4, x, y);

endmodule
