# JEFF 74x377 EXAMPLE

_8-bit register, clock enable.
Based on the 7400-series integrated circuits used in my
[programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377#tested-in-hardware---burned-to-a-fpga)

Documentation and Reference

* I'm using my
  [d-flip-flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/d_flip_flop)

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

I designed this register form the 1976 Texas Instruments spec sheet.
I kind of wish it had it clear but this is ok.

![IMAGE - ti-74x377-schematic.jpg - IMAGE](../../../docs/pics/ti-74x377-schematic.jpg)

## TRUTH TABLE

| clk     | en_bar | d     | q      |
|:-------:|:------:|:-----:|:------:|
| x       |  1     |  X    | q      |
| tick    |  0     |  1    | 1      |
| tick    |  0     |  0    | 0      |
| 0       |  X     |  X    | q      |

## VERILOG CODE

The
[jeff_74x377.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/registers/jeff_74x377/jeff_74x377.v)
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

* [jeff_74x377_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/registers/jeff_74x377/jeff_74x377_tb.v)
  the testbench
* [jeff_74x377_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/registers/jeff_74x377/jeff_74x377_tb.tv)
  the test vectors and expected results

with,

* [jeff_74x377.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/registers/jeff_74x377/jeff_74x377.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/registers/jeff_74x377/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o jeff_74x377_tb.vvp jeff_74x377_tb.v jeff_74x377.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp jeff_74x377_tb.vvp
```

The output of the test,

```text
???
```

## VIEW WAVEFORM

Open the waveform file jeff_74x377_tb.vcd file with GTKWave,

```bash
gtkwave -f jeff_74x377_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f jeff_74x377_tb.gtkw &
```

![jeff_74x377-waveform.jpg](../../../docs/pics/basic-code/jeff_74x377-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
