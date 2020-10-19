`timescale 1ns / 1ns
`include "simple-memory-using-1d-array.v"

module simple_memory_using_1d_array_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  CLK, RST;
reg  WRITE;
reg  [3:0]ADDR;
reg  [7:0] WDATA;
wire [7:0] RDATA;

// UUT
simple_memory_using_1d_array uut(
    .clk(CLK), .rst(RST),
    .write(WRITE),
    .addr(ADDR),
    .wdata(WDATA),
    .rdata(RDATA)
);

// FILES
initial begin
    $dumpfile("simple-memory-using-1d-array-tb.vcd");
    $dumpvars(0, simple_memory_using_1d_array_tb);
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
    WRITE = 0;
    ADDR = 4'h7;
    WDATA = 8'h00;

    // Sync Reset
    #15;
    RST = 1;
    #20;
    RST = 0;

    // Write data 22 hex to address 3
    #20;
    WRITE = 1;
    WDATA = 8'h22;
    ADDR = 4'h3;

    // Write data 33 hex to address 7
    #20;
    WRITE = 1;
    WDATA = 8'h33;
    ADDR = 4'h7;

    // Read address 2
    #20;
    WRITE = 0;
    ADDR = 4'h2;

    // Read address 3
    #20;
    WRITE = 0;
    ADDR = 4'h3;

    // Sync Reset
    #15;
    RST = 1;
    #20;
    RST = 0;

    // Read address 7
    #20;
    WRITE = 0;
    ADDR = 4'h7;

    #20;

    $display("test complete");
    $finish;
end

endmodule