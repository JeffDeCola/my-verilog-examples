// A 2-bit full adder

module full_adder(
    input  a,           // a
    input  b,           // b
    input  cin,         // Carry in
    output sum,         // sum of a + b
    output cout         // Carry out
);

reg sum, cout;

always @ ( a or b or cin) begin
    {cout, sum} <= a + b + cin;
end

endmodule
