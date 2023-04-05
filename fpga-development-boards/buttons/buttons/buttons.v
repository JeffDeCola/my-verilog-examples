// A few different ways to use buttons on a FPGA development board.

// PRESS AND RELEASE OF THE BUTTON SYNCHRONOUSLY (SYNCHRONOUS PRESS AND RELEASE)
module button_sync_push_release (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN
    output reg      out             // PULSE FOR 1 CLOCK CYCLE
);

always @ (posedge clk) begin
        if (pressed) begin          // BUTTON PRESSED
            out <= 1'b1;                      
        end else begin              //  BUTTON NOT PRESSED
            out <= 1'b0;
        end
end

endmodule

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
        end else if (~pressed & lock) begin     // RELEASE LOCK  
            lock <= 1'b0;            
            out <= 1'b0;
        end else begin
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
        toggle <= ~toggle;                  // - Toggle
    end else if (~pressed & lock) begin     // WAIT TILL BUTTON RELEASED
        lock <= 1'b0;                       // - Release Lock
    end
end

endmodule

//************************************************************************************************
// DON'T USE THESE, THE SYNTHSIS TOOL WILL YELL AT YOU. I DESIGNED THEM FOR FUN

// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED (AYNCHRONOUS PRESS)
// DON'T USE - HERE FOR FUN
module button_async_clock_pulse (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out             // PULSE FOR 1 CLOCK CYCLE
);

reg was_pressed = 0;
reg lock = 0;
reg pre_out = 0;

assign out = pre_out;

always @ (posedge clk or posedge pressed) begin
    if (pressed & ~was_pressed & ~lock) begin       // BUTTON PRESSED - Then forget about it until later
        was_pressed <= 1'b1;
    end else if (was_pressed & ~lock) begin         // OUT HIGH
        lock <= 1;
        was_pressed <= 0;
        pre_out <= 1'b1;
    end else if (lock & out) begin                  // OUT LOW
        pre_out <= 1'b0;
    end else if (~pressed & lock) begin             // WAIT TILL BUTTON RELEASED
        lock <= 1'b0;
    end 
end

endmodule

// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW (ASYNCHRONOUS PRESSES)
// DON'T USE - HERE FOR FUN
module button_async_two_presses (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out             // PULSE FOR 1 CLOCK CYCLE
);

reg was_pressed = 0;
reg lock = 0;
reg toggle = 0;

assign out = toggle;

always @ (posedge clk or posedge pressed) begin
    if (pressed & ~was_pressed & ~lock) begin       // BUTTON PRESSED - Then forget about it for now
        was_pressed <= 1'b1;
    end else if (was_pressed & ~lock) begin         // OUT HIGH
        toggle <= ~toggle;                          // - toggle
        was_pressed <= 1'b0;
        lock <= 1;
    end else if (~pressed & lock) begin             // WAIT TILL BUTTON RELEASED
        lock <= 1'b0;
    end
end

endmodule
