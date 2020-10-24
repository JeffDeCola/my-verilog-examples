// 8-bit register, clock enable
module jeff_74x377(
    input           en,                 // 
    input           clk,                //
    input           d0,                 // 
    input           d1,                 // 
    input           d2,                 // 
    input           d3,                 // 
    input           d4,                 // 
    input           d5,                 // 
    input           d6,                 // 
    input           d7,                 // 
    output          q0,                 // 
    output          q1,                 // 
    output          q2,                 // 
    output          q3,                 // 
    output          q4,                 // 
    output          q5,                 // 
    output          q6,                 // 
    output          q7                  //  
);

assign q0 = 1'b1;              // ERASE
assign q1 = 1'b1;              // ERASE
assign q2 = 1'b1;              // ERASE
assign q3 = 1'b1;              // ERASE
assign q4 = 1'b1;              // ERASE
assign q5 = 1'b1;              // ERASE
assign q6 = 1'b1;              // ERASE
assign q7 = 1'b1;              // ERASE

endmodule
