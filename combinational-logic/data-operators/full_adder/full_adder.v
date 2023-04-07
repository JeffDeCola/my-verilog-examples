// A 2-bit full adder

module full_adder(
    input       a,           // Data
    input       b,           // Data
    input       cin,         // Carry in
    output reg  sum,         // Sum of a + b
    output reg  cout         // Carry out
);

    // ADDER
    always @ ( a or b or cin) begin
        {cout, sum} <= a + b + cin;
    end

endmodule
