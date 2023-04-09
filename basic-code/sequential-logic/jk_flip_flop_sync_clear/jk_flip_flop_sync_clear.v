// A positive edge jk flip-flop with synchronous clear used in my jeff-74x161

module jk_flip_flop_sync_clear (
    input       clk,        // Clock
    input       clr_bar,    // Clear
    input       j,          // Inputs
    input       k,          // 
    output reg  q,          // Output
    output      q_bar       //
);

    assign q_bar = ~q;

    // JK FLIP-FLOP WITH SYNC CLEAR
    always @ (posedge clk) begin
        if (!clr_bar) begin
            q <= 1'b0;
        end else begin
            case({j,k})
                2'b0_0 : q <= q;
                2'b0_1 : q <= 1'b0;
                2'b1_0 : q <= 1'b1;
                2'b1_1 : q <= ~q;
            endcase
        end
    end

endmodule
