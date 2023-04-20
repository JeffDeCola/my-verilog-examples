// A jk flip-flop stores data on level of clock
// but can have an unknown output.

module jk_flip_flop_gate (
    input       clk,        // Clock
    input       j,          // Inputs
    input       k,          // 
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s, r;

    // JK FLIP-FLOP ----------------------------------
  
    // NAND3
    nand (s, j, clk, qbar);

    // NAND4
    nand (r, k, clk, q);

    // SR- LATCH -------------------------------------
    
    // NAND1
    nand (q, s, qbar);

    // NAND2
    nand (qbar, r, q);

endmodule

module jk_flip_flop_dataflow (
    input       clk,        // Clock
    input       j,          // Inputs
    input       k,          // 
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s, r;

    // JK FLIP-FLOP ----------------------------------
  
    // NAND3
    assign s = ~(j & clk & qbar);

    // NAND4
    assign r = ~(k & clk & q);

    // SR- LATCH -------------------------------------
    
    // NAND1
    assign q = ~(s & qbar);

    // NAND2
    assign qbar = ~(r & q);

endmodule

module jk_flip_flop_behavioral (
    input       clk,        // Clock
    input       j,          // Inputs
    input       k,          // 
    output reg  q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({j,k})
            2'b0_0 : q <= q;
            2'b0_1 : q <= 1'b0;
            2'b1_0 : q <= 1'b1;
            2'b1_1 : q <= ~q;
        endcase
    end

endmodule