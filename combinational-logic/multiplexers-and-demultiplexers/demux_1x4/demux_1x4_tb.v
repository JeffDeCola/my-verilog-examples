`timescale 1ns / 1ns

// include files in demux-1x4.vh

module demux_1x4_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     Y;
    reg     [1:0] SEL;
    wire    A, B, C, D;
    integer i;

    // UNIT UNDER TEST
    demux_1x4 uut(
        .y(Y),
        .sel(SEL),
        .a(A), .b(B), .c(C), .d(D)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("demux_1x4_tb.vcd");
        $dumpvars(0, demux_1x4_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        Y = 0;
        SEL = 2'b00;

        for (i = 0; i < 8; i = i + 1) begin
            {SEL, Y} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
