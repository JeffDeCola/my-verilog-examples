`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in decoder_to_encoder.vh

module DECODER_TO_ENCODER_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [2:0]      IN;
    wire [2:0]      OUT;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [3:0]       OUTEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    decoder_to_encoder_structural UUT_decoder_to_encoder_structural(
        .in(IN),
        .out(OUT)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("decoder_to_encoder_tb.vcd");
        $dumpvars(0, DECODER_TO_ENCODER_TB);
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
        FD=$fopen("decoder_to_encoder_tb.tv","r");
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
        $display("                 | TIME(ns) | IN  | OUT |");
        $display("                 ------------------------");
        $monitor("%4d  %10s | %8d | %1b | %1b |", VECTORCOUNT, COMMENT, $time, IN, OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, IN, OUTEXPECTED);

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
