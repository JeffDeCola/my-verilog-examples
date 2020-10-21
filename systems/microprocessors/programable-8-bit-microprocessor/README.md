# programable-8-bit-microprocessor example

_A programable 8-bit microprocessor I designed for my
[Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis)._

Table of Contents,

* [HIERARCHY](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#hierarchy)
  * [TOP LEVEL](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#top-level)
  * [CONTROL_SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#controlsection)
  * [PROCESSOR SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#processor-section)
* [MICROWORD & OPCODE](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#microword--opcode)
* [VERILOG CODE](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#check-waveform)

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## HIERARCHY

The processor is broken up as follows,

* **TOP**
  ([programable-8-bit-microprocessor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/programable-8-bit-microprocessor.v))
  * **CONTROL_SECTION**
    ([control.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control/control.v))
    * **COUNTER8**
      ([counter8](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/counter8.v))
    * **MUX8**
      ([ta157_8]())
    * **OPCODEDEC**
      ([opcodedec]())
      * TBD
        ([ta157_4]())
        * TBD
          ([ta157_ bar]())
    * **COND_SELECT**
      ([ta151_bar]())
    * **XOR2**
      ([xor2]())
      * TBD
        ([ta161 bar]())
  * **PROCESSOR_SECTION**
      ([processor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/processor/processor.v))
    * **REGISTER_A**
      ([register_ab8]())
      * TBD
        ([ta377_bar]())
    * **REGISTER_B**
      ([register_ab8]())
      * TBD
        ([ta377_bar]())
    * **MUX_A**
      ([ta157_8]())
      * TBD
        ([ta157_bar]())
    * **MUX_B**
      ([ta157_8]())
      * TBD
        ([ta157_bar]())
    * **TEMP_REGISTER_A**
      ([register_ab8]())
      * TBD
        ([ta377_bar]())
    * **TEMP_REGISTER_B**
      ([register_ab8]())
      * TBD
        ([ta377_bar]())
    * **ALU**
      ([alu]())
      * TBD
        ([ta18l_bar]())
    * **REGISTER_F**
      ([register_ab8]())
      * TBD
        ([ta377_bar]())
    * **ZP_BIT**
      ([zp_bit]())

### TOP LEVEL

The top level is as follow,

![Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg)

### CONTROL_SECTION

The control section ?????

![Figure-L.2-Control-Block-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.2-Control-Block-of-the-8-bit-Microprocessor.jpg)

### PROCESSOR SECTION

The processor section ?????

![Figure-L.3-Processor-Block-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.3-Processor-Block-of-the-8-bit-Microprocessor.jpg)

## MICROWORD & OPCODE

The microword `MW` is broken up as,

* [3:0] MICRO_AD_LOW
* [7:4] MICRO_AD_HIGH
* [8] COUNT
* [12:9] BOP
* [23:13] CONTROL_BITS

The opcode is ????

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
