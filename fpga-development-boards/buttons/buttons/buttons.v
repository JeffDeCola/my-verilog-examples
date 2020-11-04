// a few buttons

// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED (SYNCHRONOUS PRESS)
module button_sync_clock_pulse (
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

// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED (AYNCHRONOUS PRESS)
module button_async_clock_pulse (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output reg      out             // PULSE FOR 1 CLOCK CYCLE
);

reg was_pressed = 0;
reg lock = 0;

always @ (posedge clk or posedge pressed) begin
    if (pressed & ~was_pressed & ~lock) begin       // BUTTON PRESSED
        was_pressed <= 1'b1;
    end else if (was_pressed & ~lock) begin         // OUT HIGH
        lock <= 1;
        was_pressed <= 0;
        out <= 1'b1;
    end else if (lock & out) begin                  // OUT LOW
        out <= 1'b0;
    end else if (~pressed & lock) begin             // WAIT FOR BUTTON TO BE RELEASED
        lock <= 1'b0;
    end else begin                                  // DEFAULT
        out <= 1'b0;
    end
end

endmodule

// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW (SYNCHRONOUS PRESSES)
module button_sync_two_presses (
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

// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW (ASYNCHRONOUS PRESSES)
module button_async_two_presses (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output reg      out             // PULSE FOR 1 CLOCK CYCLE
);

reg was_pressed = 0;
reg lock = 0;

// *******************************************************************************************
always @ (posedge clk or posedge pressed) begin
    if (pressed & ~was_pressed & ~lock) begin       // BUTTON PRESSED
        was_pressed <= 1'b1;
    end else if (was_pressed & ~lock) begin         // OUT HIGH
        lock <= 1;
        was_pressed <= 0;
        out <= 1'b1;
    end else if (lock & out) begin                  // OUT LOW
        out <= 1'b0;
    end else if (~pressed & lock) begin             // WAIT FOR BUTTON TO BE RELEASED
        lock <= 1'b0;
    end else begin                                  // DEFAULT
        out <= 1'b0;
    end
end

endmodule