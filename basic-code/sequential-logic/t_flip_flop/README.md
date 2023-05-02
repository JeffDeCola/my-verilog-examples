# T FLIP-FLOP EXAMPLE

```text
THIS IS FOR EXAMPLE ONLY SINCE THIS T FLIP-FLOP IT BUILT FROM
A JK FLIP-FLOP THAT HAS A RACE CONDITION WHEN J =1 and K = 1.
I DON'T EVEN KNOW WHY THIS IS IN TEXTBOOKS.
```

_A t flip-flop which is **pulse-triggered**
can be toggled.
This has a race condition when clock is high._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop#tested-in-hardware---burned-to-a-fpga)

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

T FLIP-FLOP

* **USE CLOCK** - Called a **t flip-flop** which is **pulse-triggered**
* **USE EN** - Called a **t latch with enable** which is **level-triggered**
* OPERATIONAL: when clk/en is 1
* BUILT: with a jk-flip-flop
* TOGGLE: t=1 sets the output to 1
* NO TOGGLE: t=0 resets the output to 0

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
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/sequential-logic/t-flip-flop)
repo._

<p align="center">
    <img src="svgs/t-flip-flop.svg"
    align="middle"
</p>

## TRUTH TABLE

| clk/en |  t  |  q  | comment     |
|:------:|:---:|:---:|:------------|
|  0     |  X  |  q  | NO CHANGE   |
|  1     |  0  |  q  | NO CHANGE   |
|  1     |  1  | ~q  | TOGGLE      |

## VERILOG CODE

The
[t_flip_flop.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/t_flip_flop/t_flip_flop.v)
gate model,

```verilog
    // INTERNAL WIRES
    wire        j, k;
    wire        s, r;

    assign j = t;
    assign k = t;

    // JK FLIP-FLOP -----------------------------------

    // NAND3
    nand (s, j, clk, qbar);

    // NAND4
    nand (r, k, clk, q);

    // SR- LATCH -------------------------------------
    
    // NAND1
    nand (q, s, qbar);

    // NAND2
    nand (qbar, r, q);
```

Dataflow model,

```verilog
    // INTERNAL WIRES
    wire        s, r;

    // JK FLIP-FLOP -----------------------------------
  
    // NAND3
    assign s = ~(t & clk & qbar);

    // NAND4
    assign r = ~(t & clk & q);

    // SR- LATCH -------------------------------------
    
    // NAND1
    assign q = ~(s & qbar);

    // NAND2
    assign qbar = ~(r & q);
```

Behavioral model,

```text
THIS IS A POSEDGE T FLIP-FLOP
```

```text
    parameter   HOLD   = 1'b0,
                TOGGLE = 1'b1;

    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({t})
            HOLD :    q <= q;
            TOGGLE :  q <= ~q;
        endcase
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [t_flip_flop_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/t_flip_flop/t_flip_flop_tb.v)
  the testbench
* [t_flip_flop_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/t_flip_flop/t_flip_flop_tb.tv)
  the test vectors and expected results

with,

* [t_flip_flop.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/t_flip_flop/t_flip_flop.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/basic-code/sequential-logic/t_flip_flop/run-simulation.sh)
  is a script containing the commands below

```text
NOTE: This design has issues and has a race condition.
I could not even run the dataflow model.
Still not usre why they use these examples in textbooks.
```

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o t_flip_flop_tb.vvp t_flip_flop_tb.v t_flip_flop.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp t_flip_flop_tb.vvp
```

The output of the test (note the race condition),

```text
TEST START --------------------------------

                                 GATE  DATA   BEH
                 | TIME(ns) | T |  Q  |  Q  |  Q  |
                 ----------------------------------
   0             |        0 | 0 |  x  |  z  |  z  |
   0             |        1 | 0 |  0  |  z  |  z  |
   0             |       11 | 0 |  0  |  z  |  z  |
   1   NO_CHANGE |       25 | 0 |  0  |  z  |  z  |
   2      TOGGLE |       45 | 1 |  0  |  z  |  z  |
   2      TOGGLE |       50 | 1 |  1  |  z  |  z  |
   3   NO_CHANGE |       65 | 0 |  1  |  z  |  z  |
   4      TOGGLE |       85 | 1 |  1  |  z  |  z  |
***ERROR (gate) - Expected Q = 0
   5   NO_CHANGE |      105 | 0 |  1  |  z  |  z  |
***ERROR (gate) - Expected Q = 0
   6      TOGGLE |      125 | 1 |  1  |  z  |  z  |
   7   NO_CHANGE |      145 | 0 |  1  |  z  |  z  |
   8   NO_CHANGE |      165 | 0 |  1  |  z  |  z  |

 VECTORS:    8
  ERRORS:    2

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file t_flip_flop_tb.vcd file with GTKWave,

```bash
gtkwave -f t_flip_flop_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f t_flip_flop_tb.gtkw &
```

![t_flip_flop-waveform.jpg](../../../docs/pics/basic-code/t_flip_flop-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
