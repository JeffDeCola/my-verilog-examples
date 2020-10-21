// 8-bit microprocessor alu
// 8-bit alu

module alu (
    input  [7:0]    IN_A,               // 
    input  [7:0]    IN_B,               // 
    input           CIN,                //
    input  [19:15]  ALU_FUNC,           //
    output [7:0]    OUT8,               //
    output          C4,                 // 
    output          C8,                 // 
    output          Z                   // 
);

assign OUT8 = 8'hf0;            // ERASE
assign C4 = 1'b1;               // ERASE
assign C8 = 1'b1;               // ERASE
assign Z = 1'b1;                // ERASE

endmodule
