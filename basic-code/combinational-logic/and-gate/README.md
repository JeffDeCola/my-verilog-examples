# and-gate example

_A few different ways to model an AND gate._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/and-gate)
repo._

<p align="center">
    <img src="svgs/and-gate.svg"
    align="middle"
</p>

## VERILOG CODE

There are many ways to design an AND gate,

```verilog
    // METHOD 1 - CONTINUOUS ASSIGNMENT STATEMENT
    assign xy_1 = x & y;

    // METHOD 2 - ALWAYS BLOCK with BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * )
    begin
        xy_2 = x & y;
    end

    // METHOD 3 - ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * )
    begin
        xy_3 <= x & y;
    end

    // METHOD 4 - GATE PRIMATIVES
    and(xy_4, x, y);
```

The entire code is
[and-gate.v](and-gate.v).

## RUN (SIMULATE)

I used my testbench
[and-gate-tb.v](and-gate-tb.v) with
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
