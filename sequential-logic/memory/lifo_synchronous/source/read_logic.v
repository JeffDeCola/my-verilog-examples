// A synchronous lifo read logic

module read_logic (
    input       re,              // Read enable
    input       empty,           // Empty
    output reg  r_next);         // Read next

    //If FIFO empty read counter should not increment
    always @(*) begin
        if (re && (!empty))
            r_next=1;
        else
            r_next=0;
    end

endmodule