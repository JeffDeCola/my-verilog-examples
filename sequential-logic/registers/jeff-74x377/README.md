# jeff-74x377 example

_8-bit register, clock enable._

Documentation and reference,

* I'm using my
  [d-flip-flop](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/sequential-logic/d-flip-flop)
* This verilog code used in my
  [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

I designed this processor form the 1976 Texas Instruments spec sheet.

![IMAGE - ti-74x377-schematic.jpg - IMAGE](../../../docs/pics/ti-74x377-schematic.jpg)

## VERILOG CODE

The entire code is
[jeff-74x377.v](jeff-74x377.v).

## RUN (SIMULATE)

I used my testbench
[jeff-74x377-tb.v](jeff-74x377-tb.v) with
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

![jeff-74x377-waveform.jpg](../../../docs/pics/jeff-74x377-waveform.jpg)
