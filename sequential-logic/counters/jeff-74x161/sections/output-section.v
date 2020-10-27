// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
//`include "../../../basic-code/sequential-logic/jk-flip-flop/jk-flip-flop.v"

module output_section (
    input  clr_bar,
    input  ld_or_clr,
    input  feedback,
    input  clk,
    input  data,
    output q
);

// reg q;
wire NOTHING;

assign to_j_and_k = (feedback | ld_or_clr);

assign to_j = (ld_or_clr & to_k);
assign to_k = (data & clr_bar & ld_or_clr);
 
assign j = (to_j & to_j_and_k);
assign k = (to_k & to_j_and_k);

jk_flip_flop JK (
    .clk(clk),       
    .clr_bar(clr_bar),   
    .j(j),        
    .k(k),        
    .q(q),    
    .q_bar(NOTHING)     
);

endmodule





