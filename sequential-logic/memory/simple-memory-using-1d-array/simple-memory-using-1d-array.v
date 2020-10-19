// Simple memory using 1D array. 16byte RAM
module simple_memory_using_1d_array(
    input  clk,             // Clock
    input  rst,             // Reset memory to 0
    input  write,           // Write data
    input  [3:0] addr,      // Address
    input  [7:0] wdata,     // Data to write
    output [7:0] rdata      // Read Data
);

// DATA TYPES
reg [7:0] mem [0:15];
integer i;

assign rdata = mem[addr];

always @ (posedge clk) begin
    if (rst) begin
        // RESET MEMORY TO 0
        for (i = 0; i < 15; i = i+1) begin
            mem[i] <= 0;
        end
    end if (write) begin
        // WRITE DATA TO ADDR
        mem[addr] <= wdata;
    end
end

endmodule
