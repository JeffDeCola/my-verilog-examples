// 8-bit microprocessor ta157_bar
// 2x1 multiplexer

module ta157_bar(
    input           A,                  // 
    input           B,                  // 
    input           S,                  //
    input           EN_BAR,             //
    output          Y                   // 
);

// 2x1 multiplexer
ta157 U1 (
    .A(A),
    .B(B),
    .S(S),
    .EN(EN_BAR),
    .Y(Y)
);

endmodule