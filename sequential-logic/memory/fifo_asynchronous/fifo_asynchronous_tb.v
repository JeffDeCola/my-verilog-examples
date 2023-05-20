`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in fifo_asynchronous.vh

module FIFO_ASYNCHRONOUS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             WCLK, RCLK;
    reg             WRST, RRST;
    reg  [7:0]      DATA_IN;
    reg             WE;
    wire            FULL;
    wire [7:0]      DATA_OUT;
    reg             RE;
    wire            EMPTY;

    // FOR TESTING  
    reg [31:0]      WVECTORCOUNT, RVECTORCOUNT, WERRORS, RERRORS;
    reg             FULLEXP;
    reg [7:0]       DATA_OUTEXP;
    reg             EMPTYEXP;
    integer         WFD, RFD, WCOUNT, RCOUNT;
    reg [8*32-1:0]  WCOMMENT, RCOMMENT;
    integer         WEND, REND;

    // UNIT UNDER TEST
    fifo_asynchronous_structural UUT_fifo_asynchronous_structural (
        .wclk(WCLK),
        .rclk(RCLK),
        .wrst(WRST),
        .rrst(RRST),
        .data_in(DATA_IN),
        .we(WE),
        .full(FULL),
        .data_out(DATA_OUT),
        .re(RE),
        .empty(EMPTY)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("fifo_asynchronous_tb.vcd");
        $dumpvars(0, FIFO_ASYNCHRONOUS_TB);
    end

    // CLK PERIOD
    localparam WCLKPERIOD = 20; // WRITE FASTER THAN READ
    localparam RCLKPERIOD = 15;

    // CLK
    always begin
        #(WCLKPERIOD/2) WCLK = ~WCLK;
    end
    always begin
        #(RCLKPERIOD/2) RCLK = ~RCLK;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        WFD=$fopen("fifo_asynchronous_tb_write.tv","r");
        RFD=$fopen("fifo_asynchronous_tb_read.tv","r");
        WCOUNT = $fscanf(WFD, "%s", WCOMMENT);
        RCOUNT = $fscanf(RFD, "%s", RCOMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        WCOUNT = $fscanf(WFD, "%s %b %b %b %b", WCOMMENT, WRST, WE, FULLEXP, DATA_IN);
        RCOUNT = $fscanf(RFD, "%s %b %b %b %b", RCOMMENT, RRST, RE, EMPTYEXP, DATA_OUTEXP);
        WCLK = 0;
        RCLK = 0;
        WVECTORCOUNT = 1;
        RVECTORCOUNT = 1;
        WERRORS = 0;
        RERRORS = 0;
        WEND = 0;
        REND = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                     | TIME(ns) | WRST | RRST | WE | FULL | DATA_IN  | RE | EMPTY | DATA_OUT |");
        $display("                     -------------------------------------------------------------------------");
        //$monitor("%4d  %10s | %8d |  %1b   |   %1b  | %1b  |  %1b   | %1b | %1b  |   %1b   | %1b |",
        //         VECTORCOUNT, COMMENT, $time, WRST, RRST, WE, FULL, DATA_IN, RE, EMPTY, DATA_OUT);
    end

    initial begin
        // WAIT FOR TEST TO FINISH
        // THIS IS NOT PERFECT - I PROBABLY NEED TO FIX THIS FOR DIFFERENT CLOCK SPEEDS
        @(REND);
        @(WEND);
        $display();
        $display(" WVECTORS: %4d", WVECTORCOUNT);
        $display("  WERRORS: %4d", WERRORS);
        $display(" RVECTORS: %4d", RVECTORCOUNT);
        $display("  RERRORS: %4d", RERRORS);
        $display();
        $display("TEST END ----------------------------------");
        $display();
        $finish;
    end

    // APPLY TEST VECTORS ON NEG EDGE WCLK (ADD DELAY)
    always @(negedge WCLK) begin

        if (!WEND) begin

            // WAIT A BIT (AFTER CHECK)
            #5;

            // GET VECTORS FROM TB FILE
            WCOUNT = $fscanf(WFD, "%s %b %b %b %b", WCOMMENT, WRST, WE, FULLEXP, DATA_IN);

            // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
            if (WCOUNT == -1) begin
                $fclose(WFD);
                WEND = 1;
            end else begin
                // GET ANOTHER VECTOR
                WVECTORCOUNT = WVECTORCOUNT + 1;
            end

        end

    end

    // APPLY TEST VECTORS ON NEG EDGE RCLK (ADD DELAY)
    always @(negedge RCLK) begin

        if (!REND) begin

            // WAIT A BIT (AFTER CHECK)
            #5;

            // GET VECTORS FROM TB FILE
            RCOUNT = $fscanf(RFD, "%s %b %b %b %b", RCOMMENT, RRST, RE, EMPTYEXP, DATA_OUTEXP);

            // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
            if (RCOUNT == -1) begin
                $fclose(RFD);
                REND = 1;
            end else begin
                // GET ANOTHER VECTOR
                RVECTORCOUNT = RVECTORCOUNT + 1;
            end
        
        end

    end

    // CHECK TEST VECTORS ON POS EGDE WCLK
    always @(posedge WCLK) begin

        if (!WEND) begin

            // WAIT A BIT
            #5;

            // DISPLAY OUTPUT ON POS EDGE WCLK
            $display ("%4d        %8s | %8d |  %1b   |      | %1b  |  %1b   | %1b |", WVECTORCOUNT, WCOMMENT, $time,
                        WRST, WE, FULL, DATA_IN);

            // CHECK EACH VECTOR RESULT
            if (FULL !== FULLEXP) begin
                $display("***WERROR - Expected FULL=%b", FULLEXP);
                WERRORS = WERRORS + 1;
            end
        
        end

    end   

    // CHECK TEST VECTORS ON POS EGDE RCLK
    always @(posedge RCLK) begin
      
        if (!REND) begin

            // WAIT A BIT
            #5;

            // DISPLAY OUTPUT ON POS EDGE RCLK
            $display("    %4d    %8s | %8d |      |  %1b   |                      |  %1b |   %1b   | %1b |", RVECTORCOUNT, RCOMMENT, $time,
                      RRST, RE, EMPTY, DATA_OUT);

            // CHECK EACH VECTOR RESULT
            if ((DATA_OUT !== DATA_OUTEXP) |(EMPTY !== EMPTYEXP)) begin
                $display("***RERROR - Expected DATA_OUT=%b, EMPTY=%b", DATA_OUTEXP, EMPTYEXP);
                RERRORS = RERRORS + 1;
            end

        end

    end   

endmodule
