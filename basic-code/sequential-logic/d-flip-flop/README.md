# d-flip-flop example

_A basic d flip-flop logic gate._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/d-flip-flop)
repo._

<p align="center">
    <img src="svgs/d-flip-flop.svg"
    align="middle"
</p>

## VERILOG CODE

The main part of the code is,

```verilog
    always @ (posedge clk)
    begin
        q <= d;
        q_bar <= !d;
    end
```

The entire code is
[d-flip-flop.v](d-flip-flop.v).

## RUN (SIMULATE)

I used my testbench
[d-flip-flop-tb.v](d-flip-flop-tb.v) with
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
