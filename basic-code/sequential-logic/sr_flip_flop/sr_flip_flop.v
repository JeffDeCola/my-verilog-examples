// A sr (set ready) flip-flop stores data on level of clock
// but can have an unknown output.

module sr_flip_flop_gate (
    input       clk,        // Clock
    input       s,          // Inputs
    input       r,          // 
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s1, r1;

    // JK FLIP-FLOP ----------------------------------
  
    // NAND3
    nand (s1, s, clk);

    // NAND4
    nand (r1, r, clk);

    // SR- LATCH -------------------------------------
    
    // NAND1
    nand (q, s1, qbar);

    // NAND2
    nand (qbar, r1, q);

endmodule

module sr_flip_flop_dataflow (
    input       clk,        // Clock
    input       s,          // Inputs
    input       r,          // 
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s1, r1;

    // JK FLIP-FLOP ----------------------------------
  
    // NAND3
    assign s1 = ~(s & clk);

    // NAND4
    assign r1 = ~(r & clk);

    // SR- LATCH -------------------------------------
    
    // NAND1
    assign q = ~(s1 & qbar);

    // NAND2
    assign qbar = ~(r1 & q);

endmodule

module sr_flip_flop_behavioral (
    input       clk,        // Clock
    input       s,          // Inputs
    input       r,          // 
    output reg  q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({s,r})
            2'b0_0 : q <= q;
            2'b0_1 : q <= 1'b0;
            2'b1_0 : q <= 1'b1;
            2'b1_1 : q <= 1'bx;
        endcase
    end

endmodule
