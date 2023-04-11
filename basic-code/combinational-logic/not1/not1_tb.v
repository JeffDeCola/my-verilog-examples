`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in not1.vh

module NOT1_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        A;
    wire       Y;
    integer    i;

    // UNIT UNDER TEST
    not1 UUT_not1(
        .a(A),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("not1_tb.vcd");
        $dumpvars(0, NOT1_TB);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("TEST START");
        $write("| TIME(ns) | A | Y |"); // header
        $display;

        // INCREMENT IN BINARY
        for (i=0; i<2; i=i+1) begin
            {A} = i;
            #20;
        end

        $display("TEST END");
        $finish;
    end

    // OUTPUT ON SCREEN FOR ANY CHANGE
    always @(*)
    begin
        $strobe("| %8d | %1d | %1d |", $time, A, Y);
    end

endmodule