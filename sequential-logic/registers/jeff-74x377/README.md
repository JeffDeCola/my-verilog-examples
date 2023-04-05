# JEFF 74x377 EXAMPLE

_8-bit register, clock enable.
Based on the 7400-series integrated circuits used in my
[programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

Table of Contents

* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377#tested-in-hardware---burned-to-a-fpga)

Documentation and Reference

* I'm using my
  [d-flip-flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/d-flip-flop)

## SCHEMATIC

I designed this register form the 1976 Texas Instruments spec sheet.
I kind of wish it had it clear but this is ok.

![IMAGE - ti-74x377-schematic.jpg - IMAGE](../../../docs/pics/ti-74x377-schematic.jpg)

## TRUTH TABLE

| clk     | en_bar | d     | q      |
|:-------:|:------:|:-----:|:------:|
| x       |  1     |  X    | q      |
| tick    |  0     |  1    | 1      |
| tick    |  0     |  0    | 0      |
| 0       |  X     |  X    | q      |

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

## TESTED IN HARDWARE - BURNED TO A FPGA

To test my design in real hardware, the above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
