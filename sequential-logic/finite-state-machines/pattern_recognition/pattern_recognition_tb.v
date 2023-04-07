`timescale 1ns / 1ns

// include files in pattern-recognition.vh

module pattern_recognition_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        CLK, RST;
    reg        IN;
    wire       FOUND;
    integer    i;

    // UNIT UNDER TEST
    pattern_recognition uut(
        .clk(CLK), .rst(RST),
        .in(IN),
        .found(FOUND)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("pattern_recognition_tb.vcd");
        $dumpvars(0, pattern_recognition_tb);
    end

    // CLOCK
    always begin
        #10 CLK = ~CLK;
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        CLK = 0;
        RST = 0;
        IN = 0;

        #15; RST = 1;
        #20; RST = 0;

        #20; IN = 1;
        #20; IN = 0;
        #20; IN = 0;
        #20; IN = 0;
        #20; IN = 0;
        #20; IN = 1;
        #20; IN = 0;
        #20; IN = 1;
        #20; IN = 1;
        #20; IN = 0;
        #20; IN = 0; // FOUND
        #20; IN = 1;
        #20; IN = 1;
        #20; IN = 0;
        #20; IN = 0; // FOUND
        #20; IN = 1;
        #20; IN = 0;
        
        // DONE
        #20

        $display("test complete");
        $finish;
    end

endmodule
