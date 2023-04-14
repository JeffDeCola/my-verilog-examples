// A sr (set ready) latch stores data but output changes on input.

module sr_latch (
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

    // DATA-FLOW MODELING
    // NAND1
    // assign q = ~(s & qbar);

    // NAND2
    // assign qbar = ~(r & q);

endmodule
