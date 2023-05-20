// A synchronous lifo stack pointer

module stack_ptr_control (
    input             clk,              // Clock
    input             rst,              // Reset
    input             w_next,           // Write next
    input             r_next,           // Read next
    output reg [3:0]  stack_ptr);       // Stack pointer

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            stack_ptr <= 3'b000;
        end else if (w_next & r_next) begin
            stack_ptr <= stack_ptr;
        end else if (w_next) begin
            stack_ptr <= stack_ptr + 1;
        end else if (r_next) begin
            stack_ptr <= stack_ptr - 1;
        end
    end

endmodule