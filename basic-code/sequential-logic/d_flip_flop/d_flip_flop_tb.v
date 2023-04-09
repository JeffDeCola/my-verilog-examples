`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in d-flip-flop.vh

module d_flip_flop_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  CLK;
    reg  D;
    wire Q1, Q1_BAR;
    wire Q2, Q2_BAR;
    wire Q3, Q3_BAR;

    // UNIT UNDER TEST
    d_flip_flop UUT(
        .clk(CLK),
        .d(D),
        .q1(Q1), .q1_bar(Q1_BAR),
        .q2(Q2), .q2_bar(Q2_BAR),
        .q3(Q3), .q3_bar(Q3_BAR)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);
    end

    // PERIOD
    localparam CLKTICK = 20;  

    // CLOCK
    always begin
        #10 CLK = ~CLK;
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("TEST START");
        CLK = 0;
        #5            // CLOCK OFFSET
        
        D = 0;        // STORE 0
        #CLKTICK;    
  
        D = 1;        // STORE 1
        #CLKTICK;
          
        D = 0;        // STORE 0 
        #CLKTICK;

        // WHEN D = 0,  PULSE D WHEN CLOCK 1
        #10;
        D = 1;
        #2;
        D = 0;
        #8;
        
        // WHEN D = 0, PULSE D WHEN CLOCK 0
        D = 1;
        #2;
        D = 0;
        #18;

        // WHEN D = 1, PULSE D WHEN CLOCK 0
        D=1;
        #10;
        D = 0;
        #2;
        D = 1;
        #8;
        
        // WHEN D = 1, PULSE D WHEN CLOCK 0
        D = 0;
        #2;
        D = 1;
        #18;

        #CLKTICK;

        $display("TEST END");
        $finish;
    end

endmodule