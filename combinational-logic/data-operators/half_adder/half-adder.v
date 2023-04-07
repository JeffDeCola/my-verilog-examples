// A 2-bit half adder

module half_adder(
    input  a,           // a
    input  b,           // b
    output sum,         // sum of a + b
    output cout         // Carry out
);

reg sum, cout;

always @ ( a or b ) begin
    {cout, sum} <= a + b;
end

endmodule
