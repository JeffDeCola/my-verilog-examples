// 8-bit microprocessor register_ab8
// The registers used for temporary storage

module register_ab8(
    input [7:0]     DATA_IN,            // 
    input           SYSTEM_CLK,         // 
    input           ENABLE_CLK,         // 
    output [7:0]    DATA_OUT            // 
);

assign DATA_OUT = 8'hf0;             // ERASE

endmodule