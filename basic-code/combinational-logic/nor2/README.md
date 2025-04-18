# NOR2 EXAMPLE

[![jeffdecola.com](https://img.shields.io/badge/website-jeffdecola.com-blue)](https://jeffdecola.com)
[![MIT License](https://img.shields.io/:license-mit-blue.svg)](https://jeffdecola.mit-license.org)

_2-input NOR gate used in my
[programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2#tested-in-hardware---burned-to-a-fpga)

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
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/combinational-logic/nor)
repo._

<p align="center">
    <img src="svgs/nor.svg"
    align="middle"
</p>

## TRUTH TABLE

| a     | b     | y     |
|:-----:|:-----:|:-----:|
| 0     | 0     | 1     |
| 0     | 1     | 0     |
| 1     | 0     | 0     |
| 1     | 1     | 0     |

## VERILOG CODE

The
[nor2.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nor2/nor2.v)
gate model,

```verilog
    // GATE PRIMITIVE
    nor (y, a, b);
```

Dataflow model,

```verilog
    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = ~(a | b);
```

Behavioral model,

```verilog
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(a or b) begin
        y <= ~(a | b);
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [nor2_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nor2/nor2_tb.v)
  the testbench
* [nor2_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nor2/nor2_tb.tv)
  the test vectors and expected results

with,

* [nor2.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nor2/nor2.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nor2/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o nor2_tb.vvp nor2_tb.v nor2.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp nor2_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                                     GATE  DATA   BEH
                 | TIME(ns) | A | B |  Y  |  Y  |  Y  |
                 --------------------------------------
   1        INIT |       15 | 0 | 0 |  1  |  1  |  1  |
   2           - |       35 | 0 | 0 |  1  |  1  |  1  |
   3           - |       55 | 0 | 1 |  0  |  0  |  0  |
   4           - |       75 | 1 | 0 |  0  |  0  |  0  |
   5           - |       95 | 1 | 1 |  0  |  0  |  0  |

 VECTORS:    5
  ERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file nor2_tb.vcd file with GTKWave,

```bash
gtkwave -f nor2_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f nor2_tb.gtkw &
```

![nor2-waveform.jpg](../../../docs/pics/basic-code/nor2-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
