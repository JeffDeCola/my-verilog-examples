`timescale 1ns / 1ns

// include files in nand4.vh

module nand4_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        A, B, C, D;
    wire       Y;

    // UNIT UNDER TEST
    nand4 uut(
        .a(A), .b(B), .c(C), .d(D),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("nand4_tb.vcd");
        $dumpvars(0, nand4_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        D = 0; C = 0; B = 0; A = 0;

        #15; D = 0; C = 0; B = 0; A = 0;
        #20; D = 0; C = 0; B = 0; A = 1;
        #20; D = 0; C = 0; B = 1; A = 0;
        #20; D = 0; C = 0; B = 1; A = 1;
        #20; D = 0; C = 1; B = 0; A = 0;
        #20; D = 0; C = 1; B = 0; A = 1;
        #20; D = 0; C = 1; B = 1; A = 0;
        #20; D = 0; C = 1; B = 1; A = 1;
        #20; D = 1; C = 0; B = 0; A = 0;
        #20; D = 1; C = 0; B = 0; A = 1;
        #20; D = 1; C = 0; B = 1; A = 0;
        #20; D = 1; C = 0; B = 1; A = 1;
        #20; D = 1; C = 1; B = 0; A = 0;
        #20; D = 1; C = 1; B = 0; A = 1;
        #20; D = 1; C = 1; B = 1; A = 0;
        #20; D = 1; C = 1; B = 1; A = 1;

        #20; D = 0; C = 0; B = 0; A = 0;

        // DONE
        #20

        $display("test complete");
        $finish;
    end

endmodule
