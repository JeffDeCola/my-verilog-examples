// 4x1 multiplexer
module encoder_8_3(
    input  [7:0] in,    // 8 Inputs
    output [2:0] out    // 3 Output
);

reg  [2:0];

always @ ( * ) begin
    case(in)
        3'b000 : out <= 3'b001;
        3'b001 : out <= b;
        3'b010 : out <= c;
        3'b011 : out <= d;
    endcase
 end

endmodule
