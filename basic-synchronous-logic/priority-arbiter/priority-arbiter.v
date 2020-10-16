//  A three level ROUND-ROBIN ARBITER
module priority_arbitor(
    req_0,      // Request 0
    req_1,      // Request 1
    req_2,      // Request 2
    gnt_0,      // Grant 0
    gnt_1,      // Grant 1
    gnt_2,      // Grant 2
    clk,        // Clock  
    rst         // Reset
);

// PORT DECLARATION
input req_0, req_1, req_2;
input clk, rst;
output gnt_0, gnt_1, gnt_2;

// DATA TYPES
wire req_0, req_1, req_2;
wire clk, rst;
reg gnt_0, gnt_1, gnt_2;

always @ (posedge clk or posedge rst)
begin
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
