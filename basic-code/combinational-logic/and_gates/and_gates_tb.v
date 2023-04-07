`timescale 1ns / 1ns

// include files in and_gates.vh

module and_gates_tb;

    // DATA TYPES - DECLAIR REGISTERS AND WIRES (PROBES)
    reg  A, B;
    wire Y1, Y2, Y3, Y4;

    // UNIT UNDER TEST
    and_gates uut(
        .a(A), .b(B),
        .y1(Y1), .y2(Y2), .y3(Y3), .y4(Y4)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("and_gates_tb.vcd");
        $dumpvars(0, and_gates_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0; B = 0;
        
        #10 A = 1; B = 0;
        #10 A = 0; B = 1;
        #10 A = 1; B = 1;
        #10
        
        $display("test complete");
        $finish;
    end

endmodule