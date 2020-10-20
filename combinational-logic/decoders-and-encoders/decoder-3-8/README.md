# decoder-3-8 example

_Demultiplexer - One input, Four outputs._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

This may help,

![IMAGE - decoder-3-8.jpg - IMAGE](../../../docs/pics/decoder-3-8.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    ????????????????????????
```

The entire code is
[decoder-3-8.v](decoder-3-8.v).

## RUN (SIMULATE)

I used my testbench
[decoder-3-8-tb.v](decoder-3-8-tb.v) with
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
