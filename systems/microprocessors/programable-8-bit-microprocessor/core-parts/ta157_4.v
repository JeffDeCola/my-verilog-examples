// 8-bit microprocessor ta157_4
// Four (2x1) multiplexers

module ta157_4(
    input  [3:0]    A4,                 // 
    input  [3:0]    B4,                 // 
    input           S,                  //
    input           EN_BAR,             //
    output [3:0]    Y4                  // 
);


// BIT 0 - 2x1 multiplexers
ta157_bar MUX0 (
    .A(A4[0]),
    .B(B4[0]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y4[0])
);

// BIT 1 - 2x1 multiplexers
ta157_bar MUX1 (
    .A(A4[1]),
    .B(B4[1]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y4[1])
);

// BIT 2 - 2x1 multiplexers
ta157_bar MUX2 (
    .A(A4[2]),
    .B(B4[2]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y4[2])
);

// BIT 3 - 2x1 multiplexers
ta157_bar MUX3 (
    .A(A4[3]),
    .B(B4[3]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y4[3])
);

endmodule