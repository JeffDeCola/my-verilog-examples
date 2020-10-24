// 8-bit microprocessor ta157
// 2x1 multiplexer with enable
// THIS WAS A SOFT MACRO IN MY THESIS - BUT I WILL DESCRIBE IT HERE

module ta157(
    input           A,                  // 
    input           B,                  // 
    input           S,                  //
    input           EN,                 //
    output          Y                   // 
);

reg Y;

// 2x1 multiplexer
always @ ( * ) begin
    if (EN) begin
        Y <= 1'b1;
    end else begin
        case(S)
            2'b00 : Y <= A;
            2'b01 : Y <= B;
        endcase
    end
end

endmodule
