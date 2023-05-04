`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in mux_4x1.vh

module MUX_4x1_TB;

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
    mux_4x1_gate UUT_mux_4x1_gate(
        .a(A), .b(B),
        .y(Y_gate)
    );

    // UNIT UNDER TEST (dataflow)
    mux_4x1_dataflow UUT_mux_4x1_dataflow(
        .a(A), .b(B),
        .y(Y_data)
    );

    // UNIT UNDER TEST (behavioral)
    mux_4x1_behavioral UUT_mux_4x1_behavioral(
        .a(A), .b(B),
        .y(Y_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mux_4x1_tb.vcd");
        $dumpvars(0, MUX_4x1_TB);
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
        FD=$fopen("mux_4x1_tb.tv","r");
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

// include files in mux-4x1.vh

module mux_4x1_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     A, B, C, D;
    reg     [1:0] SEL;
    wire    Y;
    integer i;

    // UNIT UNDER TEST
    mux_4x1 uut(
        .a(A), .b(B), .c(C), .d(D),
        .sel(SEL),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mux_4x1_tb.vcd");
        $dumpvars(0, mux_4x1_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 0; B = 0; C = 0; D = 0;
        SEL = 2'b00;

        for (i = 0; i < 64; i = i + 1) begin
            {SEL, D, C, B, A} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
