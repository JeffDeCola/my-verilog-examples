`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in xor2.vh

module XOR2_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        A, B;
    wire       Y;
    integer    i;

    // UNIT UNDER TEST
    xor2 UUT_xor2(
        .a(A), .b(B),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("xor2_tb.vcd");
        $dumpvars(0, XOR2_TB);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("TEST START");
        $write("| TIME(ns) | A | B | Y |"); // header
        $display;

        // INCREMENT IN BINARY
        for (i=0; i<4; i=i+1) begin
            {A, B} = i;
            #20;
        end

        $display("TEST END");
        $finish;
    end

    // OUTPUT ON SCREEN FOR ANY CHANGE
    always @(*)
    begin
        $strobe("| %8d | %1d | %1d | %1d |", $time, A, B, Y);
    end

endmodule