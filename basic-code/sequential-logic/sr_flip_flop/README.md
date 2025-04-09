# SR FLIP-FLOP EXAMPLE

[![jeffdecola.com](https://img.shields.io/badge/website-jeffdecola.com-blue)](https://jeffdecola.com)
[![MIT License](https://img.shields.io/:license-mit-blue.svg)](https://jeffdecola.mit-license.org)

_A sr (set ready) flip-flop which is **pulse-triggered**
can be set and reset._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop#tested-in-hardware---burned-to-a-fpga)

## OVERVIEW

Latches and flip-flops are part of sequential logic
digital system that stores data on the output.

LATCHES

* 1-bit storage
* **NO CLOCK** (part of an asynchronous system)
* Outputs **level-triggered** from inputs (asynchronous)

FLIP-FLOPS

* A latch that is controlled by a clock
* **USES CLOCK** (part of synchronous system)
* Outputs can be **level-triggered (pulse)**
  or **edge-triggered** from a clk (synchronous)

TRIGGER

* NO CLOCK
  * level-triggered
* CLOCK
  * pulse-triggered (level-triggered but using clock)
  * edge-triggered

SR FLIP-FLOP

* **USE CLOCK** - Called a **sr flip-flop** which is **pulse-triggered**
* **USE EN** - Called a **sr latch with enable** which is **level-triggered**
* OPERATIONAL: when clk/en is 1
* BUILT: with a sr-latch
* SET: s=1 sets the output to 1
* RESET: r=1 resets the output to 0

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
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/sequential-logic/sr-flip-flop)
repo._

<p align="center">
    <img src="svgs/sr-flip-flop.svg"
    align="middle"
</p>

## TRUTH TABLE

| clk/en |  s  |  r  |  q  | comment     |
|:------:|:---:|:---:|:---:|:------------|
|  0     |  X  |  X  |  q  | NO CHANGE   |
|  1     |  0  |  0  |  q  | NO CHANGE   |
|  1     |  0  |  1  |  0  | RESET       |
|  1     |  1  |  0  |  1  | SET         |
|  1     |  1  |  1  |  X  | INVALID     |

## VERILOG CODE

The
[sr_flip_flop.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_flip_flop/sr_flip_flop.v)
gate model,

```verilog
    // INTERNAL WIRES
    wire        s1, r1;

    // NAND3
    nand (s1, s, clk);

    // NAND4
    nand (r1, r, clk);

    // SR- LATCH -------------------------------------

    // NAND1
    nand (q, s1, qbar);

    // NAND2
    nand (qbar, r1, q);
```

Dataflow model,

```verilog
    // INTERNAL WIRES
    wire        s1, r1;

    // NAND3
    assign s1 = ~(s & clk);

    // NAND4
    assign r1 = ~(r & clk);

    // SR- LATCH -------------------------------------

    // NAND1
    assign q = ~(s1 & qbar);

    // NAND2
    assign qbar = ~(r1 & q);
```

Behavioral model,

```text
THIS IS A POSEDGE JK FLIP-FLOP
```

```verilog
    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({s,r})
            2'b0_0 : q <= q;
            2'b0_1 : q <= 1'b0;
            2'b1_0 : q <= 1'b1;
            2'b1_1 : q <= 1'bx;
        endcase
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [sr_flip_flop_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_flip_flop/sr_flip_flop_tb.v)
  the testbench
* [sr_flip_flop_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_flip_flop/sr_flip_flop_tb.tv)
  the test vectors and expected results

with,

* [sr_flip_flop.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_flip_flop/sr_flip_flop.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/sr_flip_flop/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o sr_flip_flop_tb.vvp sr_flip_flop_tb.v sr_flip_flop.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp sr_flip_flop_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                                     GATE  DATA   BEH
                 | TIME(ns) | S | R |  Q  |  Q  |  Q  |
                 --------------------------------------
   1        INIT |       15 | 0 | 0 |  x  |  x  |  x  |
   2         SET |       35 | 1 | 0 |  1  |  1  |  1  |
   3   NO_CHANGE |       55 | 0 | 0 |  1  |  1  |  1  |
   4       RESET |       75 | 0 | 1 |  0  |  0  |  0  |
   5   NO_CHANGE |       95 | 0 | 0 |  0  |  0  |  0  |
   6         SET |      115 | 1 | 0 |  1  |  1  |  1  |
   7   NO_CHANGE |      135 | 0 | 0 |  1  |  1  |  1  |
   8       RESET |      155 | 0 | 1 |  0  |  0  |  0  |
   9   NO_CHANGE |      175 | 0 | 0 |  0  |  0  |  0  |

 VECTORS:    9
  ERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file sr_flip_flop_tb.vcd file with GTKWave,

```bash
gtkwave -f sr_flip_flop_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f sr_flip_flop_tb.gtkw &
```

![sr_flip_flop-waveform.jpg](../../../docs/pics/basic-code/sr_flip_flop-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
