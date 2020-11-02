// 2-input OR gate
module nor2(
    input           a, b,          //
    output          y              //
);

// CONTINUOUS ASSIGNMENT STATEMENT
//assign y = a ~| b;                // Can't synthesize this
assign y = ~(a | b);

endmodule
