`timescale 1ns / 1ns

// include files in jeff-74x377.vh

module jeff_74x377_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        CLK;
    reg        EN_BAR;
    reg        D7, D6, D5, D4, D3, D2, D1, D0;
    wire       Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0;

    // UNIT UNDER TEST
    jeff_74x377 uut(
        .clk(CLK),
        .en_bar(EN_BAR),
        .d7(D7), .d6(D6), .d5(D5), .d4(D4), .d3(D3), .d2(D2), .d1(D1), .d0(D0),   
        .q7(Q7), .q6(Q6), .q5(Q5), .q4(Q4), .q3(Q3), .q2(Q2), .q1(Q1), .q0(Q0)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x377_tb.vcd");
        $dumpvars(0, jeff_74x377_tb);
    end

    // CLOCK
    always begin
        #10 CLK = ~CLK;
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        CLK = 0;
        EN_BAR = 1;
        D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;

        // NOT ENABLE
        #15 EN_BAR = 1;
        #20 EN_BAR = 0;

        // LOAD IT UP
        #20; D7 = 0; D6 = 0; D5 = 1; D4 = 1; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #20; D7 = 0; D6 = 0; D5 = 1; D4 = 1; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #100;
        #20; D7 = 0; D6 = 0; D5 = 1; D4 = 1; D3 = 0; D2 = 1; D1 = 1; D0 = 0;
        #20; D7 = 1; D6 = 1; D5 = 0; D4 = 1; D3 = 0; D2 = 1; D1 = 1; D0 = 0;
        #100

      // NOT ENABLE - MAKE SURE OUTPUTS DON'T CHANGE
        #20 EN_BAR = 1;
        #20; D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 1; D2 = 1; D1 = 1; D0 = 1;
        #20 EN_BAR = 0;

        // DONE
        #20

        $display("test complete");
        $finish;
    end

endmodule
