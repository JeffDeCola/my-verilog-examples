// 8-bit microprocessor ta157_8
// Eight (2x1) multiplexers

module ta157_8(
    input  [7:0]    A8,                 // 
    input  [7:0]    B8,                 // 
    input           S,                  //
    input           EN_BAR,             //
    output [7:0]    Y8                  // 
);

assign Y8 = 8'h04;             // ERASE

endmodule