// A sr (set ready) flip-flop stores data on level of clock
// but can have an unknown output.

module sr_flip_flop (
    input       clk,        // Clock
    input       s,          // Set
    input       r,          // Reset
    input       q,          // Data Out
    output      qbar        // 
);

    // GATE LEVEL MODELING

    // NAND1
    nand (q, s, qbar);

    // NAND2
    nand (qbar, r, q);

    // NAND3
    nand (s, s, qbar);

    // NAND4
    nand (r, r, q);

endmodule
