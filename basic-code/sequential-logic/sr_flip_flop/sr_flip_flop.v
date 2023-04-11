// A sr (set ready) flip-flop stores data on level of clock
// but can have an unknown output.

module sr_flip_flop (
    input       clk,        // Clock
    input       en,         // Enable
    input       d,          // Data
    output reg  q,          // Output
    output      q_bar       //
);

    assign q_bar = ~q;

    // D FLIP-FLOP WITH SYNC ENABLE
    always @ (posedge clk) begin
        if (en) begin
            q <= d;
        end else begin
            q <= q;
        end
    end

endmodule
