// A positive edge d flip-flop with synchronous enable used in my jeff-74x377.

module d_flip_flop_pos_edge_sync_en (
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
