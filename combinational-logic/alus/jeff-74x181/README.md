# jeff-74x181 example

_4-bit arithmetic logic unit and function generator.
Provides 16 binary logic operations and
16 arithmetic operations on two 4-bit words.
This simple processor was designed in late 60's and the early 70s._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## FUNCTION TABLE

This is when the inputs/outputs are treated as active high.

| SELECT | M=1 LOGIC    | M=0 ARITHMETIC NO CARRY | M=0 ARITHMETIC WITH CARRY |
|:------:|--------------|-------------------------|---------------------------|
|  0000  | !A           | A                       | A plus 1                  |
|  0001  | !(A+B)       | A + B                   | A + B plus 1              |
|  0010  | (!A)B        | A + !B                  | A + !B plus 1             |
|  0011  | 0            | minus 1                 | 0                         |
|  0100  | !(AB)        | A plus A(!B)            | A plus A(!B) plus 1       |
|  0101  | !B           | (A+B) plus A(!B)        | (A+B) plus A(!B) plus 1   |
|  0110  | A ^ B        |                         |                           |
|  0111  |              |                         |                           |
|  1000  |              |                         |                           |
|  1001  |              |                         |                           |
|  1010  |              |                         |                           |
|  1011  |              |                         |                           |
|  1100  |              |                         |                           |
|  1101  |              |                         |                           |
|  1110  |              |                         |                           |
|  1111  |              |                         |                           |

## SCHEMATIC

I designed this processor form the 1972 Texas Instruments spec sheet.
I love the care and thought put into this.

![IMAGE - ti-74x181-schematic.jpg - IMAGE](../../../docs/pics/ti-74x181-schematic.jpg)

## VERILOG CODE

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

The simulation shall have the following results,

| SELECT | M | CI | FUNCTION                          |   A  |   B  |   F  |
|:------:|:-:|:--:|-----------------------------------|:----:|:----:|:----:|
|  0000  | 1 |  x |                                   | 0000 | 0000 | 0000 |
|  0001  | 1 |  x |                                   | 0000 | 0000 | 0000 |
|  0010  | 1 |  x |                                   |      |      |      |
|  0011  | 1 |  x |                                   |      |      |      |
|  0100  | 1 |  x |                                   |      |      |      |
|  0101  | 1 |  x |                                   |      |      |      |
|  0110  | 1 |  x |                                   |      |      |      |
|  0111  | 1 |  x |                                   |      |      |      |
|  1000  | 1 |  x |                                   |      |      |      |
|  1001  | 1 |  x |                                   |      |      |      |
|  1010  | 1 |  x |                                   |      |      |      |
|  1011  | 1 |  x |                                   |      |      |      |
|  1100  | 1 |  x |                                   |      |      |      |
|  1101  | 1 |  x |                                   |      |      |      |
|  1110  | 1 |  x |                                   |      |      |      |
|  1111  | 1 |  x |                                   |      |      |      |
|  0000  | 0 |  0 |                                   |      |      |      |
|  0001  | 0 |  0 |                                   |      |      |      |
|  0010  | 0 |  0 |                                   |      |      |      |
|  0011  | 0 |  0 |                                   |      |      |      |
|  0100  | 0 |  0 |                                   |      |      |      |
|  0101  | 0 |  0 |                                   |      |      |      |
|  0110  | 0 |  0 |                                   |      |      |      |
|  0111  | 0 |  0 |                                   |      |      |      |
|  1000  | 0 |  0 |                                   |      |      |      |
|  1001  | 0 |  0 |                                   |      |      |      |
|  1010  | 0 |  0 |                                   |      |      |      |
|  1011  | 0 |  0 |                                   |      |      |      |
|  1100  | 0 |  0 |                                   |      |      |      |
|  1101  | 0 |  0 |                                   |      |      |      |
|  1110  | 0 |  0 |                                   |      |      |      |
|  1111  | 0 |  0 |                                   |      |      |      |
|  0000  | 0 |  1 |                                   |      |      |      |
|  0001  | 0 |  1 |                                   |      |      |      |
|  0010  | 0 |  1 |                                   |      |      |      |
|  0011  | 0 |  1 |                                   |      |      |      |
|  0100  | 0 |  1 |                                   |      |      |      |
|  0101  | 0 |  1 |                                   |      |      |      |
|  0110  | 0 |  1 |                                   |      |      |      |
|  0111  | 0 |  1 |                                   |      |      |      |
|  1000  | 0 |  1 |                                   |      |      |      |
|  1001  | 0 |  1 |                                   |      |      |      |
|  1010  | 0 |  1 |                                   |      |      |      |
|  1011  | 0 |  1 |                                   |      |      |      |
|  1100  | 0 |  1 |                                   |      |      |      |
|  1101  | 0 |  1 |                                   |      |      |      |
|  1110  | 0 |  1 |                                   |      |      |      |
|  1111  | 0 |  1 |                                   |      |      |      |

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer.

I used [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
and launch it using
[launch-gtkwave.sh](launch-gtkwave.sh).
