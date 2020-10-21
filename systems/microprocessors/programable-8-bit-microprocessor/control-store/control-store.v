// 8-bit microprocessor control store
// Where the microcode is kept.
// 256 address space of 24-bits.

module control_store(
    input  [7:0]    microaddress,       //
    output [23:0]   microword           //
);

reg [23:0] microword;

always @ (microaddress) begin
    case (microaddress)
        8'h00:   microword <= 24'b000000000000000000001111;
        8'hff:   microword <= 24'b000000000000001100001111;
        default: microword <= 24'b000000000000000000000000;
    endcase
end

endmodule
