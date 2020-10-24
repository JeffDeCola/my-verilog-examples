// Quad 2-line to 1-line data selector/multiplexer, non-inverting outputs
module jeff_74x157(
    input        clk,           // Clock
    input        rst,           // Reset
    input        in,            // IN
    output       out            // OUT
);

reg       out;

always @ (posedge clk) begin
    if (rst) begin
        out <= 1'b0;
    end else begin
        out <= in;
    end
end

endmodule
