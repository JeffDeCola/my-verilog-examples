# simple-memory-using-1d-array example

_A simple 16 Byte memory modeled using a 1D array._

[GitHub Webpage](https://jeffdecola.github.io/my-verilog-examples/)

## SCHEMATIC

This may help,

![IMAGE - simple-memory-using-1d-array.jpg - IMAGE](../../../docs/pics/simple-memory-using-1d-array.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    // DATA TYPES
    reg [7:0] mem [0:15];

    assign rdata = mem[addr];

    always @ (posedge clk) begin
        if (write) begin
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

![simple-memory-using-1d-array-waveform.jpg](../../../docs/pics/simple-memory-using-1d-array-waveform.jpg)
