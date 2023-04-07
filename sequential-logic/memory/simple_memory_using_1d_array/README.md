# SIMPLE MEMORY USING 1D ARRAY EXAMPLE

_A simple 16 Byte memory modeled using a 1D array._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#schematic)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#tested-in-hardware---burned-to-a-fpga)

## OVERVIEW

_I used
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
to view the waveform. I also used
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
to synthesize and program this example on a
[Digilent ARTY-S7](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/fpga-development-boards/digilent-arty-s7-cheat-sheet)
FPGA development board._

## SCHEMATIC

This may help,

![IMAGE - simple-memory-using-1d-array.jpg - IMAGE](../../../docs/pics/simple-memory-using-1d-array.jpg)

## VERILOG CODE

The
[simple_memory_using_1d_array.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array.v)
uses behavioral modeling,

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

## RUN (SIMULATE)

I created,

* [simple_memory_using_1d_array_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array_tb.v)
the testbench
* [simple_memory_using_1d_array.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o simple_memory_using_1d_array_tb.vvp simple_memory_using_1d_array_tb.v simple_memory_using_1d_array.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp simple_memory_using_1d_array_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file simple_memory_using_1d_array_tb.vcd file with GTKWave,

```bash
gtkwave -f simple_memory_using_1d_array_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f simple_memory_using_1d_array_tb.gtkw &
```

![simple_memory_using_1d_array-waveform.jpg](../../../docs/pics/simple_memory_using_1d_array-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
