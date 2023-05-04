# JEFF 74x181 EXAMPLE

_4-bit alu (arithmetic logic unit) and function generator.
Provides 16 binary logic operations and 16 arithmetic operations
on two 4-bit words.
Based on the 7400-series integrated circuits used in my
[programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181#view-waveform)
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

I designed this alu from the 1972 Texas Instruments spec sheet.
I love the care and thought put into this.

![IMAGE - ti-74x181-schematic.jpg - IMAGE](../../../docs/pics/combinational-logic/ti-74x181-schematic.jpg)

## TRUTH TABLE

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
is a dataflow model.

## RUN (SIMULATE)

The testbench uses two files,

* [jeff_74x181_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/jeff_74x181_tb.v)
  the testbench

with,

* [jeff_74x181.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/jeff_74x181.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/alus/jeff_74x181/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o jeff_74x181_tb.vvp jeff_74x181_tb.v jeff_74x181.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp jeff_74x181_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                       | TIME(ns) | M | CI_BAR |  S   |  A   |  B   |  F   |
                       -----------------------------------------------------
   0              INIT |        0 | 1 |   0    | 0000 | 1011 | 0100 | 0100 |
   1              (!A) |       25 | 1 |   0    | 0000 | 1011 | 0100 | 0100 |
   2            !(A+B) |       45 | 1 |   0    | 0001 | 1110 | 0110 | 0001 |
   3             (!A)B |       65 | 1 |   0    | 0010 | 0111 | 1001 | 1000 |
   4                 0 |       85 | 1 |   0    | 0011 | 1010 | 0011 | 0000 |
   5             !(AB) |      105 | 1 |   0    | 0100 | 0100 | 1100 | 1011 |
   6                !B |      125 | 1 |   0    | 0101 | 0000 | 1011 | 0100 |
   7               A^B |      145 | 1 |   0    | 0110 | 0101 | 1000 | 1101 |
   8             A(!B) |      165 | 1 |   0    | 0111 | 1001 | 0111 | 1000 |
   9              !A+B |      185 | 1 |   0    | 1000 | 0110 | 1000 | 1001 |
  10            !(A^B) |      205 | 1 |   0    | 1001 | 0101 | 1000 | 0010 |
  11                 B |      225 | 1 |   0    | 1010 | 1111 | 1100 | 1100 |
  12                AB |      245 | 1 |   0    | 1011 | 0011 | 0101 | 0001 |
  13                 1 |      265 | 1 |   0    | 1100 | 0011 | 0100 | 1111 |
  14              A+!B |      285 | 1 |   0    | 1101 | 0001 | 0110 | 1001 |
  15               A+B |      305 | 1 |   0    | 1110 | 0010 | 0001 | 0011 |
  16                 A |      325 | 1 |   0    | 1111 | 0010 | 1010 | 0010 |
  17                 A |      345 | 0 |   1    | 0000 | 1001 | 0100 | 1001 |
  18               A+B |      365 | 0 |   1    | 0001 | 0011 | 0110 | 0111 |
  19              A+!B |      385 | 0 |   1    | 0010 | 0011 | 1001 | 0111 |
  20   MINUS1(2'sComp) |      405 | 0 |   1    | 0011 | 1000 | 0100 | 1111 |
  21        AplusA(!B) |      425 | 0 |   1    | 0100 | 0011 | 1100 | 0110 |
  22    (A+B)plusA(!B) |      445 | 0 |   1    | 0101 | 0011 | 1100 | 0010 |
  23     AminusBminus1 |      465 | 0 |   1    | 0110 | 1011 | 0111 | 0011 |
  24       A(!B)minus1 |      485 | 0 |   1    | 0111 | 0111 | 1011 | 0011 |
  25           AplusAB |      505 | 0 |   1    | 1000 | 0011 | 0010 | 0101 |
  26            AplusB |      525 | 0 |   1    | 1001 | 0011 | 0011 | 0110 |
  27      (A+!B)plusAB |      545 | 0 |   1    | 1010 | 0010 | 0010 | 0001 |
  28          ABminus1 |      565 | 0 |   1    | 1011 | 1000 | 1000 | 0111 |
  29     AplusA(shift) |      585 | 0 |   1    | 1100 | 0011 | 0011 | 0110 |
  30        (A+B)plusA |      605 | 0 |   1    | 1101 | 0100 | 0100 | 1000 |
  31       (A+!B)plusA |      625 | 0 |   1    | 1110 | 0101 | 1110 | 1010 |
  32           Aminus1 |      645 | 0 |   1    | 1111 | 1111 | 0101 | 1110 |
  33            Aplus1 |      665 | 0 |   0    | 0000 | 1001 | 0100 | 1010 |
  34          A+Bplus1 |      685 | 0 |   0    | 0001 | 0011 | 0110 | 1000 |
  35         A+!Bplus1 |      705 | 0 |   0    | 0010 | 0011 | 1001 | 1000 |
  36              ZERO |      725 | 0 |   0    | 0011 | 1000 | 0100 | 0000 |
  37   AplusA(!B)plus1 |      745 | 0 |   0    | 0100 | 0011 | 1100 | 0111 |
  38   (A+B)plusA(!B)1 |      765 | 0 |   0    | 0101 | 0011 | 1100 | 0011 |
  39           AminusB |      785 | 0 |   0    | 0110 | 1011 | 0111 | 0100 |
  40             A(!B) |      805 | 0 |   0    | 0111 | 0111 | 1011 | 0100 |
  41      AplusABplus1 |      825 | 0 |   0    | 1000 | 0011 | 0010 | 0110 |
  42       AplusBplus1 |      845 | 0 |   0    | 1001 | 0011 | 0011 | 0111 |
  43    (A+!B)plusABp1 |      865 | 0 |   0    | 1010 | 0010 | 0010 | 0010 |
  44                AB |      885 | 0 |   0    | 1011 | 1000 | 1000 | 1000 |
  45   AplusA(shift)p1 |      905 | 0 |   0    | 1100 | 0011 | 0011 | 0111 |
  46   (A+B)plusAplus1 |      925 | 0 |   0    | 1101 | 0100 | 0100 | 1001 |
  47     (A+!B)plusAp1 |      945 | 0 |   0    | 1110 | 0101 | 1110 | 1011 |
  48                 A |      965 | 0 |   0    | 1111 | 1111 | 0101 | 1111 |

 VECTORS:   48
  ERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file jeff_74x181_tb.vcd file with GTKWave,

```bash
gtkwave -f jeff_74x181_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f jeff_74x181_tb.gtkw &
```

![jeff_74x181-waveform.jpg](../../../docs/pics/combinational-logic/jeff_74x181-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
