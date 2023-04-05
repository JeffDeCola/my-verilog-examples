# HALF ADDER EXAMPLE

_A 2-bit half adder._

Table of Contents

* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/half-adder#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/half-adder#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/half-adder#check-waveform)

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

![half-adder-waveform.jpg](../../../docs/pics/half-adder-waveform.jpg)
