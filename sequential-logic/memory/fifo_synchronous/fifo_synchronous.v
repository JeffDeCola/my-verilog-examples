// A synchronous fifo.

module fifo_synchronous_behavioral(
    input  clk,             // Clock
    input  write,           // Write data
    input  [3:0] addr,      // Address
    input  [7:0] wdata,     // Data to write
    output [7:0] rdata);    // Read Data

    // DATA TYPES
    reg [7:0] mem [0:15];
    
    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk) begin

        // tbd

    end

endmodule