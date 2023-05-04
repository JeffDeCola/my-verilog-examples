`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in mux_to_demux.vh

module MUX_TO_DEMUX_TB;

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
    mux_to_demux_gate UUT_mux_to_demux_gate(
        .a(A), .b(B),
        .y(Y_gate)
    );

    // UNIT UNDER TEST (dataflow)
    mux_to_demux_dataflow UUT_mux_to_demux_dataflow(
        .a(A), .b(B),
        .y(Y_data)
    );

    // UNIT UNDER TEST (behavioral)
    mux_to_demux_behavioral UUT_mux_to_demux_behavioral(
        .a(A), .b(B),
        .y(Y_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mux_to_demux_tb.vcd");
        $dumpvars(0, MUX_TO_DEMUX_TB);
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
        FD=$fopen("mux_to_demux_tb.tv","r");
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

// include files in mux-to-demux.vh

module mux_to_demux_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg     A_IN, B_IN, C_IN, D_IN;
    reg     [1:0] SEL;
    wire    A_OUT, B_OUT, C_OUT, D_OUT;
    integer i;

    // UNIT UNDER TEST
    mux_to_demux uut(
        .a_in(A_IN), .b_in(B_IN), .c_in(C_IN), .d_in(D_IN),
        .sel(SEL),
        .a_out(A_OUT), .b_out(B_OUT), .c_out(C_OUT), .d_out(D_OUT)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mux_to_demux_tb.vcd");
        $dumpvars(0, mux_to_demux_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A_IN = 0; B_IN = 0; C_IN = 0; D_IN = 0;
        SEL = 2'b00;

        for (i = 0; i < 64; i = i + 1) begin
            {SEL, D_IN, C_IN, B_IN, A_IN} = i;
            #10;
        end
        
        $display("test complete");
        $finish;
    end

endmodule
