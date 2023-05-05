// Combining the decoder-3-8 to the encoder-8-3 to prove the input will equal the output.

module decoder_to_encoder_structural(
    input     [2:0] in,      // 3 Inputs
    output    [2:0] out      // 3 Outputs
);

    wire [7:0] connect;

    // DECODER
    decoder_3_8_behavioral decoder_3_8 (
        .in(in),
        .out(connect)
    );

    // ENCODER
    encoder_8_3_behavioral encoder_8_3 (
        .in(connect),
        .out(out)
    );

endmodule
