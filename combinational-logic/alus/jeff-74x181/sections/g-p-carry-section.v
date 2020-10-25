module g_p_carry_section (
    input   input3_out1,
    input   input3_out2,
    input   input2_out1,
    input   input2_out2,
    input   input1_out1,
    input   input1_out2,
    input   input0_out1,
    input   input0_out2,
    input   ci,
    output  co,
    output  p,
    output  g
);

assign g = ~((input3_out2) | (input3_out1 & input2_out2) | (input3_out1 & input2_out1 & input1_out2) | (input3_out1 & input2_out1 & input1_out1 & input0_out2));

assign co = (~(g) | (input3_out1 & input2_out1 & input1_out1 & input0_out1 & ci));

assign p = ~(input3_out1 & input2_out1 & input1_out1 & input0_out1);

endmodule