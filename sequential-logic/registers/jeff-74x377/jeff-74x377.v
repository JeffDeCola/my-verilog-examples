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
    input           q0,                 // 
    input           q1,                 // 
    input           q2,                 // 
    input           q3,                 // 
    input           q4,                 // 
    input           q5,                 // 
    input           q6,                 // 
    input           q7                  //  
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
