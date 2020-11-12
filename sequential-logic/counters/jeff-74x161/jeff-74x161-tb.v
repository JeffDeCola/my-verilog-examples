`timescale 1ns / 1ns

// include files in jeff-74x161-headerfiles.vh

module jeff_74x161_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLR_BAR, LD_BAR;
reg        ENT, ENP;
reg        CLK;
reg        A, B, C, D;
wire       QA, QB, QC, QD;
wire       RCO;

// UUT
jeff_74x161 uut(
    .clr_bar(CLR_BAR), .ld_bar(LD_BAR),
    .ent(ENT), .enp(ENP),
    .clk(CLK),
    .a(A), .b(B), .c(C), .d(D),
    .qa(QA), .qb(QB), .qc(QC), .qd(QD),
    .rco(RCO)
);

// FILES
initial begin
    $dumpfile("jeff-74x161-tb.vcd");
    $dumpvars(0, jeff_74x161_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLR_BAR = 1; LD_BAR = 1;
    ENT = 0; ENP = 0;
    CLK = 0;
    D = 0; C = 0; B = 0; A = 0;

    // ASYNC CLEAR
    #15; CLR_BAR = 0;

    // LOAD - PRESET TO 12
    #20; CLR_BAR = 1; LD_BAR = 0;
         D = 1; C = 1; B = 0; A = 0;
    #20 LD_BAR = 1;     

    // WAIT
    #100

    // COUNT - 13, 14, 15, 0, 1, 2, 3, 4....
    ENT = 1; ENP = 1;
    #300

    // STOP IT INHIBIT
    ENT = 0; ENP = 0;
    #100

    // LET IT CONTINUE
    ENT = 1; ENP = 1;
    #300

    // LOAD - PRESET TO 05
    #20; CLR_BAR = 1; LD_BAR = 0;
         D = 0; C = 1; B = 0; A = 1;
    #20 LD_BAR = 1;     

    // COUNT
    #100

    $display("test complete");
    $finish;
end

endmodule
