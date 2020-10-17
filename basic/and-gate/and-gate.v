// AND gate
module and_gate(
    x,      // in1
    y,      // in2
    xy      // out
);

// PORT DECLARATION
input x, y;
output xy;

// CODE STARTS HERE
and(xy, x, y);

endmodule
