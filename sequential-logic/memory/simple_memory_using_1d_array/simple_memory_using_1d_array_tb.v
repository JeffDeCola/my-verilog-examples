`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in simple_memory_using_1d_array.vh

module SIMPLE_MEMORY_USING_1D_ARRAY_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        CLK;
    reg        WRITE;
    reg  [3:0] ADDR;
    reg  [7:0] WDATA;
    wire [7:0] RDATA;
  
    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [7:0]       RDATAEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    simple_memory_using_1d_array_behavioral UUT_simple_memory_using_1d_array_behavioral(
        .clk   (CLK),
        .write (WRITE),
        .addr  (ADDR),
        .wdata (WDATA),
        .rdata (RDATA)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("simple_memory_using_1d_array_tb.vcd");
        $dumpvars(0, SIMPLE_MEMORY_USING_1D_ARRAY_TB);
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
        FD=$fopen("simple_memory_using_1d_array_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, WRITE, ADDR, WDATA, RDATAEXP);
        CLK = 0;
        VECTORCOUNT = 0;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | WRITE | ADDR |  WDATA   |  RDATA   |");
        $display("                 -------------------------------------------------");
        $monitor("%4d  %10s | %8d |   %1b   | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, WRITE, ADDR, WDATA, RDATA);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, WRITE, ADDR, WDATA, RDATAEXP);

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

    // CHECK TEST VECTORS ON POS EGDE CLK
    always @(posedge CLK) begin

        // WAIT A BIT
        #5;

        // CHECK EACH VECTOR RESULT
        if (RDATAEXP !== RDATA) begin
            $display("***ERROR (behavioral) - Expected RDATA=%b", RDATAEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
