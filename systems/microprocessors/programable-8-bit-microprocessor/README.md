# programable-8-bit-microprocessor example

_A programable 8-bit microprocessor I designed for my master's
[thesis](https://github.com/JeffDeCola/my-masters-thesis)._

Table of Contents,

* [TOP LEVEL](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/programable-8-bit-microprocessor#top-level)
* [HIERARCHY](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/programable-8-bit-microprocessor#hierarchy)
* [VERILOG CODE](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/programable-8-bit-microprocessor#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/programable-8-bit-microprocessor#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/programable-8-bit-microprocessor#check-waveform)

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## HIERARCHY

The processor is broken up as follows,

* **programable-8-bit-microprocessor (top)**
  * **control**
    * counter8
      * ta161 bar
    * ta157_8
    * opcodedec
      * ta157_4
        * ta157_ bar
    * ta151_bar
    * xor2
  * **processor**
    * register_ab8 (x5)
      * ta377_bar
    * ta157_8 (x2)
      * ta157_bar
    * alu
      * ta18l_bar
    * zp_bit

## TOP LEVEL

The top level is as follow,

![Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    ????????????????????????????
```

The top level code is
[programable-8-bit-microprocessor.v](programable-8-bit-microprocessor.v).

## RUN (SIMULATE)

I used my testbench
[programable-8-bit-microprocessor-tb.v](programable-8-bit-microprocessor-tb.v) with
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
