// a few buttons

// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED
module button_clock_pulse(
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output reg      out             // PULSE FOR 1 CLOCK CYCLE
);

reg button_pressed = 0;

always @ (posedge clk) begin
    if (pressed & ~button_pressed) begin
        button_pressed <= 1'b1;
        out <= 1'b1;
    end else if (button_pressed & ~pressed) begin
        button_pressed <= 1'b0;
    end else begin
        out <= 1'b0;
    end
end

endmodule

// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW
module button_two_presses(
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out             // 
);

reg button_pressed;
reg out = 0;

always @ (posedge clk or posedge pressed) begin
    if (pressed & ~button_pressed) begin
        button_pressed <= 1'b1;
        out <= 1'b1;
    end else if (button_pressed) begin
        button_pressed <= 1'b0;
    end else begin
        out <= 1'b1;
    end
end

endmodule