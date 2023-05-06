# SIMPLE MEMORY USING 1D ARRAY EXAMPLE

_A simple 16 Byte memory modeled using a 1D array._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array#view-waveform)
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

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/sequential-logic/and)
repo._

<p align="center">
    <img src="svgs/and.svg"
    align="middle"
</p>

This may help,

![IMAGE - simple-memory-using-1d-array.jpg - IMAGE](../../../docs/pics/simple-memory-using-1d-array.jpg)

## TRUTH TABLE

| a     | b     | y     |
|:-----:|:-----:|:-----:|
| 0     | 0     | 0     |
| 0     | 1     | 0     |
| 1     | 0     | 0     |
| 1     | 1     | 1     |

## VERILOG CODE

The
[simple_memory_using_1d_array.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array.v)
gate model,

```verilog
    // GATE PRIMITIVE
    and (y, a, b);
```

Dataflow model,

```verilog
    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = a & b;
```

Behavioral model,

```verilog
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(a or b) begin
        y <= a & b;
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [simple_memory_using_1d_array_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array_tb.v)
  the testbench
* [simple_memory_using_1d_array_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array_tb.tv)
  the test vectors and expected results

with,

* [simple_memory_using_1d_array.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/simple_memory_using_1d_array.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/simple_memory_using_1d_array/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o simple_memory_using_1d_array_tb.vvp simple_memory_using_1d_array_tb.v simple_memory_using_1d_array.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp simple_memory_using_1d_array_tb.vvp
```

The output of the test,

```text
???
```

## VIEW WAVEFORM

Open the waveform file simple_memory_using_1d_array_tb.vcd file with GTKWave,

```bash
gtkwave -f simple_memory_using_1d_array_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f simple_memory_using_1d_array_tb.gtkw &
```

![simple_memory_using_1d_array-waveform.jpg](../../../docs/pics/basic-code/simple_memory_using_1d_array-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
