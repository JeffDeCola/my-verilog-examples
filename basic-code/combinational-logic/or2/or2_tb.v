`timescale 1ns / 1ns

// include files in or2.vh

module or2_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        A, B;
    wire       Y;

    // UNIT UNDER TEST
    or2 uut(
        .a(A), .b(B),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("or2_tb.vcd");
        $dumpvars(0, or2_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        B = 0; A = 0;

        #15; B = 0; A = 0;
        #20; B = 0; A = 1;
        #20; B = 1; A = 0;
        #20; B = 1; A = 1;

        #20; B = 0; A = 0;

        // DONE
        #20

        $display("test complete");
        $finish;
    end

endmodule
