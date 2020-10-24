# nand4 example

_4-input NAND gate._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main part of the code is,

```verilog
    assign y = ~(a & b & c & d);
```

The entire code is
[nand4.v](nand4.v).

## RUN (SIMULATE)

I used my testbench
[nand4-tb.v](nand4-tb.v) with
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
