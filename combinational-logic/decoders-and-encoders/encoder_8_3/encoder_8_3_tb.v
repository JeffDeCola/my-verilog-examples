`timescale 1ns / 1ns

// include files in encoder-8-3.vh

module encoder_8_3_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [7:0] IN;
    wire [2:0] OUT;
    integer i;

    // UNIT UNDER TEST
    encoder_8_3 uut(
        .in(IN), 
        .out(OUT)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("encoder_8_3_tb.vcd");
        $dumpvars(0, encoder_8_3_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        IN = 8'b00000000;

        for (i = 0; i < 8; i = i + 1) begin
            IN = 8'b00000000;
            IN[i] = 1'b1;
            #10;
        end
        
        // WHAT IF YOU GET MORE THAN 1 HOT - should default to 0.
        IN = 8'b00101000;
        #10;

        $display("test complete");
        $finish;
    end

endmodule
