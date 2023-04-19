`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in sr_flip_flop.vh

module SR_FLIP_FLOP_TB ();

    // INPUT PROBES
    reg        S, R;

    // OUTPUT PROBES
    wire       Q, QBAR;

    // FOR TESTING  
    reg            CLK;
    reg [31:0]     VECTORCOUNT, ERRORS;
    reg            QEXPECTED;
    integer        FD, COUNT;
    reg [8*32-1:0] COMMENT;

    // UNIT UNDER TEST
    sr_flip_flop UUT_sr_flip_flop(
        .clk(CLK), 
        .s(S), .r(R),
        .q(Q), .qbar(QBAR)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("sr_flip_flop_tb.vcd");
        $dumpvars(0, SR_FLIP_FLOP_TB);
    end

    // CLK PERIOD
    localparam CLKPERIOD = 20;

    // CLK
    always begin
        #(CLKPERIOD/2) CLK = ~CLK;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        FD=$fopen("sr_flip_flop_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, S, R);
        CLK = 0;
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

    // APPLY TEST VECTORS ON POS EDGE CLK (ADD DELAY)
    always @(posedge CLK) begin

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

    // CHECK TEST VECTORS ON NEG EGDE CLK (ADD DELAY)
    always @(negedge CLK) begin
        
        // WAIT A BIT
        #5;

        // CHECK EACH VECTOR RESULT
        if (Q !== QEXPECTED) begin
            $display("***ERROR - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
