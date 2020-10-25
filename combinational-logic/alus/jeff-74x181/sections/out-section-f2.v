module out_section_f2 (
    input   m,
    input   ci,
    input   input2_out1,
    input   input2_out2,
    input   input1_out1,
    input   input1_out2,
    input   input0_out1,
    input   input0_out2,
    output  f2
);

assign f2 = ((input2_out1 ^ input2_out2) ^ ~((ci & input0_out1 &  input1_out1 &  m) | (input1_out1 &  input0_out2 &  m) | (input2_out2 &  m)));

endmodule
