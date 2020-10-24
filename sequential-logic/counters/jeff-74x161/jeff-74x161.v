// Synchronous presettable 4-bit binary counter, asynchronous clear
module jeff_74x161(
    input           clr,                 // ASYYNC CLEAR
    input           ld,                  // LOAD
    input           ent,                 // ENABLE T
    input           enp,                 // ENABLE P
    input           clk,                 // CLK
    input           a, b, c, d,          // DATA IN
    output          qa, qb, qc, qd,      // DATA OUT
    output          rco                  // RIPPLE CARRY OUTPUT
);

assign qa = 1'b1;              // ERASE
assign qb = 1'b1;              // ERASE
assign qc = 1'b1;              // ERASE
assign qd = 1'b1;              // ERASE
assign rco = 1'b1;             // ERASE

endmodule
