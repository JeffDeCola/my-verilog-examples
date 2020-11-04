`timescale 1ns / 1ns
`include "buttons.v"

module buttons_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLK;
reg        PRESSED;
wire       BUTTON_SYNC_CLOCK_PULSE_OUT;
wire       BUTTON_ASYNC_CLOCK_PULSE_OUT;
wire       BUTTON_SYNC_TWO_PRESSES_OUT;
wire       BUTTON_ASYNC_TWO_PRESSES_OUT;

button_sync_clock_pulse SYNC_CLOCK_PULSE (
    .clk(CLK),
    .pressed(PRESSED),
    .out(BUTTON_SYNC_CLOCK_PULSE_OUT)
);

button_async_clock_pulse ASYNC_CLOCK_PULSE (
    .clk(CLK),
    .pressed(PRESSED),
    .out(BUTTON_ASYNC_CLOCK_PULSE_OUT)
);

button_sync_two_presses SYNC_TWO_PRESSES (
    .clk(CLK),
    .pressed(PRESSED),
    .out(BUTTON_SYNC_TWO_PRESSES_OUT)
);

button_async_two_presses ASYNC_TWO_PRESSES (
    .clk(CLK),
    .pressed(PRESSED),
    .out(BUTTON_ASYNC_TWO_PRESSES_OUT)
);

// FILES
initial begin
    $dumpfile("buttons-tb.vcd");
    $dumpvars(0, buttons_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    PRESSED = 0;
    #100

    // PRESS AND HOLD BUTTON
    PRESSED = 1;
    #100
    PRESSED = 0;
    #100

    // PRESS AND HOLD BUTTON
    PRESSED = 1;
    #100
    PRESSED = 0;
    #100

    // PRESS AND HOLD BUTTON
    PRESSED = 1;
    #100
    PRESSED = 0;
    #100

   // PRESS AND HOLD BUTTON
    PRESSED = 1;
    #100
    PRESSED = 0;
    #100
    
    // PRESS AND HOLD BUTTON - QUICK PUSH NOT ON CLOCK
    PRESSED = 1;
    #5
    PRESSED = 0;
    #15
    #100

   // PRESS AND HOLD BUTTON
    PRESSED = 1;
    #100
    PRESSED = 0;
    #100

    $display("test complete");
    $finish;
end

endmodule
