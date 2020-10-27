// Synchronous presettable 4-bit binary counter, asynchronous clear
module jeff_74x161(
    input           clr,                 // ASYNC CLEAR
    input           ld,                  // LOAD
    input           ent,                 // ENABLE T
    input           enp,                 // ENABLE P
    input           clk,                 // CLK
    input           a, b, c, d,          // DATA IN
    output          qa, qb, qc, qd,      // DATA OUT
    output          rco                  // RIPPLE CARRY OUTPUT
);

endmodule
