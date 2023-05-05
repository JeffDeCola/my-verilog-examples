# MUX 4x1 EXAMPLE

_Multiplexer - Four inputs, one output._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1#tested-in-hardware---burned-to-a-fpga)

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
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/combinational-logic/mux-4x1)
repo._

<p align="center">
    <img src="svgs/mux-4x1.svg"
    align="middle"
</p>

## TRUTH TABLE

| sel   | a | b | c | d | y |
|:-----:|:-:|:-:|:-:|:-:|:-:|
| 00    | 0 | X | X | X | 0 |
| 00    | 1 | X | X | X | 1 |
| 01    | X | 0 | X | X | 0 |
| 01    | X | 1 | X | X | 1 |
| 10    | X | X | 0 | X | 0 |
| 10    | X | X | 1 | X | 1 |
| 11    | X | X | X | 0 | 0 |
| 11    | X | X | X | 1 | 1 |

## VERILOG CODE

The
[mux_4x1.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1/mux_4x1.v)
behavioral model,

```verilog
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * ) begin
        case(sel)
            2'b00 : y <= a;
            2'b01 : y <= b;
            2'b10 : y <= c;
            2'b11 : y <= d;
        endcase
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [mux_4x1_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1/mux_4x1_tb.v)
  the testbench
* [mux_4x1_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1/mux_4x1_tb.tv)
  the test vectors and expected results

with,

* [mux_4x1.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1/mux_4x1.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o mux_4x1_tb.vvp mux_4x1_tb.v mux_4x1.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp mux_4x1_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                 | TIME(ns) | SEL | A | B | C | D | Y |
                 --------------------------------------
   0        INIT |        0 | 00  | 0 | x | x | x | 0 |
   1           - |       25 | 00  | 0 | x | x | x | 0 |
   2           - |       45 | 00  | 1 | x | x | x | 1 |
   3           - |       65 | 01  | x | 0 | x | x | 0 |
   4           - |       85 | 01  | x | 1 | x | x | 1 |
   5           - |      105 | 10  | x | x | 0 | x | 0 |
   6           - |      125 | 10  | x | x | 1 | x | 1 |
   7           - |      145 | 11  | x | x | x | 0 | 0 |
   8           - |      165 | 11  | x | x | x | 1 | 1 |

 VECTORS:    8
  ERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file mux_4x1_tb.vcd file with GTKWave,

```bash
gtkwave -f mux_4x1_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f mux_4x1_tb.gtkw &
```

![mux_4x1-waveform.jpg](../../../docs/pics/combinational-logic/mux_4x1-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
