// 8-bit microprocessor counter8

module counter8(
    input  [3:0]    COUNTER_IN_LOW,     // 
    input  [7:4]    COUNTER_IN_HIGH,    // 
    input           MPC_LOAD_BAR,       //
    input           RESET,              //
    input           COUNT,              //
    input           SYSTEM_CLK,         // 
    output [7:0]    COUNTER_OUT         // 
);

assign COUNTER_OUT = 8'hf0;         // ERASE

endmodule
