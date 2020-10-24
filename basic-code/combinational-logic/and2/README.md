# and2 example

_2-input AND gate._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## STATE DIAGRAM

This may help,

![IMAGE - and2.jpg - IMAGE](../../../docs/pics/and2.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    ?????
```

The entire code is
[and2.v](and2.v).

## RUN (SIMULATE)

I used my testbench
[and2-tb.v](and2-tb.v) with
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
