`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in sr_latch.vh

module SR_LATCH_TB ();

    // INPUT PROBES
    reg        S, R;

    // OUTPUT PROBES
    wire       Q, QBAR;

    // FOR TESTING  
    reg            TICK;
    reg [31:0]     VECTORCOUNT, ERRORS;
    reg            QEXPECTED;
    integer        FD, COUNT;
    reg [8*32-1:0] COMMENT;

    // UNIT UNDER TEST
    sr_latch UUT_sr_latch(
        .s(S), .r(R),
        .q(Q), .qbar(QBAR)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("sr_latch_tb.vcd");
        $dumpvars(0, SR_LATCH_TB);
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
        FD=$fopen("sr_latch_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, S, R);
        TICK = 0;
        VECTORCOUNT = 0;
        ERRORS = 0;
        COMMENT ="";

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START ---------------------------");
        $display();
        $display("           | TIME(ns) | S | R | Q |");
        $display("           ------------------------");
        $monitor("%10s | %8d | %1d | %1d | %1d |", COMMENT, $time, S, R, Q);

    end

    // APPLY TEST VECTORS ON POS EDGE TICK (ADD DELAY)
    always @(posedge TICK) begin

        // WAIT A BIT
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, S, R, QEXPECTED);

        // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
        if (COUNT == -1) begin
            $fclose(FD);
            $display();
            $display(" VECTORS: %4d", VECTORCOUNT);
            $display("  ERRORS: %4d", ERRORS);
            $display();
            $display("TEST END ---------------------------");
            $display();
            $finish;
        end

        // GET ANOTHER VECTOR
        VECTORCOUNT = VECTORCOUNT + 1;

    end

    // CHECK TEST VECTORS ON NEG EGDE TICK (ADD DELAY)
    always @(negedge TICK) begin
        
        // WAIT A BIT
        #5;

        // CHECK EACH VECTOR RESULT
        if (Q !== QEXPECTED) begin
            $display("***ERROR - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
