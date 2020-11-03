// a few buttons

// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED
module button_clock_pulse (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output reg      out             // PULSE FOR 1 CLOCK CYCLE
);

reg lock = 0;

always @ (posedge clk) begin
    if (pressed & ~lock) begin              // BUTTON PRESSED
        lock <= 1'b1;                       // - Lock
        out <= 1'b1;                        // - Pulse
    end else if (~pressed & lock) begin     // BUTTON RELEASED
        lock <= 1'b0;                       // - Release Lock
    end else begin
        out <= 1'b0;
    end
end

endmodule

// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW
module button_two_presses (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out             // TWO PRESSES
);

reg lock = 0;
reg toggle = 0;

assign out = toggle;

always @ (posedge clk) begin
    if (pressed & ~lock) begin              // BUTTON PRESSED
        lock <= 1'b1;                       // - Lock
        toggle <= ~toggle;                   // - toggle
    end else if (~pressed & lock) begin     // BUTTON RELEASED
        lock <= 1'b0;                       // - Release Lock
    end
end

endmodule
