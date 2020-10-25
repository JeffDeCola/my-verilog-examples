# jeff-74x181 example

_4-bit arithmetic logic unit and function generator.
Provides 16 binary logic operations and
16 arithmetic operations on two 4-bit words.
This simple processor was designed in late 60's and the early 70s._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## ARITHMETIC OPERATIONS

There are 16 binary arithmetic and 16 logic operations as follows,

// ????????????????????????

## SCHEMATIC

I designed this processor form the 1972 Texas Instruments spec sheet.
I love the care and thought put into this.

![IMAGE - ti-74x181-schematic.jpg - IMAGE](../../../docs/pics/ti-74x181-schematic.jpg)

## VERILOG CODE

```verilog
    ?????
```

The entire code is
[jeff-74x181.v](jeff-74x181.v).

## RUN (SIMULATE)

I used my testbench
[jeff-74x181-tb.v](jeff-74x181-tb.v) with
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
