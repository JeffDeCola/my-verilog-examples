# PRIORITY ARBITER EXAMPLE

_A three level Priority Arbiter with asynchronous reset
(using if-then-else statements)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter#check-waveform)

## OVERVIEW

An arbiter has one device access to a shared resource (Taking in N device
requests, granting access to only one).

## SCHEMATIC

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/priority-arbiter)
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

The main part of the code is,

```verilog
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

The entire code is
[priority-arbiter.v](priority-arbiter.v).

## RUN (SIMULATE)

I used my testbench
[priority-arbiter-tb.v](priority-arbiter-tb.v) with
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and create a `.vcd` file.

```bash
sh run-test.sh
```

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer.

I used [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
and launch it using
[launch-gtkwave.sh](launch-gtkwave.sh).

![priority-arbiter-waveform.jpg](../../../docs/pics/priority-arbiter-waveform.jpg)
