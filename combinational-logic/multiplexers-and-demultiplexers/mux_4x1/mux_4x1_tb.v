`timescale 1ns / 1ns

// include files in mux-4x1.vh

module mux_4x1_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     A, B, C, D;
    reg     [1:0] SEL;
    wire    Y;
    integer i;

    // UNIT UNDER TEST
    mux_4x1 uut(
        .a(A), .b(B), .c(C), .d(D),
        .sel(SEL),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mux_4x1_tb.vcd");
        $dumpvars(0, mux_4x1_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0; B = 0; C = 0; D = 0;
        SEL = 2'b00;

        for (i = 0; i < 64; i = i + 1) begin
            {SEL, D, C, B, A} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
