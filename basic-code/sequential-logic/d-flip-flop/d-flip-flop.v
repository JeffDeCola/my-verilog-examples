// A positive edge d flip-flop with asynchronous enable.

module d_flip_flop (
    input       clk,        // Clock
    input       en,         // Enable
    input       d,          // Input
    output reg  q,          // Output
    output      q_bar       //
);

assign q_bar = ~q;

// D FLIP-FLOP WITH ASYNC ENABLE
always @ (posedge clk or posedge en) begin
    if (en) begin
        q <= d;
    end else begin
        q <= q;
    end
end

endmodule
