module out_section_f0 (
    input   m,
    input   ci,
    input   input0_out1,
    input   input0_out2,
    output  f0
);

assign f0 = ((input0_out1 ^ input0_out2) ^ ~(ci & m));

endmodule