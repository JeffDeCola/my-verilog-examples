# priority-arbiter example

_Allowing one device access to a shared resource (Taking in N device
requests, granting access to only one)._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/priority-arbiter)
repo._

<p align="center">
    <img src="svgs/priority-arbiter.svg"
    align="middle"
</p>

## VERILOG CODE

The main part of the code is,

```verilog
    // ???
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

Check you waveform using your `.vcd` file with a waveform viewer like
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet).
