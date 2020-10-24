// 8-bit microprocessor nand4
// 4 input NAND
// THIS WAS A SOFT MACRO IN MY THESIS - BUT I WILL DESCRIBE IT HERE

module nand4(
    input           A,                  // 
    input           B,                  // 
    input           C,                  //
    input           D,                  //
    output          Y                   // 
);
 
reg Y;

// 4-bit NAND
always @ ( * ) begin
        Y <= ~(A & B & C & D);
end

endmodule