# JEFF 74x181 EXAMPLE

_4-bit alu (arithmetic logic unit) and function generator.
Provides 16 binary logic operations and 16 arithmetic operations
on two 4-bit words.
Based on the 7400-series integrated circuits used in my
[programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#schematic)
* [FUNCTION TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#function-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#tested-in-hardware---burned-to-a-fpga)

Documentation and Reference

* I really like this
  [explanation](http://www.righto.com/2017/03/inside-vintage-74181-alu-chip-how-it.html)

## OVERVIEW

_I used
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
to view the waveform. I also used
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
to synthesize and program this example on a
[Digilent ARTY-S7](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/fpga-development-boards/digilent-arty-s7-cheat-sheet)
FPGA development board._

## SCHEMATIC

I designed this processor form the 1972 Texas Instruments spec sheet.
I love the care and thought put into this.

![IMAGE - ti-74x181-schematic.jpg - IMAGE](../../../docs/pics/ti-74x181-schematic.jpg)

## FUNCTION TABLE

This is when the inputs/outputs are treated as active high.

| SELECT | M=1 LOGIC    | M=0 ARITHMETIC NO CARRY | M=0 ARITHMETIC WITH CARRY |
|:------:|--------------|-------------------------|---------------------------|
|  0000  | !A           | A                       | A PLUS 1                  |
|  0001  | !(A+B)       | A+B                     | A+B PLUS 1                |
|  0010  | (!A)B        | A+!B                    | A+!B PLUS 1               |
|  0011  | 0            | MINUS 1 (2's compliment)| ZERO                      |
|  0100  | !(AB)        | A PLUS A(!B)            | A PLUS A(!B) PLUS 1       |
|  0101  | !B           | (A+B) PLUS A(!B)        | (A+B) PLUS A(!B) PLUS 1   |
|  0110  | A^B          | A MINUS B MINUS 1       | A MINUS B                 |
|  0111  | A(!B)        | A(!B) MINUS 1           | A(!B)                     |
|  1000  | !A+B         | A PLUS AB               | A PLUS AB PLUS 1          |
|  1001  | !(A^B)       | A PLUS B                | A PLUS B PLUS 1           |
|  1010  | B            | (A+!B) PLUS AB          | (A+!B) PLUS AB PLUS 1     |
|  1011  | AB           | AB MINUS 1              | AB                        |
|  1100  | 1            | A PLUS A (bit shifted)  | A PLUS A PLUS 1 (shifted) |
|  1101  | A+!B         | (A+B) PLUS A            | (A+B) PLUS A PLUS 1       |
|  1110  | A+B          | (A+!B) PLUS A           | (A+!B) PLUS A PLUS 1      |
|  1111  | A            | A MINUS 1               | A                         |

## VERILOG CODE

The
[jeff_74x181.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/jeff_74x181.v)
uses behavioral modeling.

## RUN (SIMULATE)

I created,

* [jeff_74x181_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/jeff_74x181_tb.v)
the testbench
* [jeff_74x181.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/jeff_74x181.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o jeff_74x181_tb.vvp jeff_74x181_tb.v jeff_74x181.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp jeff_74x181_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file jeff_74x181_tb.vcd file with GTKWave,

```bash
gtkwave -f jeff_74x181_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f jeff_74x181_tb.gtkw &
```

![jeff_74x181-waveform.jpg](../../../docs/pics/jeff_74x181-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
