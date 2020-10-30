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
reg [23:21]      ALU_DEST;           // [23:21]

assign control_bits = {ALU_DEST, CIN, ALU_FUNC, B_SOURCE, A_SOURCE};
assign microword = {control_bits, BOP, COUNT, MICRO_AD_HIGH, MICRO_AD_LOW};

always @ (microaddress) begin
    case (microaddress)

        // 8'h00 - RESET - WAIT FOR GO ************************************************************************
        8'h00: begin // START RESET - Flash 11 output
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hC;        // OC - Branch to 8'h0C
        end
        8'h0C: begin // COUNT - Flash 00 output
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b10011;                               // O
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'h0D: begin // WAIT FOR GO_BAR - Output is F's  
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b0100;                                     // G0_BAR (Will increment to next address)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD - Branch to 8'h0D (Loop)
        end
        8'h0E: begin // GET OPCODE
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b1111;                                     // OPCODE
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD (DEFAULT)
            MICRO_AD_HIGH <= 4'hF; MICRO_AD_LOW <= 4'h1;        // X1 - The opcode will be the high
        end

        // 8'h01 - OPCODE 0000 *********************************************************************************

        // 8'h11 - OPCODE 0001 *********************************************************************************

        // 8'h21 - OPCODE 0010 ********************************************************************************

        // 8'h31 - OPCODE 0011 - ADD **************************************************************************
        8'h31: begin // ADD AND WAIT FOR GO TO RELEASE - THEN RESET
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b01001;                               // A_PLUS_B
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b0110;                                     // COUNT (DEFAULT)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // XX
        end
        8'h32: begin // WAIT FOR GO TO BE RELEASED
            ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B
            BOP <= 4'b1100;                                     // !GO_BAR (Will increment to next address)
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h3; MICRO_AD_LOW <= 4'h2;        // 32 - Branch to 8'h32 (Loop)
        end
        8'h33: begin // GOTO RESET
            ALU_DEST <= 3'b111;                                 // NONE (DEFAULT) 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'hD;        // OD - Branch to 8'h00 (TO RESET AGAIN)
        end

        // 8'h41 - OPCODE 0100 *********************************************************************************

        // 8'h51 - OPCODE 0101 *********************************************************************************

        // 8'h61 - OPCODE 0110 *********************************************************************************

        // 8'h71 - OPCODE 0111 - SUBTRACT **********************************************************************
        8'h71: begin // 
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // M=1 LOGIC - 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // 00 - Branch to 8'h00
        end

        // 8'h81 - OPCODE 1000 *********************************************************************************

        // 8'h91 - OPCODE 1001 *********************************************************************************

        // 8'hA1 - OPCODE 1010 *********************************************************************************

        // 8'hB1 - OPCODE 1011 *********************************************************************************

        // 8'hC1 - OPCODE 1100 *********************************************************************************

        // 8'hD1 - OPCODE 1101 *********************************************************************************

        // 8'hE1 - OPCODE 1110 *********************************************************************************

        // 8'hF1 - OPCODE 1111 *********************************************************************************

        // DEFAULT **************************************************************************************
        default: begin // KICK BACK TO RESET
            ALU_DEST <= 3'b011;                                 // F 
            CIN <= 1'b0;                                        // NO_CARRY (DEFAULT)
            ALU_FUNC <= 5'b11100;                               // 1 (DEFAULT)
            B_SOURCE <= 1'b1; A_SOURCE<= 1'b1;                  // INPUT_A, INPUT_B 
            BOP <= 4'b1110;                                     // BRANCH
            COUNT <= 1'b1;                                      // COUNT_IF_NO_LD
            MICRO_AD_HIGH <= 4'h0; MICRO_AD_LOW <= 4'h0;        // 00 - Branch to 8'h00
        end

    endcase
end

endmodule
