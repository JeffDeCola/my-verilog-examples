`timescale 1ns / 1ns

// include files in priority-arbiter-headerfiles.vh

module priority_arbiter_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  CLK, RST;
reg  REQ_0, REQ_1, REQ_2;
wire GNT_0, GNT_1, GNT_2;

// UUT
priority_arbiter uut(
    .clk(CLK), .rst(RST),
    .req_0(REQ_0), .req_1(REQ_1), .req_2(REQ_2),
    .gnt_0(GNT_0), .gnt_1(GNT_1), .gnt_2(GNT_2)
);

// FILES
initial begin
    $dumpfile("priority-arbiter-tb.vcd");
    $dumpvars(0, priority_arbiter_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// SIMULATION
initial begin
    $display("test start");
    CLK = 0;
    RST = 0;
    {REQ_2, REQ_1, REQ_0} = 3'b000;
    
    #15; {REQ_2, REQ_1, REQ_0} = 3'b001;
    #20; {REQ_2, REQ_1, REQ_0} = 3'b010;
    #20; {REQ_2, REQ_1, REQ_0} = 3'b011;
    #20; {REQ_2, REQ_1, REQ_0} = 3'b100;
    #20; {REQ_2, REQ_1, REQ_0} = 3'b101;
    #20; {REQ_2, REQ_1, REQ_0} = 3'b110;
    #20; {REQ_2, REQ_1, REQ_0} = 3'b111;
    #20  RST = 1;
    #20

    $display("test complete");
    $finish;
end

endmodule
