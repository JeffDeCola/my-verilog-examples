// A simple 16 Byte memory modeled using a 1D array.

module simple_memory_using_1d_array(
    input  clk,             // Clock
    input  write,           // Write data
    input  [3:0] addr,      // Address
    input  [7:0] wdata,     // Data to write
    output [7:0] rdata      // Read Data
);

    // DATA TYPES
    reg [7:0] mem [0:15];

    assign rdata = mem[addr];

    // MEMORY
    always @ (posedge clk) begin
        if (write) begin
            // WRITE DATA TO ADDR
            mem[addr] <= wdata;
        end
    end

endmodule
