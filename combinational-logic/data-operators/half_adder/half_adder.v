// A 2-bit half adder

module half_adder(
    input       a,           // Data
    input       b,           // Data
    output reg  sum,         // Sum of a + b
    output reg  cout         // Carry out
);

    // ADDER
    always @ ( a or b ) begin
        {cout, sum} <= a + b;
    end

endmodule
