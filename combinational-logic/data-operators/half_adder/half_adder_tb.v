`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in half_adder.vh

module HALF_ADDER_TB;

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
    half_adder_gate UUT_half_adder_gate(
        .a(A), .b(B),
        .y(Y_gate)
    );

    // UNIT UNDER TEST (dataflow)
    half_adder_dataflow UUT_half_adder_dataflow(
        .a(A), .b(B),
        .y(Y_data)
    );

    // UNIT UNDER TEST (behavioral)
    half_adder_behavioral UUT_half_adder_behavioral(
        .a(A), .b(B),
        .y(Y_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, HALF_ADDER_TB);
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
        FD=$fopen("half_adder_tb.tv","r");
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

// include files in half-adder.vh

module half_adder_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     A, B;
    wire    SUM, COUT;
    integer i;

    // UNIT UNDER TEST
    half_adder uut(
        .a(A), .b(B),
        .sum(SUM), .cout(COUT)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0;
        B = 0;

        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
