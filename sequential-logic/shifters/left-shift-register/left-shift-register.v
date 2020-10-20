// A 2-bit left-shift-register
module left_shift_register(
    input        clk,           // clk
    input        rst,           // Reset
    input        d,             // d
    output [3:0] out            // out
);

reg [3:0] out;

always @ (posedge clk) begin
    if (rst) begin
        out <= 4'b0000;      
    end else begin
        out <= {out[2:0], d};
    end
end

endmodule
