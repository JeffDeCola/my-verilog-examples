// 8-bit microprocessor ta151_bar
// 8 to 1 multiplexer - Written above SOFT MACRO (text in thesis)

module ta151_bar(
    input           D0,                 // 
    input           D1,                 // 
    input           D2,                 // 
    input           D3,                 // 
    input           D4,                 // 
    input           D5,                 // 
    input           D6,                 // 
    input           D7,                 //
    input           A,                  // 
    input           B,                  // 
    input           C,                  // 
    input           EN_BAR,             // 
    output          Y,                  // 
    output          W                   // 
);

assign Y = 1'b1;            // ERASE
assign W = 1'b1;            // ERASE

endmodule