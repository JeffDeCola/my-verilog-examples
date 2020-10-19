// D flip-flop
module d_flip_flop (
    input   clk,        // Clock
    input   rst,        // Reset
    input   d,          //
    output  q_1,        // D FLIP-FLOP
    output  q_bar_1,    //
    output  q_2,        // D FLIP-FLOP WITH SYNCHRONOUS RESET
    output  q_bar_2,    //
    output  q_3,        // D FLIP-FLOP WITH ASYNCHRONOUS RESET
    output  q_bar_3     //
);

// DATA TYPES    
reg  q_1, q_bar_1;
reg  q_2, q_bar_2;
reg  q_3, q_bar_3;

// D FLIP-FLOP
always @ (posedge clk) begin
    q_1 <= d;
    q_bar_1 <= !d;
end

// D FLIP-FLOP WITH SYNCHRONOUS RESET
always @ (posedge clk) begin
    if (rst) begin
        q_2 <= 1'b0;
        q_bar_2 <= 1'b1;
    end else begin
        q_2 <= d;
        q_bar_2 <= !d;
    end
end

// D FLIP-FLOP WITH ASYNCHRONOUS RESET
always @ (posedge clk or posedge rst) begin
    if (rst) begin
        q_3 <= 1'b0;
        q_bar_3 <= 1'b1;
    end else begin
        q_3 <= d;
        q_bar_3 <= !d;
    end
end

endmodule
