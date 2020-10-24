// 8-bit microprocessor ta157_8
// Eight (2x1) multiplexers

module ta157_8(
    input  [7:0]    A8,                 // 
    input  [7:0]    B8,                 // 
    input           S,                  //
    input           EN_BAR,             //
    output [7:0]    Y8                  // 
);

// BIT 0 - 2x1 multiplexers
ta157_bar MUX0 (
    .A(A8[0]),
    .B(B8[0]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[0])
);

// BIT 1 - 2x1 multiplexers
ta157_bar MUX1 (
    .A(A8[1]),
    .B(B8[1]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[1])
);

// BIT 2 - 2x1 multiplexers
ta157_bar MUX2 (
    .A(A8[2]),
    .B(B8[2]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[2])
);

// BIT 3 - 2x1 multiplexers
ta157_bar MUX3 (
    .A(A8[3]),
    .B(B8[3]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[3])
);

// BIT 4 - 2x1 multiplexers
ta157_bar MUX4 (
    .A(A8[4]),
    .B(B8[4]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[4])
);

// BIT 5 - 2x1 multiplexers
ta157_bar MUX5 (
    .A(A8[5]),
    .B(B8[5]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[5])
);

// BIT 6 - 2x1 multiplexers
ta157_bar MUX6 (
    .A(A8[6]),
    .B(B8[6]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[6])
);

// BIT 7 - 2x1 multiplexers
ta157_bar MUX7 (
    .A(A8[7]),
    .B(B8[7]),
    .S(S),
    .EN_BAR(EN_BAR),
    .Y(Y8[7])
);

endmodule