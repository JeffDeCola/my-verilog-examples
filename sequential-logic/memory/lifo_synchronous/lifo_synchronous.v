// A synchronous fifo.

module lifo_synchronous_structural(
    input  clk,             // Clock
    input  rst,             // Reset
    input  [7:0] data_in,   // DATA In
    input  we,              // Write enable
    output full,            // Full
    output [7:0] data_out,  // DATA Out
    input  re,              // Read enable
    output empty);          // Empty

    //FIFO
    // parameter DATA_WIDTH = 8;
    // parameter ADDR_WIDTH = 4;
    // parameter RAM_DEPTH = (1 << ADDR_WIDTH);

    // DATA TYPES
    wire [3:0] stack_ptr;
    wire       w_next;
    wire       r_next;
    parameter  zeros = 8'h00;
    parameter  zero =   1'b0;

    // 16x8 dual port RAM
    dual_port_ram_synchronous_behavioral dual_port_ram_synchronous(
        .clk(clk),           
        .we_A(we),
        .we_B(zero),
        .addr_A(stack_ptr),
        .addr_B(stack_ptr),
        .data_in_A(data_in),
        .data_in_B(zeros),
        .data_out_A(),
        .data_out_B(data_out)
    );

    write_logic write_logic(
        .we(we),
        .full(full),
        .w_next(w_next)
    );

    read_logic read_logic(
        .re(re),
        .empty(empty),
        .r_next(r_next)
    );

    stack_ptr_control stack_ptr_control(
        .clk(clk),
        .rst(rst),
        .w_next(w_next),
        .r_next(r_next),
        .stack_ptr(stack_ptr)
    );

    compare_and_status_logic compare_and_status_logic(
        .stack_ptr(stack_ptr),
        .full(full),
        .empty(empty)
    );

endmodule