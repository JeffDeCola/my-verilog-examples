`timescale 1ns / 1ns

// include files in jeff-74x157.vh

module jeff_74x157_tb;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg [3:0]  A, B;
    reg        S;
    reg        EN;
    wire [3:0] Y;

    // UNIT UNDER TEST
    jeff_74x157 uut(
        .a(A),
        .b(B),
        .s(S),
        .en(EN),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x157_tb.vcd");
        $dumpvars(0, jeff_74x157_tb);
    end

    // TESTCASE - CHANGE REG VALUES
    initial begin
        $display("test start");
        A = 4'h0; B = 4'h1;
        S = 0;
        EN = 1;

        #10; S = 0;
        #10;  A = 4'ha; B = 4'h5;
        #10; S = 1;
        #10;  A = 4'h3; B = 4'h7;
        #10; S = 0;
        #10;  A = 4'h2; B = 4'h8;
        #10; S = 1;
        #10;  A = 4'h9; B = 4'h4;
        #10

        EN = 0;
        #10;
        
        // DONE
        #20

        $display("test complete");
        $finish;
    end

endmodule
