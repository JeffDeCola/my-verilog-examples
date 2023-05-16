// Dual-port asynchronous RAM using two different clocks.

module dual_port_ram_asynchronous_behavioral(
    input  clk_A, clk_B,                    // Clocks
    input  we_A, we_B,                      // Write enable
    input  [3:0] addr_A, addr_B,            // Address
    input  [7:0] data_in_A, data_in_B,      // Data to write
    output [7:0] data_out_A, data_out_B);   // Data to read

    // DATA TYPES
    reg [7:0] mem [0:15];
    reg [3:0] address_register_A, address_register_B;

    // OUTPUT (THIS MAKES IT SYNCHRONOUS)
    assign data_out_A = mem[address_register_A];
    assign data_out_B = mem[address_register_B];

    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk_A) begin
        if (we_A) begin
            mem[addr_A] <= data_in_A;
        end else begin
            address_register_A <= addr_A;
        end
    end

    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk_B) begin
        if (we_B) begin
            mem[addr_B] <= data_in_B;
        end else begin
            address_register_B <= addr_B;
        end
    end

endmodule
