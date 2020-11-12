// decoder to encoder

module decoder_to_encoder(
    input  [2:0] in,      // 3 Inputs
    output  [2:0] out      // 3 Outputs
);

wire  [7:0] connect;

decoder_3_8 DECODER_3_8 (
    .in(in),
    .out(connect)
);

encoder_8_3 ENCODER_8_3 (
    .in(connect),
    .out(out)
);

endmodule
