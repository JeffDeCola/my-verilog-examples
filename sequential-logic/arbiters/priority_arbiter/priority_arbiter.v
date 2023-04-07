// A three level Priority Arbiter with asynchronous reset (using if-then-else statements).

module priority_arbiter(
    input clk,          // Clock  
    input rst,          // Reset
    input req_0,        // Request 0
    input req_1,        // Request 1
    input req_2,        // Request 2
    output gnt_0,       // Grant 0
    output gnt_1,       // Grant 1
    output gnt_2        // Grant 2
);

// DATA TYPES
wire req_0, req_1, req_2;
wire clk, rst;
reg gnt_0, gnt_1, gnt_2;

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        gnt_0 <= 0;
        gnt_1 <= 0;
        gnt_2 <= 0;
    end else if (req_0) begin
        gnt_0 <= 1;
        gnt_1 <= 0;
        gnt_2 <= 0;
    end else if (req_1) begin
        gnt_0 <= 0;
        gnt_1 <= 1;
        gnt_2 <= 0;
    end else if (req_2) begin
        gnt_0 <= 0;
        gnt_1 <= 0;
        gnt_2 <= 1;
    end else begin
        gnt_0 <= 0;
        gnt_1 <= 0;
        gnt_2 <= 0;
    end
end

endmodule
