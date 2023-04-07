`timescale 1ns / 1ns

// include files in jk-flip-flop.vh

module jk_flip_flop_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  CLK, CLR_BAR;
    reg  J, K;
    wire Q, Q_BAR;

    // UNIT UNDER TEST
    jk_flip_flop uut(
        .clk(CLK), .clr_bar(CLR_BAR),
        .j(J), .k(K),
        .q(Q), .q_bar(Q_BAR)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jk_flip_flop_tb.vcd");
        $dumpvars(0, jk_flip_flop_tb);
    end

    // CLOCK
    always begin
        #10 CLK = ~CLK;
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        CLK = 0;
        CLR_BAR = 1;
        J = 0; K = 0;
        
        // CLEAR
        #15 CLR_BAR = 0;
        #20 CLR_BAR = 1;

        #20; J = 0; K = 0;
        #20; J = 1; K = 0;
        #20; J = 1; K = 1;
        #20; J = 1; K = 1;
        #20; J = 0; K = 0;
        #20; J = 0; K = 0;
        #20; J = 1; K = 1;
        #20; J = 1; K = 1;
        #20;

        $display("test complete");
        $finish;
    end

endmodule