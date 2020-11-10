// A simple 8-bit register with synchronous load and clear

module simple_pipeline (
    input       [7:0]   data_in,
    input               clk,
    input               ld_bar,
    input               clr_bar,
    output  reg [7:0]   data_out
);

always @ (posedge clk) begin
    if (~clr_bar) begin
        data_out <= 0;
    end else if (~ld_bar) begin
        data_out <= data_in;
    end
end

endmodule
