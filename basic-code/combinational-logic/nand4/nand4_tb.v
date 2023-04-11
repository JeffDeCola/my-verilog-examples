`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in nand4.vh

module NAND4_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        A, B, C, D;
    wire       Y;
    integer    i;

    // UNIT UNDER TEST
    nand4 UUT_nand4(
        .a(A), .b(B), .c(C), .d(D),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("nand4_tb.vcd");
        $dumpvars(0, NAND4_TB);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("TEST START");
        $write("| TIME(ns) | A | B | C | D | Y |"); // header
        $display;

        // INCREMENT IN BINARY
        for (i=0; i<16; i=i+1) begin
            {A, B, C, D} = i;
            #20;
        end

        $display("TEST END");
        $finish;
    end

    // OUTPUT ON SCREEN FOR ANY CHANGE
    always @(*)
    begin
        $strobe("| %8d | %1d | %1d | %1d | %1d | %1d |", $time, A, B, C, D, Y);
    end

endmodule