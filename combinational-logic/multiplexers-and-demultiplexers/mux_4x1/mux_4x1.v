// Multiplexer - Four inputs, one output (using a case statement).

module mux_4x1(
    input       a, b, c, d,      // 4 Inputs
    input       [1:0] sel,       // Select
    output reg  y                // 1 Output
);

    // MULTIPLEXER
    always @ ( * ) begin
        case(sel)
            2'b00 : y <= a;
            2'b01 : y <= b;
            2'b10 : y <= c;
            2'b11 : y <= d;
        endcase
    end

endmodule
