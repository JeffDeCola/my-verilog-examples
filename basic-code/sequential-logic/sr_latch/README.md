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

Latches an flip flops are part os a sequential logic,
a system that stores data and outputs changes on input.

LATCHES

* 1-bit storage
* **No clock** (part of an asynchronous system)
* Outputs **level-triggered** from inputs (asynchronous)

FLIP-FLOPS

* A Latch that is controlled by a clock
* **Clock** (part of synchronous system)
* Outputs **edge-triggered** from a clock (synchronous)
* Outputs can also be **level-triggered** from an input (asynchronous)

SR LATCH

_A sr (set ready) latch is level-triggered and
is the basic building block of all flip-=flops._

* It is **level-triggered**
* The input s sets the output to 1
* The input r resets the output to 0
* Forms the basic building blocks of all other types of flip-flops

|  s  |  r  |  q  | comment     |
|:---:|:---:|:---:|:-----------:|
|  0  |  0  |  X  | INVALID     |
|  0  |  1  |  1  | SET         |
|  1  |  0  |  0  | RESET       |
|  1  |  1  |  q  | NO CHANGE   |

SR FLIP-FLOP

_A sr (set ready) flip-flop is level-triggered and
operational when clk/en is high._

* Controlled by clk is a sr flip-flop
* Controlled by en is a sr latch with enable
* It is **level-triggered**
* Operational when clk/en is high
* Built with sr-latch
* The input s sets the output to 1
* The input r resets the output to 0

| clk |  s  |  r  |  q  | comment     |
|:---:|:---:|:---:|:---:|:-----------:|
|  0  |  X  |  X  |  q  | NO CHANGE   |
|  1  |  0  |  0  |  q  | NO CHANGE   |
|  1  |  0  |  1  |  0  | SET         |
|  1  |  1  |  0  |  1  | RESET       |
|  1  |  1  |  1  |  X  | INVALID     |

JK FLIP-FLOP

_A jk (????) flip-flop is edge-triggered._

* Controlled by clock
* If en was used instead of clk it would be a jk latch
* A sr (set ready) flip-flop is **edge-triggered**
* The input j sets the output to 1
* The input k resets the output to 0
* When s and r are 1, the latch is in an “undefined” state

JK FLIP-FLOP SYNC CLEAR

_A jk (????) flip-flop is edge-triggered with synchronous clear._

* Controlled by clock
* tbd

T FLIP-FLOP

_A t (????) flip-flop is edge-triggered._

* Controlled by clock
* If en was used instead of clk it would be a t latch
* tbd

D FLIP-FLOP

_A d (data) flip-flop is edge-triggered._

* Controlled by clock
* If en was used instead of clk it would be a d latch
* tbd

D FLIP-FLOP POS EDGE

_A d flip-flop which is pos edge-triggered._

* Controlled by clock
* Comprised of connecting two d flip-flops together
* Used to be called a master sl*ve flip flop
* tbd

D FLIP-FLOP POS EDGE SYNC ENABLE

_A d flip-flop which is pos edge-triggered with synchronous enable._

* Controlled by clock
* Comprised of connecting two d flip-flops together
* Adding an enable to a d flip-flop with a pos edge

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
uses gate modeling using nand gates,

```verilog
    // NAND1
    nand (q, s, qbar);

    // NAND2
    nand (qbar, r, q);
```

## RUN (SIMULATE)

I created,

* [sr_latch_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/sr_latch_tb.v)
  the testbench
* [sr_latch_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/sr_latch_tb.tv)
  the test vectors and expected results
* [sr_latch.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/sr_latch.vh)
  the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_latch/run-simulation.sh)
  a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o sr_latch_tb.vvp sr_latch_tb.v sr_latch.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

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
