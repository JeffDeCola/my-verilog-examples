`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in jeff_74x151.vh

module JEFF_74x151_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             A, B;
    wire            Y_gate, Y_data, Y_beh;
    integer         i;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             YEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (gate)
    jeff_74x151_gate UUT_jeff_74x151_gate(
        .a(A), .b(B),
        .y(Y_gate)
    );

    // UNIT UNDER TEST (dataflow)
    jeff_74x151_dataflow UUT_jeff_74x151_dataflow(
        .a(A), .b(B),
        .y(Y_data)
    );

    // UNIT UNDER TEST (behavioral)
    jeff_74x151_behavioral UUT_jeff_74x151_behavioral(
        .a(A), .b(B),
        .y(Y_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x151_tb.vcd");
        $dumpvars(0, JEFF_74x151_TB);
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
        FD=$fopen("jeff_74x151_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, A, B, YEXPECTED);
        TICK = 0;
        VECTORCOUNT = 0;
        ERRORS = 0;
        COMMENT ="";

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                                     GATE  DATA   BEH");
        $display("                 | TIME(ns) | A | B |  Y  |  Y  |  Y  |");
        $display("                 --------------------------------------");
        $monitor("%4d  %10s | %8d | %1d | %1d |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, A, B, Y_gate, Y_data, Y_beh);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, A, B, YEXPECTED);

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
        if (Y_gate !== YEXPECTED) begin
            $display("***ERROR (gate) - Expected Y = %b", YEXPECTED);
            ERRORS = ERRORS + 1;
        end
        if (Y_data !== YEXPECTED) begin
            $display("***ERROR (dataflow) - Expected Y = %b", YEXPECTED);
            ERRORS = ERRORS + 1;
        end
        if (Y_beh !== YEXPECTED) begin
            $display("***ERROR (behavioral) - Expected Y = %b", YEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule





`timescale 1ns / 1ns

// include files in jeff-74x151.vh

module jeff_74x151_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        D0, D1, D2, D3, D4, D5, D6, D7;
    reg        A, B, C;
    reg        EN;
    wire       Y, W;

    // UNIT UNDER TEST
    jeff_74x151 uut(
        .d0(D0), .d1(D1), .d2(D2), .d3(D3), .d4(D4), .d5(D5), .d6(D6), .d7(D7),
        .a(A), .b(B), .c(C),
        .en(EN),
        .y(Y), .w(W)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x151_tb.vcd");
        $dumpvars(0, jeff_74x151_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        C = 0; B = 0; A = 0;
        EN = 1;

        #10; C = 0; B = 0; A = 0;
        #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 1;
        #10; C = 0; B = 0; A = 1;
        #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 1; D0 = 0;
        #10; C = 0; B = 1; A = 0;
        #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 1; D1 = 0; D0 = 0;
        #10; C = 0; B = 1; A = 1;
        #10; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 1; D2 = 0; D1 = 0; D0 = 0;
        #10; C = 1; B = 0; A = 0;
        #10; D7 = 0; D6 = 0; D5 = 0; D4 = 1; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #10; C = 1; B = 0; A = 1;
        #10; D7 = 0; D6 = 0; D5 = 1; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #10; C = 1; B = 1; A = 0;
        #10; D7 = 0; D6 = 1; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #10; C = 1; B = 1; A = 1;
        #10; D7 = 1; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #10

        EN = 0;
        #10

        $display("test complete");
        $finish;
    end

endmodule
