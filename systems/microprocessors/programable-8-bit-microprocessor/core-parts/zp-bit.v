// 8-bit microprocessor zp_bit
// ZP status bit

module zp_bit (
    input  [7:0]    F8,                 // 
    output          ZP_BAR              // 
);

assign ZP_BAR = 1'b1;              // ERASE

endmodule