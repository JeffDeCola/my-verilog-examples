// Decoder - Three inputs decodes to 1 of 8 outputs (hot).

module decoder_3_8(
    input       [2:0] in,       // 3 Input
    output  reg [7:0] out       // 7 Outputs
);

    // DECODER
    always @ ( * ) begin
        case (in)
            3'b000 : out <= 8'b00000001;
            3'b001 : out <= 8'b00000010;
            3'b010 : out <= 8'b00000100;
            3'b011 : out <= 8'b00001000;
            3'b100 : out <= 8'b00010000;
            3'b101 : out <= 8'b00100000;
            3'b110 : out <= 8'b01000000;
            3'b111 : out <= 8'b10000000;
        endcase
    end

endmodule
