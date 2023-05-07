# PRIORITY ARBITER EXAMPLE

_A three level priority arbiter with asynchronous reset._

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

| rst | req_2 | req_1 | req_0 | gnt_2 | gnt_1 | gnt_0 |
|:---:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|  0  |   0   |   0   |   0   |   0   |   0   |   0   |
|  0  |   0   |   0   |   1   |   0   |   0   |   1   |
|  0  |   0   |   1   |   0   |   0   |   1   |   0   |
|  0  |   0   |   1   |   1   |   0   |   0   |   1   |
|  0  |   1   |   0   |   0   |   1   |   0   |   0   |
|  0  |   1   |   0   |   1   |   0   |   0   |   1   |
|  0  |   1   |   1   |   0   |   0   |   1   |   0   |
|  0  |   1   |   1   |   1   |   0   |   0   |   1   |
|  1  |   x   |   x   |   x   |   0   |   0   |   0   |

## VERILOG CODE

The
[priority_arbiter.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/arbiters/priority_arbiter/priority_arbiter.v)
behavioral model,

```verilog
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            gnt_0 <= 0;
            gnt_1 <= 0;
            gnt_2 <= 0;
        end else if (req_0) begin
            gnt_0 <= 1;
            gnt_1 <= 0;
            gnt_2 <= 0;
        end else if (req_1) begin
            gnt_0 <= 0;
            gnt_1 <= 1;
            gnt_2 <= 0;
        end else if (req_2) begin
            gnt_0 <= 0;
            gnt_1 <= 0;
            gnt_2 <= 1;
        end else begin
            gnt_0 <= 0;
            gnt_1 <= 0;
            gnt_2 <= 0;
        end
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
TEST START --------------------------------

                 | TIME(ns) | RST | REQ_2 | REQ_1 | REQ_0 | GNT_2EXP | GNT_1EXP | GNT_0EXP |
                 ---------------------------------------------------------------------------
   0             |        0 |  0  |   0   |   0   |   0   |    x     |    x     |    x     |
   0             |       10 |  0  |   0   |   0   |   0   |    0     |    0     |    0     |
   1     NOTHING |       25 |  0  |   0   |   0   |   0   |    0     |    0     |    0     |
   2        GNT0 |       45 |  0  |   0   |   0   |   1   |    0     |    0     |    0     |
   2        GNT0 |       50 |  0  |   0   |   0   |   1   |    0     |    0     |    1     |
   3        GNT1 |       65 |  0  |   0   |   1   |   0   |    0     |    0     |    1     |
   3        GNT1 |       70 |  0  |   0   |   1   |   0   |    0     |    1     |    0     |
   4          -- |       85 |  0  |   0   |   1   |   1   |    0     |    1     |    0     |
   4          -- |       90 |  0  |   0   |   1   |   1   |    0     |    0     |    1     |
   5        GNT3 |      105 |  0  |   1   |   0   |   0   |    0     |    0     |    1     |
   5        GNT3 |      110 |  0  |   1   |   0   |   0   |    1     |    0     |    0     |
   6          -- |      125 |  0  |   1   |   0   |   1   |    1     |    0     |    0     |
   6          -- |      130 |  0  |   1   |   0   |   1   |    0     |    0     |    1     |
   7          -- |      145 |  0  |   1   |   1   |   0   |    0     |    0     |    1     |
   7          -- |      150 |  0  |   1   |   1   |   0   |    0     |    1     |    0     |
   8          -- |      165 |  0  |   1   |   1   |   1   |    0     |    1     |    0     |
   8          -- |      170 |  0  |   1   |   1   |   1   |    0     |    0     |    1     |
   9       RESET |      185 |  1  |   x   |   x   |   x   |    0     |    0     |    0     |

 VECTORS:    9
  ERRORS:    0

TEST END ----------------------------------
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

![priority_arbiter-waveform.jpg](../../../docs/pics/sequential-logic/priority_arbiter-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
