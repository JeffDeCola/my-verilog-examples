// Combining the mux-4x1 to the demux-1x4 to prove the input will equal
// the output (for the selected output).

module mux_to_demux(
    input           a_in, b_in, c_in, d_in,       // 4 Inputs
    input           [1:0] sel,                    // Select
    output          a_out, b_out, c_out, d_out    // 4 Outputs
);

    wire  y;

    // 4x1 MULTIPLEXER
    mux_4x1 MUX_4X1 (
        .a(a_in), .b(b_in), .c(c_in), .d(d_in),
        .sel(sel),
        .y(y)
    );

    // 1x4 DEMULTIPLEXER
    demux_1x4 DEMUX_1X4 (
        .y(y),
        .sel(sel),
        .a(a_out), .b(b_out), .c(c_out), .d(d_out)
    );

endmodule
