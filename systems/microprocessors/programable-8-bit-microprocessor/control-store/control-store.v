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

        // RESET - WAIT FOR GO ************************************************************************
        8'h00: begin // Branch to address OE
            ALU_DEST <= 3'b011; CIN <= 1'b0; ALU_FUNC <= 5'b10011; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b1110; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hE;
        end
        8'h0E: begin // ???????????
            ALU_DEST <= 3'b100; CIN <= 1'b0; ALU_FUNC <= 5'b11100; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0110; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end
        8'h0F: begin // ???????????
            ALU_DEST <= 3'b111; CIN <= 1'b0; ALU_FUNC <= 5'b10011; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0100; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hF;
        end
        8'h10: begin // ???????????
            ALU_DEST <= 3'b111; CIN <= 1'b0; ALU_FUNC <= 5'b10011; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h1;
        end

        // OPCODE 0000 *********************************************************************************
        8'h01: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b01011; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0001 *********************************************************************************
        8'h11: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b01011; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0010 *********************************************************************************
        8'h21: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0011 - ADD **************************************************************************
        8'h31: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0100 *********************************************************************************
        8'h41: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0101 *********************************************************************************
        8'h51: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0110 *********************************************************************************
        8'h61: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 0111 - SUBTRACT **********************************************************************
        8'h71: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1000 *********************************************************************************
        8'h81: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1001 *********************************************************************************
        8'h91: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1010 *********************************************************************************
        8'hA1: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1011 *********************************************************************************
        8'hB1: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1100 *********************************************************************************
        8'hC1: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1101 *********************************************************************************
        8'hD1: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1110 *********************************************************************************
        8'hE1: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        // OPCODE 1111 *********************************************************************************
        8'hF1: begin
            ALU_DEST <= 3'b000; CIN <= 1'b0; ALU_FUNC <= 5'b00000; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b0000; COUNT <= 1'b0; MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;
        end

        default: begin
            ALU_DEST <= 3'b001; CIN <= 1'b1; ALU_FUNC <= 5'b01111; B_SOURCE <= 1'b0; A_SOURCE<= 1'b0;
            BOP <= 4'b1111; COUNT <= 1'b1; MICRO_AD_HIGH <= 4'b1010; MICRO_AD_LOW <= 4'b0101;
        end

    endcase
end

endmodule
