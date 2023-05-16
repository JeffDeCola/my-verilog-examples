// A synchronous fifo.

module fifo_synchronous_behavioral(
    input  clk,             // Clock
    input  rst,             // Reset
    input  [7:0] data_in,   // DATA In
    input  we,              // Write enable
    output full,            // Full
    output [7:0] data_out,  // DATA Out
    output re,              // Read enable
    output empty);          // Empty

dual_port_ram_synchronous_behavioral dual_port_ram_synchronous(
    .clk(clk),                 
    .we_A(),
    .we_B(),
    .addr_A(),
    .addr_B(),
    .data_in_A(),
    .data_in_B(),
    .data_out_A(),
    .data_out_B()
);

write_logic write_logic(
    .clk(),
    .rst(),
    .we(),
    .full(),
    .empty(),
    .data_in(),
    .data_out(),
    .re()
);

read_logic read_logic(
    .clk(),
    .rst(),
    .we(),
    .full(),
    .empty(),
    .data_in(),
    .data_out(),
    .re()
);

write_ptr_logic write_ptr_logic(
    .clk(),
    .rst(),
    .we(),
    .full(),
    .empty(),
    .data_in(),
    .data_out(),
    .re()
);

read_ptr_logic read_ptr_logic(
    .clk(),
    .rst(),
    .we(),
    .full(),
    .empty(),
    .data_in(),
    .data_out(),
    .re()
);

compare_logic compare_logic(
    .clk(),
    .rst(),
    .we(),
    .full(),
    .empty(),
    .data_in(),
    .data_out(),
    .re()
);

endmodule