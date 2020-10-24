// Synchronous presettable 4-bit binary counter, asynchronous clear
module jeff_74x161(
    input           CLR,                 // ASYYNC CLEAR
    input           LD,                  // LOAD
    input           ENT,                 // ENABLE T
    input           ENP,                 // ENABLE P
    input           CLK,                 // CLK
    input           A, B, C, D,          // DATA IN
    output          QA, QB, QC, QD,      // DATA OUT
    output          RC0                  // RIPPLE CARRY OUTPUT
);

assign QA = 1'b1;              // ERASE
assign QB = 1'b1;              // ERASE
assign QC = 1'b1;              // ERASE
assign QD = 1'b1;              // ERASE
assign RCO = 1'b1;             // ERASE

endmodule
