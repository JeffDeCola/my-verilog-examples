`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in sr_latch.vh

module SR_LATCH_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        S, R;
    wire       Q, QBAR;

    // UNIT UNDER TEST
    sr_latch UUT_sr_latch(
        .s(S), .r(R),
        .q(Q), .qbar(QBAR)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("sr_latch_tb.vcd");
        $dumpvars(0, SR_LATCH_TB);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("TEST START");
        $write("| TIME(ns) | S | R | Q |");
        $display;

        // SET
        S = 1; R = 0;
        #10;

        // NO CHANGE
        S = 1; R = 1;
        #10;

        // RESET
        S = 0; R = 1;
        #10;

        // NO CHANGE  
        S = 1; R = 1;
        #10;

        // INVALID  
        S = 0; R = 0;
        #10;

        $display("TEST END");
        $finish;
    end

    // OUTPUT ON SCREEN FOR ANY CHANGE
    always @(*)
    begin
        $strobe("| %8d | %1d | %1d | %1d |", $time, S, R, Q);
    end

endmodule
