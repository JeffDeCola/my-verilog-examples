// 8-bit microprocessor ta161_bar
// 4-bit synchronous counter

module ta161_bar (
    input           CLR_BAR,             // CLEAR
    input           LD_BAR,              // LOAD
    input           ENT,                 // ENABLE T
    input           ENP,                 // ENABLE P
    input           CLK,                 // CLK 
    input           A, B, C, D,          // DATA IN
    output          QA, QB, QC, QD,      // DATA OUT
    output          RC0                  // RIPPLE CARRY OUTPUT
);

// 4-bit synchronous counter
ta161 U1 (
    .CLR(CLR_BAR),
    .LD(LD_BAR),
    .ENT(ENT),
    .ENP(ENP),
    .CLK(SYSTEM_CLK),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .QA(QA),
    .QB(QB),
    .QC(QC),
    .QD(QD),
    .RC0(RC0)
);

endmodule