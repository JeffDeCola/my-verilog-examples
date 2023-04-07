# NAND4 EXAMPLE

_4-input NAND gate used in my
[programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4#overview)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4#tested-in-hardware---burned-to-a-fpga)

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

## TRUTH TABLE

| a     | b     | c     | d     | y     |
|:-----:|:-----:|:-----:|:-----:|:-----:|
| 0     | 0     | 0     | 0     | 1     |
| 0     | 0     | 0     | 1     | 1     |
| 0     | 0     | 1     | 0     | 1     |
| 0     | 0     | 1     | 1     | 1     |
| 0     | 1     | 0     | 0     | 1     |
| 0     | 1     | 0     | 1     | 1     |
| 0     | 1     | 1     | 0     | 1     |
| 0     | 1     | 1     | 1     | 1     |
| 1     | 0     | 0     | 0     | 1     |
| 1     | 0     | 0     | 1     | 1     |
| 1     | 0     | 1     | 0     | 1     |
| 1     | 0     | 1     | 1     | 1     |
| 1     | 1     | 0     | 0     | 1     |
| 1     | 1     | 0     | 1     | 1     |
| 1     | 1     | 1     | 0     | 1     |
| 1     | 1     | 1     | 1     | 0     |

## VERILOG CODE

The
[nand4.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nand4/nand4.v)
uses dataflow modeling,

```verilog
    assign y = ~(a & b & c & d);
```

## RUN (SIMULATE)

I created,

* [nand4_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nand4/nand4_tb.v)
the testbench
* [nand4.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nand4/nand4.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/combinational-logic/nand4/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o nand4_tb.vvp nand4_tb.v nand4.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp nand4_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file nand4_tb.vcd file with GTKWave,

```bash
gtkwave -f nand4_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f nand4_tb.gtkw &
```

![nand4-waveform.jpg](../../../docs/pics/nand4-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
