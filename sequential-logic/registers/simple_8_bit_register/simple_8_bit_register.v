// A simple 8-bit register with synchronous load and clear.

module simple_8_bit_register (
    input       [7:0]   data_in,    // Data to load
    input               clk,        // Clock
    input               ld_bar,     // Load
    input               clr_bar,    // Clear
    output  reg [7:0]   data_out    // Output Data
);

    // 8-BIT REGISTER
    always @ (posedge clk) begin
        if (~clr_bar) begin
            data_out <= 0;
        end else if (~ld_bar) begin
            data_out <= data_in;
        end
    end

endmodule
