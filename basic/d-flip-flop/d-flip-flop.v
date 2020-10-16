// D flip-flop
module d_flip_flop (
    d,      // d in
    q,      // q out
    q_bar   // q bar out
    clk,    // Clock
);

// INPUT/OUTPUT
input d;
input clk;
output q, q_bar;

// DATA TYPES    
wire d ,clk;
reg q, q_bar;
  	 
always @ (posedge clk)
begin
    q <= d;
    q_bar <= !d;
end

endmodule
