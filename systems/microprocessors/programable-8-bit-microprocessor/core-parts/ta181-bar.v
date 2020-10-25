// 8-bit microprocessor ta181_bar
// 4-bit arithmetic logic unit and function generator
// Written above SOFT MACRO (text in thesis)
// UPDATE FROM THESIS
//   Replaced ta181 in THESIS with jeff_74x181
//   4-bit arithmetic logic unit and function generator

module ta181_bar(
    input           A3_BAR, A2_BAR, A1_BAR, A0_BAR,     // 
    input           B3_BAR, B2_BAR, B1_BAR, B0_BAR,     // 
    input           S3, S2, S1, S0,                     // 
    input           M,                                  // 
    input           CI,                                 // 
    output          F3_BAR, F2_BAR, F1_BAR, F0_BAR,     // 
    output          CO,                                 // 
    output          AEQB,                               // 
    output          P_BAR,                              //
    output          G_BAR                               // 
);

// WIRES
wire A0_SIG, A1_SIG, A2_SIG, A3_SIG;
wire B0_SIG, B1_SIG, B2_SIG, B3_SIG;
wire F0_SIG, F1_SIG, F2_SIG, F3_SIG;

// 4-bit arithmetic logic unit and function generator
// Replaced ta181 in THESIS with jeff_74x181
jeff_74x181 U1 (
    .a3(A3_SIG),
    .a2(A2_SIG),
    .a1(A1_SIG),
    .a0(A0_SIG),
    .b3(B3_SIG),
    .b2(B2_SIG),
    .b1(B1_SIG),
    .b0(B0_SIG),
    .s3(S3_SIG),
    .s2(S2_SIG),
    .s1(S1_SIG),
    .s0(S0_SIG),
    .m(M),
    .ci(CI),
    .f3(F3_SIG),
    .f2(F2_SIG),
    .f1(F1_SIG),
    .f0(F0_SIG),
    .co(CO),
    .aeqb(AEQB),
    .p(P_BAR),
    .g(G_BAR)
);

not1 INV1 (.a(A3_BAR), .y(A3_SIG));
not1 INV2 (.a(A2_BAR), .y(A2_SIG));
not1 INV3 (.a(A1_BAR), .y(A1_SIG));
not1 INV4 (.a(A0_BAR), .y(A0_SIG));
not1 INV5 (.a(B3_BAR), .y(B3_SIG));
not1 INV6 (.a(B2_BAR), .y(B2_SIG));
not1 INV7 (.a(B1_BAR), .y(B1_SIG));
not1 INV8 (.a(B0_BAR), .y(B0_SIG));
not1 INV9 (.a(F3_BAR), .y(F3_SIG));
not1 INV10 (.a(F2_BAR), .y(F2_SIG));
not1 INV11 (.a(F1_BAR), .y(F1_SIG));
not1 INV12 (.a(F0_BAR), .y(F0_SIG));

endmodule