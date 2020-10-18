// AND gate designed a few different ways
module and_gate(
    x,        // in x
    y,        // in y
    xy_1      // out 1 - ???
    xy_2      // out 2 - ???
    xy_3      // out 3 - ???
    xy_4      // out 4 - ???
);

// PORT DECLARATION
input x, y;
output xy_0, xy_1, xy_3, xy_4;

// DATA TYPES (NOT NEEDED IN THIS EXAMPLE)   
wire x, y;
wire xy_0, xy_1, xy_3, xy_4;

// CODE STARTS HERE

// METHOD 1 - BITWISE AND OPERATOR

// METHOD 2 - ???

// METHOD 3 - ???

// METHOD 4 - ???


and(xy, x, y);
xy <= x + y
endmodule
