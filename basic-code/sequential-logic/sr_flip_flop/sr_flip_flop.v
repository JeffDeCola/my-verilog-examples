// A sr (set ready) flip-flop stores data on level of clock
// but can have an unknown output.

module sr_flip_flop (
    input       clk,        // Clock
    input       s,          // Set
    input       r,          // Reset
    output      q,          // Data Out
    output      qbar        // 
);

    // INTERNAL WIRES
    wire        s1, r1;

    // SR FLIP-FLOP ----------------------------------
  
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
