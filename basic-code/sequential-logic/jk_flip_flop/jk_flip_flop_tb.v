`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in jk_flip_flop.vh

module JK_FLIP_FLOP_TB ();

    // INPUT PROBES
    reg             CLK;
    reg             J, K;

    // OUTPUT PROBES
    wire            Q, QBAR;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             QEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (_gate, _dataflow, _behavioral)
    jk_flip_flop_dataflow UUT_jk_flip_flop(
        .clk(CLK), 
        .j(J), .k(K),
        .q(Q), .qbar(QBAR)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jk_flip_flop_tb.vcd");
        $dumpvars(0, JK_FLIP_FLOP_TB);
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
        FD=$fopen("jk_flip_flop_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, J, K);
        CLK = 0;
        VECTORCOUNT = 0;
        ERRORS = 0;
        COMMENT ="";

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START ------------------------------");
        $display();
        $display("                 | TIME(ns) | J | K | Q |");
        $display("                 ------------------------");
        $monitor("%4d  %10s | %8d | %1d | %1d | %1d |", VECTORCOUNT, COMMENT, $time, J, K, Q);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, J, K, QEXPECTED);

        // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
        if (COUNT == -1) begin
            $fclose(FD);
            $display();
            $display(" VECTORS: %4d", VECTORCOUNT);
            $display("  ERRORS: %4d", ERRORS);
            $display();
            $display("TEST END --------------------------------");
            $display();
            $finish;
        end

        // GET ANOTHER VECTOR
        VECTORCOUNT = VECTORCOUNT + 1;

    end

    // CHECK TEST VECTORS ON NEG EGDE CLK
    always @(negedge CLK) begin

        // CHECK EACH VECTOR RESULT
        if (Q !== QEXPECTED) begin
            $display("***ERROR - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
