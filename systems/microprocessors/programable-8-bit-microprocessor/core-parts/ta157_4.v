// 8-bit microprocessor ta157_4
// Four (2x1) multiplexers

module ta157_4(
    input  [3:0]    A4,                 // 
    input  [3:0]    B4,                 // 
    input           S,                  //
    input           EN_BAR,             //
    output [4:0]    Y4                  // 
);

assign Y4 = 4'h3;             // ERASE

endmodule