`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in mealy_state_machine.vh

module MEALY_STATE_MACHINE_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        RST;
    reg        CLK;
    reg        IN;
    wire       FOUND;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             FOUNDEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    mealy_state_machine_behavioral UUT_mealy_state_machine_behavioral(
        .rst(RST),
        .clk(CLK),
        .in(IN),
        .found(FOUND)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mealy_state_machine_tb.vcd");
        $dumpvars(0, MEALY_STATE_MACHINE_TB);
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
        FD=$fopen("mealy_state_machine_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, RST, IN, FOUNDEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | RST | IN | FOUND |");
        $display("                 -------------------------------");
        // $monitor("%4d  %10s | %8d |  %1d  | %1d  |   %1d   |", VECTORCOUNT, COMMENT, $time, RST, IN, FOUND);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, RST, IN, FOUNDEXP);

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

        // DISPLAY OUTPUT ON POS EDGE CLK
        $display("%4d  %10s | %8d |  %1d  | %1d  |   %1d   |", VECTORCOUNT, COMMENT, $time, RST, IN, FOUND);

        // CHECK EACH VECTOR RESULT
        if (FOUNDEXP !== FOUND) begin
            $display("***ERROR (behavioral) - Expected FOUND=%b", FOUNDEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule