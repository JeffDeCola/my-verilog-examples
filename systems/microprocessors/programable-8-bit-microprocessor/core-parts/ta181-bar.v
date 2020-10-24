// 8-bit microprocessor ta151_bar
// ??????? r - Written above SOFT MACRO (text in thesis)
// UPDATE FROM THESIS
//   Replaced ta181 in THESIS with jeff_74x181
//   ???

module ta181_bar(
    input           D0,                 // 
    input           D1,                 // 
    input           D2,                 // 
    input           D3,                 // 
    input           D4,                 // 
    input           D5,                 // 
    input           D6,                 // 
    input           D7,                 //
    input           A,                  // 
    input           B,                  // 
    input           C,                  // 
    input           EN_BAR,             // 
    output          Y,                  // 
    output          W                   // 
);

assign EN = ~EN_BAR;

// 8-line to 1-line data selector/multiplexer
// Replaced ta151 in THESIS with jeff_74x151
jeff_74x181 U1 (
    .d0(D0),
    .d1(D1),
    .d2(D2),
    .d3(D3),
    .d4(D4),
    .d5(D5),
    .d6(D6),
    .d7(D7),
    .a(A),
    .b(B),
    .c(C),
    .en(EN),
    .y(Y),
    .w(W)
);

endmodule