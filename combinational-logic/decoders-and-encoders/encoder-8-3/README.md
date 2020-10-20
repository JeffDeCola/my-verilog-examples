# encoder-8-3 example

_Encoder - Eights inputs (1 hot) encodes to output._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

This may help,

![IMAGE - encoder-8-3.jpg - IMAGE](../../../docs/pics/encoder-8-3.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    TBD??????????????????????????
```

The entire code is
[encoder-8-3.v](encoder-8-3.v).

## RUN (SIMULATE)

I used my testbench
[encoder-8-3-tb.v](encoder-8-3-tb.v) with
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
