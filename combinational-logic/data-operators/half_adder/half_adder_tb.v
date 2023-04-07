`timescale 1ns / 1ns

// include files in half-adder.vh

module half_adder_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     A, B;
    wire    SUM, COUT;
    integer i;

    // UNIT UNDER TEST
    half_adder uut(
        .a(A), .b(B),
        .sum(SUM), .cout(COUT)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0;
        B = 0;

        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
