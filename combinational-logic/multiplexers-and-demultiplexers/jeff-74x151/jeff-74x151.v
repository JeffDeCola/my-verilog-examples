// 8-line to 1-line data selector/multiplexer
module jeff_74x151(
    input                d0,                  // 
    input                d1,                  // 
    input                d2,                  // 
    input                d3,                  // 
    input                d4,                  // 
    input                d5,                  // 
    input                d6,                  // 
    input                d7,                  // 
    input                a,                  // 
    input                b,                  // 
    input                c,                  // 
    input                en,                 //
    output               y,                   // 
    output               w                   // 
);

assign y = 1'b1;              // ERASE
assign w = 1'b1;              // ERASE

endmodule
