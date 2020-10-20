// 1x4 demultiplexer
module demux_1x4(
    input  y,               // 1 Input
    input  [1:0] sel,       // Select
    output a, b, c, d       // 4 Outputs
);

reg  a, b, c, d;

always @ ( * ) begin
    case(sel)
        2'b00 : begin
            a <= y; b <= 0; c <= 0; d <= 0;
        end
        2'b01 : begin
            a <= 0; b <= y; c <= 0; d <= 0;
        end
        2'b10 : begin
            a <= 0; b <= 0; c <= y; d <= 0;
        end
        2'b11 : begin
            a <= 0; b <= 0; c <= 0; d <= y;
        end
    endcase
end

endmodule
