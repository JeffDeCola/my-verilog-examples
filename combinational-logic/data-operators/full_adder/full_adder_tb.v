`timescale 1ns / 1ns

// include files in full-adder.vh

module full_adder_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     A, B, CIN;
    wire    SUM, COUT;
    integer i;

    // UNIT UNDER TEST
    full_adder uut(
        .a(A), .b(B), .cin(CIN),
        .sum(SUM), .cout(COUT)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0;
        B = 0;
        CIN = 0;

        for (i = 0; i < 8; i = i + 1) begin
            {A, B, CIN} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
