# programable-8-bit-microprocessor example

_A programable 8-bit microprocessor I designed in VHDL for my
[Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis).
I translated it from VHDL to verilog._

Table of Contents,

* [TOP LEVEL](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#top-level)
* [OPCODE (THE USER INSTRUCTION)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#opcode-the-user-instruction)
* [MICROCODE (THE INTERNAL INSTRUCTIONS)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#microcode-the-internal-instructions)
  * [ADD](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#add)
  * [SUBTRACT](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#subtract)
* [CONTROL SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#control-section)
* [PROCESSOR SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#processor-section)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#check-waveform)

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## TOP LEVEL (HOW IT WORKS)

This processor takes DATA in and does stuff like ADD and SUBTRACT and
spits the data out.

For example, to ADD, the User supplies the processor with

* [3:0] **OPCODE** _The instruction like ADD and SUBTRACT_
* [7:0] **DATA_IN_A**
* [7:0] **DATA_IN_B**

In a few clock cycles the results is **[7:0] DATA_OUT** That's about it.

Here are the other inputs,

* **SYSTEM_CLK**  _Clock_
* **GO_BAR** _Kicks it off_
* **JAM** _tbd_
* **RESET** _tbd_

To accomplish this the processor is broken up into two sections,

* **TOP**
  ([programable-8-bit-microprocessor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/programable-8-bit-microprocessor.v))
  * **CONTROL_SECTION**
    ([control.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control/control.v))
  * **PROCESSOR_SECTION**
    ([processor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/processor/processor.v))

This may help,

![Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg)

## OPCODE (THE USER INSTRUCTION)

The `opcode` (Operation Code) is the instruction giving to my processor to tell
it what to do. In this design there can be up to 16 opcodes, two of which
I have programed (in microcode - next section) so far,

* 4'b0: _TBD_
* 4'h1: _TBD_
  [ADD](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#add)
* 4'h2:
  [SUBTRACT](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#subtract)
* 4'h3: _TBD_
* etc...
* 4'hF: _TBD_

## MICROCODE (THE INTERNAL INSTRUCTIONS)

The `microcode` contains up to 256 `microwords` (MW).
These are the internal instructions the processor uses
to accomplish the users opcode instruction. For example,
it takes a few internal instructions to accomplish ....???.

The 24-bit microword (MW) fields are,

* [3:0] **MICRO_AD_LOW**
* [7:4] **MICRO_AD_HIGH**
* [8] **COUNT**
* [12:9] **BOP**
* [23:13] CONTROL_BITS (for processor)
  * [13] **A_SOURCE**
  * [14] **B_SOURCE**
  * [19:15] **ALU_FUNC**
  * [20] **CIN**
  * [23:21] **ALU_DEST**

The microcode is located in
[control-store.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control-store/control-store.v).

### ADD

To accomplish an add opcode instruction, the microcode is,

| # | ALU_DEST | CIN | ALU_FUNC | B_SOURCE | A_SOURCE |  BOP | COUNT | MICRO_AD_HIGH | MICRO_AD_LOW |
|--:|:--------:|:---:|:--------:|:--------:|:--------:|:----:|:-----:|:-------------:|:------------:|
| 1 |    000   |  0  |   00000  |     0    |     0    | 0000 |   0   |      0000     |     0000     |
| 2 |    000   |  1  |   00000  |     0    |     1    | 0000 |   0   |      0000     |     0000     |
| 3 |    000   |  0  |   00000  |     1    |     0    | 0000 |   0   |      0000     |     0000     |
| 4 |    000   |  1  |   00000  |     0    |     1    | 0000 |   0   |      0000     |     0000     |

### SUBTRACT

To accomplish an subtract opcode instruction, the microcode is,

| # | ALU_DEST | CIN | ALU_FUNC | B_SOURCE | A_SOURCE |  BOP | COUNT | MICRO_AD_HIGH | MICRO_AD_LOW |
|--:|:--------:|:---:|:--------:|:--------:|:--------:|:----:|:-----:|:-------------:|:------------:|
| 1 |    000   |  0  |   00000  |     0    |     0    | 0000 |   0   |      0000     |     0000     |
| 2 |    000   |  1  |   00000  |     0    |     1    | 0000 |   0   |      0000     |     0000     |
| 3 |    000   |  0  |   00000  |     1    |     0    | 0000 |   0   |      0000     |     0000     |
| 4 |    000   |  1  |   00000  |     0    |     1    | 0000 |   0   |      0000     |     0000     |

## CONTROL SECTION

The control section has five main parts,

* **CONTROL_SECTION**
  ([control.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control/control.v))
  * **COUNTER_8**
    ([counter8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/counter8.v))
  * **MUX8**
    ([ta157_8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157_8.v))
  * **OPCODEDECO**
    ([opcodedec.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/opcode/opcodedec.v))
    * TBD
      ([ta157_4]())
    * TBD
      ([ta157_bar]())
  * **COND_SELECT**
    ([ta151_bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta151_bar.v))
  * **XOR_2**
    ([xor2.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/xor2.v))
    * TBD
      ([ta161 bar]())

![Figure-L.2-Control-Block-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.2-Control-Block-of-the-8-bit-Microprocessor.jpg)

## PROCESSOR SECTION

The processor is a collection of registers, muxes and an alu,

* **PROCESSOR_SECTION**
  ([processor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/processor/processor.v))
  * **REGISTERA**
    ([register_ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register_ab8.v))
    * TBD
      ([ta377_bar]())
  * **REGISTERB**
    ([register_ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register_ab8.v))
    * TBD
      ([ta377_bar]())
  * **TEMP_REGISTER_A**
    ([register_ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register_ab8.v))
    * TBD
        ([ta377_bar]())
  * **TEMP_REGISTER_B**
    ([register_ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register_ab8.v))
    * TBD
      ([ta377_bar]())
  * **MUX_A**
    ([ta157_8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157_8.v))
    * TBD
      ([ta157_bar]())
  * **MUX_B**
    ([ta157_8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157_8.v))
    * TBD
      ([ta157_bar]())
  * **ALU1**
    ([alu.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/alu/alu.v))
    * TBD
      ([ta18l_bar]())
  * **F_REGISTER**
    ([register_ab8](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register_ab8.v))
    * TBD
      ([ta377_bar]())
  * **ZP_BIT1**
    ([zp_bit.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/zp_bit.v))

![Figure-L.3-Processor-Block-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.3-Processor-Block-of-the-8-bit-Microprocessor.jpg)

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
