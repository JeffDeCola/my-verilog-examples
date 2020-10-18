# and-gate example

_A basic AND logic gate._

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

There are many ways to design an AND gate

### METHOD 1

Using a gate primate,
```

```

### METHOD 2


### METHOD 3


The main part of the code is,

```verilog
    input x, y;
    output xy;

    and(xy, x, y);
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
