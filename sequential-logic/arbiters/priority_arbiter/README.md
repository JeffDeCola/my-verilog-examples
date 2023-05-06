# PRIORITY ARBITER EXAMPLE

_A three level priority arbiter with asynchronous reset
(using if-then-else statements)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter#tested-in-hardware---burned-to-a-fpga)

## OVERVIEW

An arbiter has one device access to a shared resource (Taking in N device
requests, granting access to only one).

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
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/sequential-logic/priority-arbiter)
repo._

<p align="center">
    <img src="svgs/priority-arbiter.svg"
    align="middle"
</p>

## TRUTH TABLE

Note how `req_0` gets priority, hence the name.

| req_2 | req_1 | req_0 | gnt_2 | gnt_1 | gnt_0 |
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|   0   |   0   |   0   |   0   |   0   |   0   |
|   0   |   0   |   1   |   0   |   0   |   1   |
|   0   |   1   |   0   |   0   |   1   |   0   |
|   0   |   1   |   1   |   0   |   0   |   1   |
|   1   |   0   |   0   |   1   |   0   |   0   |
|   1   |   0   |   1   |   0   |   0   |   1   |
|   1   |   1   |   0   |   0   |   1   |   0   |
|   1   |   1   |   1   |   0   |   0   |   1   |

## VERILOG CODE

The
[priority_arbiter.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/arbiters/priority_arbiter/priority_arbiter.v)
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

* [priority_arbiter_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/arbiters/priority_arbiter/priority_arbiter_tb.v)
  the testbench
* [priority_arbiter_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/arbiters/priority_arbiter/priority_arbiter_tb.tv)
  the test vectors and expected results

with,

* [priority_arbiter.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/arbiters/priority_arbiter/priority_arbiter.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/arbiters/priority_arbiter/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o priority_arbiter_tb.vvp priority_arbiter_tb.v priority_arbiter.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp priority_arbiter_tb.vvp
```

The output of the test,

```text
???
```

## VIEW WAVEFORM

Open the waveform file priority_arbiter_tb.vcd file with GTKWave,

```bash
gtkwave -f priority_arbiter_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f priority_arbiter_tb.gtkw &
```

![priority_arbiter-waveform.jpg](../../../docs/pics/basic-code/priority_arbiter-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
