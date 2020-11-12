// A simple 8-bit register with synchronous load and clear

module simple_pipeline (
    input                 clk,
    input       [7:0]     a, b, c, d,
    output reg  [7:0]     f
);

reg [7:0] y1, y2, y3, d1, d2;

// STAGE 1
always @ (posedge clk) begin
    y1 <= a + b;
    y2 <= c - d;
    d1 <= d;
end

// STAGE 2
always @ (posedge clk) begin
    y3 <= y1 + y2;
    d2 <=  d1;
end

// STAGE 3
always @ (posedge clk) begin
    f <= y3 * d2;
end

endmodule
