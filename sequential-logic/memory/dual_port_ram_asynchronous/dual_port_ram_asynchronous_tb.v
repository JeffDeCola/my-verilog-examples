`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in dual_port_ram_asynchronous.vh

module DUAL_PORT_RAM_ASYNCHRONOUS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK_A, CLK_B;
    reg             WE_A, WE_B;
    reg  [3:0]      ADDR_A, ADDR_B;
    reg  [7:0]      DATA_IN_A, DATA_IN_B;
    wire [7:0]      DATA_OUT_A, DATA_OUT_B;
  
    // FOR TESTING  
    reg [31:0]      VECTORCOUNT_A, VECTORCOUNT_B, ERRORS_A, ERRORS_B;
    reg [7:0]       DATA_OUTEXP_A, DATA_OUTEXP_B;
    integer         FD_A, FD_B, COUNT_A, COUNT_B;
    reg [8*32-1:0]  COMMENT_A, COMMENT_B;

    // UNIT UNDER TEST
    dual_port_ram_asynchronous_behavioral UUT_dual_port_ram_asynchronous_behavioral(
        .clk_A (CLK_A), .clk_B (CLK_B),
        .we_A (WE_A), .we_B (WE_B),
        .addr_A (ADDR_A), .addr_B (ADDR_B),
        .data_in_A (DATA_IN_A), .data_in_B (DATA_IN_B),
        .data_out_A (DATA_OUT_A), .data_out_B (DATA_OUT_B)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("dual_port_ram_asynchronous_tb.vcd");
        $dumpvars(0, DUAL_PORT_RAM_ASYNCHRONOUS_TB);
    end

    // CLK PERIOD
    localparam CLKPERIOD_A = 20;
    localparam CLKPERIOD_B = 15;

    // CLK
    always begin
        #(CLKPERIOD_A/2) CLK_A = ~CLK_A;
    end
    always begin
        #(CLKPERIOD_B/2) CLK_B = ~CLK_B;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        FD_A=$fopen("dual_port_ram_asynchronous_tb_A.tv","r");
        FD_B=$fopen("dual_port_ram_asynchronous_tb_B.tv","r");
        COUNT_A = $fscanf(FD_A, "%s", COMMENT_A);
        COUNT_B = $fscanf(FD_B, "%s", COMMENT_B);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT_A = $fscanf(FD_A, "%s %b %b %b %b", COMMENT_A, WE_A, ADDR_A, DATA_IN_A, DATA_OUTEXP_A);
        COUNT_B = $fscanf(FD_B, "%s %b %b %b %b", COMMENT_B, WE_B, ADDR_B, DATA_IN_B, DATA_OUTEXP_B);
        CLK_A = 0;
        CLK_B = 0;
        VECTORCOUNT_A = 0;
        VECTORCOUNT_B = 0;
        ERRORS_A = 0;
        ERRORS_B = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | WE_A | ADDR_A | DATA_IN_A | DATA_OUT_A | WE_B | ADDR_B | DATA_IN_B | DATA_OUT_B |");
        $display("                 ----------------------------------------------------------------------------------------------");

        $monitor("%4d  %4s_%4s  | %8d |  %1b   |  %1b  | %1b  |  %1b  |", VECTORCOUNT_A, COMMENT_A, COMMENT_A, $time,
                  WE_A, ADDR_A, DATA_IN_A, DATA_OUT_A);
    end

    initial begin
       // $monitor("%4d  %4s_%4s  | %8d |                                        |  %1b   |  %1b  | %1b  |  %1b  |", VECTORCOUNT_B, COMMENT_B, COMMENT_B, $time,
        //          WE_B, ADDR_B, DATA_IN_B, DATA_OUT_B);
    end

    // APPLY TEST VECTORS ON NEG EDGE CLK_A (ADD DELAY)
    always @(negedge CLK_A) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT_A = $fscanf(FD_A, "%s %b %b %b %b", COMMENT_A, WE_A, ADDR_A, DATA_IN_A, DATA_OUTEXP_A);

        // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
        if (COUNT_A == -1) begin
            $fclose(FD_A);
            $display();
            $display(" VECTORS_A: %4d", VECTORCOUNT_A);
            $display("  ERRORS_A: %4d", ERRORS_A);
            $display();
            $display("TEST END ----------------------------------");
            $display();
            $finish;
        end

        // GET ANOTHER VECTOR
        VECTORCOUNT_A = VECTORCOUNT_A + 1;

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK_B (ADD DELAY)
    always @(negedge CLK_B) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT_B = $fscanf(FD_B, "%s %b %b %b %b", COMMENT_B, WE_B, ADDR_B, DATA_IN_B, DATA_OUTEXP_B);

        // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
        if (COUNT_B == -1) begin
            $fclose(FD_B);
            $display();
            $display(" VECTORS_B: %4d", VECTORCOUNT_B);
            $display("  ERRORS_B: %4d", ERRORS_B);
            $display();
            $display("TEST END ----------------------------------");
            $display();
            $finish;
        end

        // GET ANOTHER VECTOR
        VECTORCOUNT_B = VECTORCOUNT_B + 1;

    end

    // CHECK TEST VECTORS ON POS EGDE CLK_A
    always @(posedge CLK_A) begin

        // WAIT A BIT
        #5;

        // CHECK EACH VECTOR RESULT
        if (DATA_OUTEXP_A !== DATA_OUT_A) begin
            $display("***ERROR - Expected DATA_OUT_A=%b", DATA_OUTEXP_A);
            ERRORS_A = ERRORS_A + 1;
        end

    end   

    // CHECK TEST VECTORS ON POS EGDE CLK_B
    always @(posedge CLK_B) begin

        // WAIT A BIT
        #5;

        // CHECK EACH VECTOR RESULT
        if (DATA_OUTEXP_B !== DATA_OUT_B) begin
            $display("***ERROR - Expected DATA_OUT_B=%b", DATA_OUTEXP_B);
            ERRORS_B = ERRORS_B + 1;
        end

    end   

endmodule
