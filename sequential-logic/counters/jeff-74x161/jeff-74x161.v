// Synchronous presettable 4-bit binary counter, asynchronous clear
module jeff_74x161(
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
