// A positive edge d flip-flop with synchronous enable

module d_flip_flop (
    input       clk,        // Clock
    input       en,         // Enable
    input       d,          // Input
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
