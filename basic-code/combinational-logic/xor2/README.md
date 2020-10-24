# xor2 example

_2-input XOR gate._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## STATE DIAGRAM

This may help,

![IMAGE - xor2.jpg - IMAGE](../../../docs/pics/xor2.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    ?????
```

The entire code is
[xor2.v](xor2.v).

## RUN (SIMULATE)

I used my testbench
[xor2-tb.v](xor2-tb.v) with
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
