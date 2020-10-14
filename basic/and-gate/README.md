# and-gate example

_A basic AND logic gate._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

*I generated this figure using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/and-gate)
repo.*

<p align="center">
    <img src="svgs/and-gate.svg"
    align="middle"
</p>

## VERILOG CODE

The main part of the code is,

```verilog
    input x, y;
    output xy;

    and(xy, x, y);
```

The entire code is
[and-gate.v](and-gate.v)

## RUN (SIMULATE)

I used
[iverilog](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/and-gate)
to simulate and create a `.vcd` file.

```bash
sh run-test.sh
```

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer like
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet).
