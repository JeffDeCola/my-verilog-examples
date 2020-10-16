// AND gate
module and_gate(
    x,      // in1
    y,      // in2
    xy      // out
);

// PORT DECLARATION
input x, y;
output xy;

and(xy, x, y);

endmodule
