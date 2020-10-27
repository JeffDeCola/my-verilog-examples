// Quad 2-line to 1-line data selector/multiplexer, non-inverting outputs
module jeff_74x157(
    input [3:0]          a,                  // INPUT DATA A
    input [3:0]          b,                  // INPUT DATA B
    input                s,                  // SELECT
    input                en,                 // ENABLE
    output [3:0]         y                   // OUTPUT DATA
);

reg [3:0] y;

// 2x1 multiplexer
always @ ( * ) begin
    if (en) begin
        y <= 4'h0;
    end else begin
        case(s)
            1'b0 : y <= a;
            1'b1 : y <= b;
        endcase
    end
end

endmodule
