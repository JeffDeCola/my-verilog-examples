// 8-bit register, clock enable

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
// `include "../../../basic-code/sequential-logic/d-flip-flop/d-flip-flop.v"

module jeff_74x377(
    input           en_bar,             // ENABLE
    input           clk,                // CLOCK
    input           d0,                 // DATA IN 
    input           d1,                 // 
    input           d2,                 // 
    input           d3,                 // 
    input           d4,                 // 
    input           d5,                 // 
    input           d6,                 // 
    input           d7,                 // 
    output          q0,                 // DATA OUT
    output          q1,                 // 
    output          q2,                 // 
    output          q3,                 // 
    output          q4,                 // 
    output          q5,                 // 
    output          q6,                 // 
    output          q7                  //  
);

wire  NOTHING;

assign en = ~en_bar;

// THE AND FEEDBACK
assign feedback = (clk & ~to_en);
assign to_en = (~feedback & en);

d_flip_flop DFF7 (.clk(clk), .en(to_en), .d(d7), .q(q7), .q_bar(NOTHING));
d_flip_flop DFF6 (.clk(clk), .en(to_en), .d(d6), .q(q6), .q_bar(NOTHING));
d_flip_flop DFF5 (.clk(clk), .en(to_en), .d(d5), .q(q5), .q_bar(NOTHING));
d_flip_flop DFF4 (.clk(clk), .en(to_en), .d(d4), .q(q4), .q_bar(NOTHING));
d_flip_flop DFF3 (.clk(clk), .en(to_en), .d(d3), .q(q3), .q_bar(NOTHING));
d_flip_flop DFF2 (.clk(clk), .en(to_en), .d(d2), .q(q2), .q_bar(NOTHING));
d_flip_flop DFF1 (.clk(clk), .en(to_en), .d(d1), .q(q1), .q_bar(NOTHING));
d_flip_flop DFF0 (.clk(clk), .en(to_en), .d(d0), .q(q0), .q_bar(NOTHING));

endmodule
