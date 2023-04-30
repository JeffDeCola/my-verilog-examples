// A d flip-flop which is pulse-triggered can save input data on output.
// This has a race condition when clock is high.

module d_flip_flop (
    input         clk,        // Clock
    input         d,          // Data
    output        q1,         // Output 1
    output        q1_bar,     //
    output reg    q2,         // Output 2
    output        q2_bar,     //
    output reg    q3,         // Output 3
    output        q3_bar);    //

    // D FLIP-FLOP USING GATE LEVEL MODELING
    // THIS IS A LEVEL TRIGGERED FLIP FLIP, NOT A POSEDGE TRIGGERED FLIP FLOP
    wire d_bar;   // not output
    wire n1, n2;  // nand output
  
    not  not1  (d_bar,  d);
    nand nand1 (n1,     clk, d); 
    nand nand2 (n2,     clk, d_bar); 
    nand nand3 (q1,     n1,  q1_bar); 
    nand nand4 (q1_bar, n2,  q1); 

    // D FLIP-FLOP USING DATA-FLOW LEVEL MODELING


    // D FLIP-FLOP USING BEHAIVIORAL LEVEL MODELING
    assign q3_bar = ~q3; 
    always @ (posedge clk) begin
        q3 <= d;
    end
