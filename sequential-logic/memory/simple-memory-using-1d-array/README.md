# simple-memory-using-1d-array example

_A simple memory modeled using a 1D array._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main part of the code is,

```verilog
// DATA TYPES
reg [7:0] mem [0:15];
integer i;

assign rdata = mem[addr];

always @ (posedge clk) begin
    if (rst) begin
        // RESET MEMORY TO 0
        for (i = 0; i < 15; i = i+1) begin
            mem[i] <= 0;
        end
    end if (write) begin
        // WRITE DATA TO ADDR
        mem[addr] <= wdata;
    end
end
```

The entire code is
[simple-memory-using-1d-array.v](simple-memory-using-1d-array.v).

## RUN (SIMULATE)

I used my testbench
[simple-memory-using-1d-array-tb.v](simple-memory-using-1d-array-tb.v) with
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and create a `.vcd` file.

```bash
sh run-test.sh
```

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer.

I used [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
and launch it using
[launch-gtkwave.sh](launch-gtkwave.sh).
