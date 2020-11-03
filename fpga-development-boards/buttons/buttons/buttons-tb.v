`timescale 1ns / 1ns
`include "buttons.v"

module buttons_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLK;
reg        BUTTON_CLOCK_PULSE_PRESSED;
wire       BUTTON_CLOCK_PULSE_OUT;

// UUT buttons_clock_pulse
button_clock_pulse uut(
    .clk(CLK),
    .pressed(BUTTON_CLOCK_PULSE_PRESSED),
    .out(BUTTON_CLOCK_PULSE_OUT)
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
    BUTTON_CLOCK_PULSE_PRESSED = 0;

    #100

    // PRESS AND HOLD BUTTON
    BUTTON_CLOCK_PULSE_PRESSED = 1;
    #100
    BUTTON_CLOCK_PULSE_PRESSED = 0;

    // DONE
    #100

    $display("test complete");
    $finish;
end

endmodule
