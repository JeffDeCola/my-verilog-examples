// Single-port synchronous RAM.

module single_port_ram_synchronous_behavioral(
    input  clk,                   // Clock
    input  we,                    // Write enable
    input  [3:0] addr,            // Address
    input  [7:0] data_in,         // Data to write
    output [7:0] data_out);       // Data to read

    // DATA TYPES
    reg [7:0] mem [0:15];         //RAM
    reg [3:0] address_register;

    // OUTPUT (THIS MAKES IT SYNCHRONOUS)
    assign data_out = mem[address_register];

    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data_in;
        end else begin
            address_register <= addr;
        end
    end

endmodule
