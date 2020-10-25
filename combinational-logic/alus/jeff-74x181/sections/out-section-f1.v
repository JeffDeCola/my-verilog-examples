module out_section_f1 (
    input   m,
    input   ci,
    input   input1_out1,
    input   input1_out2,
    input   input0_out1,
    input   input0_out2,
    output   f1
);

assign f1 = ((input1_out1 ^ input1_out2) ^ ~((ci & input0_out1 & m) | (input0_out2 & m)));

endmodule
