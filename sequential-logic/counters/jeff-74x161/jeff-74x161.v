// Synchronous presettable 4-bit binary counter, asynchronous clear
module jeff_74x161(
    input           clr_bar,             // ASYNC CLEAR
    input           ld_bar,              // LOAD
    input           ent,                 // ENABLE T
    input           enp,                 // ENABLE P
    input           clk,                 // CLK
    input           a, b, c, d,          // DATA IN
    output          qa, qb, qc, qd,      // DATA OUT
    output          rco                  // RIPPLE CARRY OUTPUT
);

reg  qa, qb, qc, qd;
reg  rco;
wire ld_or_clr;
wire ent_and_enp;

assign rco = ent & qd & qc & qb & qa;

assign ld_or_clr =  ~ld_bar | ~clr_bar;
assign ent_and_enp = ent & enp;

assign feedback_qd = ent_and_enp & qc & qb & qa;

output_section OUTPUT_QD (
    .clr_bar(clr_bar),
    .ld_or_clr(ld_or_clr),
    .feedback(feedback_qd),
    .clk(clk),
    .data(d),
    .q(qd)
);

assign feedback_qc =  ent_and_enp & qb & qa;

output_section OUTPUT_QC (
    .clr_bar(clr_bar),
    .ld_or_clr(ld_or_clr),
    .feedback(feedback_qc),
    .clk(clk),
    .data(c),
    .q(qc)
);

assign feedback_qb = ent_and_enp & qa;

output_section OUTPUT_QB (
    .clr_bar(clr_bar),
    .ld_or_clr(ld_or_clr),
    .feedback(feedback_qb),
    .clk(clk),
    .data(b),
    .q(qb)
);

assign feedback_qa = ent_and_enp;

output_section OUTPUT_QA (
    .clr_bar(clr_bar),
    .ld_or_clr(ld_or_clr),
    .feedback(feedback_qa),
    .clk(clk),
    .data(a),
    .q(qa)
);

endmodule
