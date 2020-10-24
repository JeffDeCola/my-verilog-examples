# jeff-74x151 example

_8-line to 1-line data selector/multiplexer._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main part of the code is,

```verilog
    ?????
```

The entire code is
[jeff-74x151.v](jeff-74x151.v).

## RUN (SIMULATE)

I used my testbench
[jeff-74x151-tb.v](jeff-74x151-tb.v) with
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
