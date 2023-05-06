`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in encoder_to_decoder.vh

module ENCODER_TO_DECODER_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [7:0]      IN;
    wire [7:0]      OUT;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [7:0]       OUTEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    encoder_to_decoder_structural UUT_encoder_to_decoder_structural(
        .in(IN),
        .out(OUT)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("encoder_to_decoder_tb.vcd");
        $dumpvars(0, ENCODER_TO_DECODER_TB);
    end

    // TICK PERIOD
    localparam TICKPERIOD = 20;

    // TICK
    always begin
        #(TICKPERIOD/2) TICK = ~TICK;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        FD=$fopen("encoder_to_decoder_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, IN, OUTEXPECTED);
        TICK = 0;
        VECTORCOUNT = 0;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) |    IN    |    OUT   |");
        $display("                 ----------------------------------");
        $monitor("%4d  %10s | %8d | %1b | %1b |", VECTORCOUNT, COMMENT, $time, IN, OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, IN, OUTEXPECTED);

        // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
        if (COUNT == -1) begin
            $fclose(FD);
            $display();
            $display(" VECTORS: %4d", VECTORCOUNT);
            $display("  ERRORS: %4d", ERRORS);
            $display();
            $display("TEST END ----------------------------------");
            $display();
            $finish;
        end

        // GET ANOTHER VECTOR
        VECTORCOUNT = VECTORCOUNT + 1;

    end

    // CHECK TEST VECTORS ON POS EGDE TICK
    always @(posedge TICK) begin

        // WAIT A BIT
        #5;

        // CHECK EACH VECTOR RESULT
        if (OUT !== OUTEXPECTED) begin
            $display("***ERROR (behavioral) - Expected OUT = %b", OUTEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
