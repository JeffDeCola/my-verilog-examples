// D flip-flop
module d_flip_flop (
    d,      // d in
    q,      // q out
    q_bar,   // q bar out
    clk,    // Clock
);

// PORT DECLARATION
input d;
input clk;
output q, q_bar;

// DATA TYPES    
wire d ,clk;
reg q, q_bar;

// CODE STARTS HERE
always @ (posedge clk)
begin
    q <= d;
    q_bar <= !d;
end

endmodule
