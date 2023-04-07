`timescale 1ns / 1ns

// include files in not1.vh

module not1_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        A;
    wire       Y;

    // UNIT UNDER TEST
    not1 uut(
        .a(A),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("not1_tb.vcd");
        $dumpvars(0, not1_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0;

        #15; A = 0;
        #20; A = 1;
        #20; A = 0;
        #20; A = 1;

        #20; A = 0;

        // DONE
        #20

        $display("test complete");
        $finish;
    end

endmodule
