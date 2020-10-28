// 8-bit microprocessor control store
// Where the microcode is kept.
// 256 microwords (24-bits wide).

module control_store (
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
        // OPCODE 0000
        8'h00: begin
            BOP <= 4'b1010; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b1010; MICRO_AD_LOW <= 4'b0101;
            ALU_DEST <= 3'b001; CIN <= 1'b1; ALU_FUNC <= 5'b01111; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0001 - ADD
        8'h10: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b01011; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0010
        8'h20: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0011
        8'h30: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0100
        8'h40: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0101
        8'h50: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0110
        8'h60: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 0111
        8'h70: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1000
        8'h80: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1001
        8'h90: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1010
        8'hA0: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1011
        8'hB0: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1100
        8'hC0: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1101
        8'hD0: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1110
        8'hE0: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        // OPCODE 1111
        8'hF0: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
        default: begin
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'b0000; MICRO_AD_LOW <= 4'b0000;
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
        end
    endcase
end

endmodule
