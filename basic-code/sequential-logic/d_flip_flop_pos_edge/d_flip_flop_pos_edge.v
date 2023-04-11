// A d (data) flip-flop which stores data on posedge of clock
// (Used to be called master-slave d flip-flop).

module d_flip_flop_pos_edge (
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
