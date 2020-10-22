// 8-bit microprocessor control store
// Where the microcode is kept.
// 256 microwords (24-bits wide).

module control_store(
    input  [7:0]    microaddress,    // ADDRESS
    output [23:0]   microword        // WORD
);

// THE MICROWORD FIELDS
reg [3:0]     MICRO_AD_LOW;          // [3:0]
reg [7:4]     MICRO_AD_HIGH;         // [7:4]
reg           COUNT;                 // [8]
reg [12:9]    BOP;                   // [12:9]
wire [23:11]  control_bits;
reg              A_SOURCE;           // [13]
reg              B_SOURCE;           // [14]
reg [19:15]      ALU_FUNC;           // [19:15]
reg              CIN;                // [20]
reg [23:21]      ALU_DEST;           // [32:21]

assign control_bits = {ALU_DEST, CIN, ALU_FUNC, B_SOURCE, A_SOURCE};
assign microword = {control_bits, BOP, COUNT, MICRO_AD_HIGH, MICRO_AD_LOW};

always @ (microaddress) begin
    case (microaddress)
        8'h00: begin
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b1111; MICRO_AD_LOW <= 4'b0111;
            ALU_DEST <= 3'b111; CIN <= 1'b1; ALU_FUNC <= 5'b11111; B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;
        end
        8'h01: begin
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b1111; MICRO_AD_LOW <= 4'b0111;
            ALU_DEST <= 3'b111; CIN <= 1'b1; ALU_FUNC <= 5'b11111; B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;
        end
        8'h02: begin
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b1111; MICRO_AD_LOW <= 4'b0111;
            ALU_DEST <= 3'b111; CIN <= 1'b1; ALU_FUNC <= 5'b11111; B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;
        end
        8'h03: begin
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b1111; MICRO_AD_LOW <= 4'b0111;
            ALU_DEST <= 3'b111; CIN <= 1'b1; ALU_FUNC <= 5'b11111; B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;
        end
        8'h04: begin
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b0011; MICRO_AD_LOW <= 4'b0111;
            ALU_DEST <= 3'b111; CIN <= 1'b1; ALU_FUNC <= 5'b11111; B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;
        end
        default: begin
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b1111; MICRO_AD_LOW <= 4'b0111;
            ALU_DEST <= 3'b111; CIN <= 1'b1; ALU_FUNC <= 5'b11111; B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;
        end
    endcase
end

endmodule
