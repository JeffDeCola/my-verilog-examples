// Recognize the pattern 00110 in a serial stream.

module pattern_recognition(
    input        clk,           // clk
    input        rst,           // Reset
    input        in,            // Serial in
    output       found          // Found pattern
);

reg [2:0] current_state, next_state;

// Doesn't really matter with the bits
parameter [2:0] S0      = 3'b000;
parameter [2:0] S10     = 3'b001;
parameter [2:0] S110    = 3'b010;
parameter [2:0] S0110   = 3'b011;
parameter [2:0] S00110  = 3'b100;

assign found = (current_state == S00110) ? 1 : 0;

// CURRENT STATE
always @ (posedge clk) begin
    if (rst) begin
        current_state <= S0;
    end else begin
        current_state <= next_state;
    end
end

// FINITE STATE MACHINE
always @ (current_state or in) begin
    case (current_state)
        S0: begin
            if (in) next_state <= S10;
            else    next_state <= S0;
        end
        S10: begin
            if (in) next_state <= S110;
            else    next_state <= S0;
        end
        S110: begin
            if (!in) next_state <= S0110;
            else    next_state <= S0;
        end
        S0110: begin
            if (!in) next_state <= S00110;
            else    next_state <= S0;
        end
        S00110:begin
            if (in) next_state <= S10;
            else    next_state <= S0;
        end
    endcase

end

endmodule
