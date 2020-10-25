// 4-bit arithmetic logic unit and function generator
module jeff_74x181(
    input                a0,                  // 
    input                a1,                  // 
    input                a2,                  // 
    input                a3,                  // 
    input                b0,                  // 
    input                b1,                  // 
    input                b2,                  // 
    input                b3,                  // 
    input                s0,                  // 
    input                s1,                  // 
    input                s2,                  // 
    input                s3,                  //
    input                m,                   // 
    input                ci,                  // 
    output               f0,                  // 
    output               f1,                  // 
    output               f2,                  // 
    output               f3,                  // 
    output               co,                  // 
    output               aeqb,                // 
    output               p,                   // 
    output               g                   // 
);

assign f0 = 1'b1;              // ERASE
assign f1 = 1'b1;              // ERASE
assign f2 = 1'b1;              // ERASE
assign f3 = 1'b1;              // ERASE
assign co = 1'b1;              // ERASE
assign aeqb = 1'b1;            // ERASE
assign p = 1'b1;               // ERASE
assign g = 1'b1;               // ERASE

endmodule
