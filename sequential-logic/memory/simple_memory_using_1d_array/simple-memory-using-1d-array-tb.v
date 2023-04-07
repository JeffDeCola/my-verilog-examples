`timescale 1ns / 1ns

// include files in simple-memory-using-1d-array-headerfiles.vh

module simple_memory_using_1d_array_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  CLK;
reg  WRITE;
reg  [3:0] ADDR;
reg  [7:0] WDATA;
wire [7:0] RDATA;
integer i;

// UUT
simple_memory_using_1d_array uut(
    .clk(CLK),
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
    WRITE = 0;
    ADDR = 4'h0;
    WDATA = 8'h00;

    // REST ALL MEMORY TO 0
    #15;
    WRITE = 1;
    for (i = 0; i < 16; i = i+1) begin
        ADDR = i;
        #20;
    end

    // STOP WRITING
    WRITE = 0;
    #20

    // Check address 4 that is 0
    #20;
    ADDR = 4'h4;

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

    // Read address 7
    #20;
    WRITE = 0;
    ADDR = 4'h7;

    #20;

    $display("test complete");
    $finish;
end

endmodule