# half-adder example

_A 2-bit half-adder._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main part of the code is,

```verilog
reg sum, cout;

always @ ( a or b ) begin
    {cout, sum} <= a + b;
end
```

The entire code is
[half-adder.v](half-adder.v).

## RUN (SIMULATE)

I used my testbench
[half-adder-tb.v](half-adder-tb.v) with
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
