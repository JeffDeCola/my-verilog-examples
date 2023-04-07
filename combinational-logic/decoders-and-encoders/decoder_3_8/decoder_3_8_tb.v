`timescale 1ns / 1ns

// include files in decoder-3-8.vh

module decoder_3_8_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     [2:0] IN;
    wire    [7:0] OUT;
    integer i;

    // UNIT UNDER TEST
    decoder_3_8 uut(
        .in(IN),
        .out(OUT)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("decoder_3_8_tb.vcd");
        $dumpvars(0, decoder_3_8_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        IN = 3'b000;

        for (i = 0; i < 8; i = i + 1) begin
            IN = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
