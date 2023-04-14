# SR LATCH EXAMPLE

_A sr (set ready) latch stores data but output changes on input._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch#tested-in-hardware---burned-to-a-fpga)

## OVERVIEW

Latches are,

* 1-bit storage
* **No clock** (part of an asynchronous system)
* Outputs **level-triggered** from inputs (asynchronous)

Flip-flops are,

* A Latch that is controlled by a clock
* **Clock** (part of synchronous system)
* Outputs **edge-triggered** from a clock (synchronous)
* Outputs can also be **level-triggered** from an input (asynchronous)

### sr_latch

_A sr latch
is a level-triggered latch with a s (set) and a r (reset)._

The input s sets the output to 1, while the input r resets the output to 0.
When both s and r are at 1, the latch is in an “undefined” state.
The sr latch forms the basic building blocks of all other types of flip-flops.

|  s  |  r   | q   | comment     |
|:---:|:----:|:---:|:-----------:|
| 0   |  0   |  X  | INVALID     |
| 0  |   1   |  1  | 1 (SET)     |
| 1   |  0   |  0  | 0 (RESET)   |
| 1   |  1   |  q  | NO CHANGE   |

### sr_flip_flop

A sr flip-flop
is a level-triggered latch with a s (set) and a r (reset)._

The input s sets the output to 1, while the input r resets the output to 0.
When both s and r are at 1, the latch is in an “undefined” state.

|  s  |  r   | q   | comment     |
|:---:|:----:|:---:|:-----------:|
| 0   |  0   |  X  | INVALID     |
| 0  |   1   |  1  | 1 (SET)     |
| 1   |  0   |  0  | 0 (RESET)   |
| 1   |  1   |  q  | NO CHANGE   |

### jk_flip_flop

A jk flip-flop
is ???

### jk_flip_flop_sync_clear

A jk flip-flop with synchronous clear
is ?????

### t_flip_flop

A t flip-flop
is ?????

### d_flip_flop

A d flip-flop
is edge-triggered from input.
D (Data) Latches: D latches are also known as transparent latches and are implemented using two inputs: D (Data) and a clock signal. The output of the latch follows the input at the D terminal as long as the clock signal is high. When the clock signal goes low, the output of the latch is stored and held until the next rising edge of the clock.

### d_flip_flop_pos_edge

A d flip-flop with synchronous clear
is a ?????

### d_flip_flop_pos_edge_sync_en

A d flip-flop with asynchronous clear
is edge-triggered from input.

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
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/sequential-logic/sr-latch)
repo._

<p align="center">
    <img src="svgs/sr-latch.svg"
    align="middle"
</p>

## TRUTH TABLE

|  s  |  r   | q   | comment     |
|:---:|:----:|:---:|:-----------:|
| 0   |  0   |  X  | INVALID     |
| 0  |   1   |  1  | 1 (SET)     |
| 1   |  0   |  0  | 0 (RESET)   |
| 1   |  1   |  q  | NO CHANGE   |

## VERILOG CODE

The
[sr_latch.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/sr_latch.v)
uses behavioral modeling,

```verilog
tbd
```

## RUN (SIMULATE)

I created,

* [sr_latch_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/sr_latch_tb.v)
  the testbench
* [sr_latch.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/sr_latch.vh)
  the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/run-simulation.sh)
  a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o sr_latch_tb.vvp sr_latch_tb.v sr_latch.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp sr_latch_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file sr_latch_tb.vcd file with GTKWave,

```bash
gtkwave -f sr_latch_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f sr_latch_tb.gtkw &
```

![sr_latch-waveform.jpg](../../../docs/pics/basic-code/sr_latch-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
