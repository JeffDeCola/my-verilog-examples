# programable-8-bit-microprocessor example

_A programable 8-bit microprocessor I designed in VHDL for my
[Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis).
As I translated it into verilog I wanted to change a few things,
but I kept it pure because of my thesis, so here it is._

Table of Contents,

* [STATS](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#stats)
* [TOP LEVEL (HOW IT WORKS)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#top-level-how-it-works)
  * [THE CONTROL AND PROCESSOR SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#the-control-and-processor-section)
* [OPCODE (THE USER INSTRUCTION SET)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#opcode-the-user-instruction-set)
* [MICROCODE (THE INTERNAL INSTRUCTIONS)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#microcode-the-internal-instructions)
  * [RESET (opcode 0000)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#reset-opcode-0000)
  * [ADD (opcode 0011)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#add-opcode-0011)
  * [SUBTRACT (opcode 0111)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#subtract-opcode-0111)
  * [MULTIPLY (opcode 1100)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#multiply-opcode-1100)
  * [DEFAULT](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#default)
* [MORE DETAIL (UNDER THE HOOD)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#more-detail-under-the-hood)
  * [CONTROL SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#control-section)
  * [PROCESSOR SECTION](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#processor-section)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#check-waveform)

Logic parts used,

* [and2](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/and2)
  2-input AND gate
* [nand4](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/nand4)
  4-input NAND gate
* [nor2](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/nor2)
  2-input OR gate
* [not1](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/not1)
  NOT gate
* [or2](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/or2)
  2-input OR gate
* [xor2](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/xor2)
  2-input XOR gate
* [d-flip-flop](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/sequential-logic/d-flip-flop)
  A positive edge d flip-flop with asynchronous enable (Used in jeff-74x377)
* [jk-flip-flop](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/sequential-logic/jk-flip-flop)
  A positive edge jk flip-flop with asynchronous clear (Used in jeff-74x161)
* [jeff-74x181](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/alus/jeff-74x181)
  4-bit alu (arithmetic logic unit) and function generator
* [jeff-74x151](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151)
  8-line to 1-line data selector/multiplexer
* [jeff-74x157](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x157)
  Quad 2-line to 1-line data selector/multiplexer, non-inverting outputs
* [jeff-74x161](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/sequential-logic/counters/jeff-74x161)
  Synchronous presettable 4-bit binary counter, asynchronous clear
* [jeff-74x377](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/sequential-logic/registers/jeff-74x377)
  8-bit register, clock enable

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## STATS

* Build around the
  [74x161](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/alus/jeff-74x181)
  ALU
  * 16 binary arithmetic operations
  * 16 logic operations
  * 4-bit words
* 8-bit data processing
* Up to 16 Opcodes
  * Programable via microcode
* Microcode
  * 256 x 24-bit microcode storage
  * 24-bit microword
* Pin count
  * 32 pins if using hardcoded internal microcode
    * 24 Input pins
    * 8 Output pins
  * 64 if using external microcode
    * 48 Input pins
    * 16 Output pins
* Synthesizable verilog code

## TOP LEVEL (HOW IT WORKS)

**Based on an instruction (opcode) this processor takes in data,
processes that data (via the alu and microcode instructions)
and spits out the result. That's about it.**

This may help,

![programable-8-bit-microprocessor.jpg](../../../docs/pics/programable-8-bit-microprocessor.jpg)

MAIN INPUTS,

* [3:0] **OPCODE** _The instruction like ADD and SUBTRACT_
* [7:0] **DATA_IN_A**
* [7:0] **DATA_IN_B**

OUTPUT,

* [7:0] **DATA_OUT**

OTHER INPUTS,

* **SYSTEM_CLK**  _Clock_
* **GO_BAR** _Active low kicks it off opcode_
* **JAM** _Active high will cause Microaddress to be 8'hff_
* **RESET** _Reset (active low) the counter (opcode 0000)_

### THE CONTROL AND PROCESSOR SECTION

This design is broken into two main sections,

* **TOP**
  ([programable-8-bit-microprocessor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/programable-8-bit-microprocessor.v))
  * **CONTROL_SECTION**
    ([control.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control/control.v))
    * The brains. Handles the opcode, microcode and control the process section
  * **PROCESSOR_SECTION**
    ([processor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/processor/processor.v))
    * Crunches the data controlled by the control section

A little more top level detail from my
[Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis),

![Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.1-Top-Level-Block-Diagram-of-the-8-bit-Microprocessor.jpg)

## OPCODE (THE USER INSTRUCTION SET)

The `opcode` (Operation Code) is the instruction set telling the processor
it what to do. Instructions are implemented in microroutines (i.e. microcode).
In this design there can be up to 16 opcodes.

This is what I have coded so far,

* [3:0] **OPCODE**
  * 0000:
    [RESET](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#reset-opcode-0000)
  * ...
  * 0011:
    [ADD](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#add-opcode-0011)
  * ...
  * 0111:
    [SUBTRACT](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#subtract-opcode-0111)
  * ...
  * 1100:
    [MULTIPLY](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor#multiply-opcode-1100)
  * ...  
  * 1111:
    _tbd_

## MICROCODE (THE INTERNAL INSTRUCTIONS)

The `microcode`are the internal instructions the processor uses
to accomplish the users opcode instruction.

The control section gets the microword **[23:0] MW** using the
**[7:0] MICROADDRESS**. Hence there can be up to 256 x 24-bit microwords.

Each opcode accesses a section of this memory.  Hence, there are 16
sections equally divided.

This may help,

![control-store-structure.jpg](../../../docs/pics/control-store-structure.jpg)

The 24-bit microword (MW) fields are as follows,

* [23:0] **MW**
  * [3:0] **MICRO_AD_LOW** _Input address into counter_
  * [7:4] **MICRO_AD_HIGH**
  * [8] **COUNT** _Enable Counter to count_
  * [12:9] **BOP** _Branch OPeration for counter that controls counter load_
  * [23:13] CONTROL_BITS
    * [13] **A_SOURCE** _Input to alu (input reg or temp reg)_
    * [14] **B_SOURCE**
    * [19:15] **ALU_FUNC** _The alu functions (refer to
      [jeff-74x181](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/alus/jeff-74x181))_
    * [20] **CIN** _Carry input for alu_
    * [23:21] **ALU_DEST** _Output from alu (temp or f reg)_

The first 13 bits are used in the control sections and the top 13 bits
are used in the process section.

The bits do the following actions,

| FIELD         | BITS     |  MEANING                                        | PNEUMONIC           |
|--------------:|---------:|:------------------------------------------------|---------------------|
| **ALU_DEST**  | 000      | F, TempB, TempA                                 | F_TB_TA             |
|               | 001      | F, TempB                                        | F_TB                |
|               | 010      | F, TempA                                        | F_TA                |
|               | 011      | F                                               | F                   |
|               | 100      | TempB, TempA                                    | TB_TA               |
|               | 101      | TempB                                           | TB                  |
|               | 110      | TempA                                           | TA                  |
|               | **111**  | **Result Not Stored (Default)**                 | NONE (DEFAULT)      |
|               |          |                                                 |                     |
| **CIN**       | 1        | Carry input                                     | NO_CARRY (DEFAULT)  |
|               | 0        | **No Carry (DEFAULT)**                          |                     |
|               |          |                                                 |                     |
| **ALU_FUNC**  | 0 0000   | M=0 ARITH -                                     |
|               | 0 0001   | M=0 ARITH -                                     |
|               | 0 0010   | M=0 ARITH -                                     |
|               | 0 0011   | M=0 ARITH -                                     |
|               | 0 0100   | M=0 ARITH -                                     |
|               | 0 0101   | M=0 ARITH -                                     |
|               | 0 0110   | M=0 ARITH - A MINUS B                           | A_MINUS_B           |
|               | 0 0111   | M=0 ARITH -                                     |
|               | 0 1000   | M=0 ARITH -                                     |
|               | 0 1001   | M=0 ARITH - A PLUS B                            | A_PLUS_B            |
|               | 0 1010   | M=0 ARITH -                                     |
|               | 0 1011   | M=0 ARITH -                                     |
|               | 0 1100   | M=0 ARITH -                                     |
|               | 0 1101   | M=0 ARITH -                                     |
|               | 0 1110   | M=0 ARITH -                                     |
|               | 0 1111   | M=1 ARITH - A MINUS 1                           | A_MINUS_1           |
|               | 1 0000   | M=1 LOGIC -                                     |
|               | 1 0001   | M=1 LOGIC -                                     |
|               | 1 0010   | M=1 LOGIC -                                     |
|               | 1 0011   | M=1 LOGIC - O                                   | 0                   |
|               | 1 0100   | M=1 LOGIC -                                     |
|               | 1 0101   | M=1 LOGIC -                                     |
|               | 1 0110   | M=1 LOGIC -                                     |
|               | 1 0111   | M=1 LOGIC -                                     |
|               | 1 1000   | M=1 LOGIC -                                     |
|               | 1 1001   | M=1 LOGIC -                                     |
|               | 1 1010   | M=1 LOGIC - B                                   | B                   |
|               | 1 1011   | M=1 LOGIC -                                     |
|               | 1 1100   | M=1 LOGIC - **1 (DEFAULT)**                     | 1 (DEFAULT)         |
|               | 1 1101   | M=1 LOGIC -                                     |
|               | 1 1110   | M=1 LOGIC -                                     |
|               | 1 1111   | M=1 LOGIC -                                     |                     |
|               |          |                                                 |                     |
| **B_SOURCE**  | **0**    | **Temp reg drives ALU (DEFAULT)**               | TEMP_B (DEFAULT)    |
|               | 1        | Input reg drives ALU                            | INPUT_B             |
|               |          |                                                 |                     |
| **A_SOURCE**  | **0**    | **Temp reg drives ALU (DEFAULT)**               | TEMP_A (DEFAULT)    |
|               | 1        | Input reg drives ALU                            | INPUT_A             |
|               |          |                                                 |                     |
| **BOP**       | 0 000    | COND_SELECT = STATUS_BITS[2] - **Branch on Z**  | Z (all 1s from alu) |
|               | 0 001    | COND_SELECT = low - ???                         |
|               | 0 010    | COND_SELECT = STATUS_BITS[0] - **Branch if C4** | C4                  |
|               | 0 011    | COND_SELECT = STATUS_BITS[1] - **Branch if C8** | C8                  |
|               | 0 100    | COND_SELECT = GO_BAR - **Branch if G0_BAR**     | GO_BAR              |
|               | 0 101    | COND_SELECT = STATUS_BITS[3] - **Branch if ZP** | ZP (all 0s from F)  |
|               | 0 110    | COND_SELECT = low - **Count (DEFAULT)**         | COUNT (DEFAULT)     |
|               | 0 111    | COND_SELECT = low - ???                         |
|               | 1 000    | COND_SELECT = STATUS_BITS[2] - **Branch if !Z** | !Z (all 1s from alu)|
|               | 1 001    | COND_SELECT = low - ???                         |
|               | 1 010    | COND_SELECT = STATUS_BITS[0] - **Branch if !C4**| !C4                 |
|               | 1 011    | COND_SELECT = STATUS_BITS[1] - **Branch if !C8**| !C8                 |
|               | 1 100    | COND_SELECT = GO_BAR - **Branch if !G0_BAR**    | !GO_BAR             |
|               | 1 101    | COND_SELECT = STATUS_BITS[3] - ???              | !ZP (all 0s from F) |
|               | 1 110    | COND_SELECT = low - **Branch Always**           | BRANCH              |
|               | 1 111    | COND_SELECT = low - **Branch on OP**            | OPCODE (LOAD A,B)   |
|               |          | **This Also loads REG A amd REG B**             |                     |
|               |          |                                                 |                     |
| **COUNT**     | **1**    | **Counter will count if not loaded (DEFAULT)**  | COUNT_IF_NO_LD (D)  |
|               | 0        | Counter will not count                          | NO_COUNT            |

The microcode is located in
[control-store.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control-store/control-store.v).

### RESET (opcode 0000)

This will put the processor into a known state and wait for go.
We use opcode 0000 since the counter is reset to 0000.
For some indication it's working correctly it also outputs 8'h11 to DATA_OUT
(i.e. the F register) to show it's in a wait state.

| ADDR | ALU_DEST | CIN | ALU_FUNC    | B_SOURCE | A_SOURCE |  BOP    | COUNT | ADDR |
|-----:|:--------:|:---:|:-----------:|:--------:|:--------:|:-------:|:-----:|:----:|
| 00   | F        |  0  | 1           | INPUT_B  | INPUT_A  | BRANCH  |   1   | OB   |
| 0B   | TB_TA    |  0  | 1           | INPUT_B  | INPUT_A  | COUNT   |   1   | XX   |
| 0C   | F        |  0  | 0           | INPUT_B  | INPUT_A  | COUNT   |   1   | XX   |
| OD   | F        |  0  | 1           | INPUT_B  | INPUT_A  | G0_BAR  |   1   | OD   |
| OE   | F        |  0  | 1           | INPUT_B  | INPUT_A  | OPCODE  |   1   | X1   |

### ADD (opcode 0011)

This will add A PLUS B. T The microcode is,

| ADDR | ALU_DEST | CIN | ALU_FUNC    | B_SOURCE | A_SOURCE |  BOP    | COUNT | ADDR |
|-----:|:--------:|:---:|:-----------:|:--------:|:--------:|:-------:|:-----:|:----:|
| 31   | F        |  0  | A_PLUS_B    | INPUT_B  | INPUT_A  | COUNT   |   1   | XX   |
| 32   | NONE     |  0  | 1           | INPUT_B  | INPUT_A  | !GO_BAR |   1   | 32   |
| 33   | F        |  0  | 0           | INPUT_B  | INPUT_A  | BRANCH  |   1   | 0D   |

### SUBTRACT (opcode 0111)

This will subtract A MINUS B. The microcode is,

| ADDR | ALU_DEST | CIN | ALU_FUNC    | B_SOURCE | A_SOURCE |  BOP    | COUNT | ADDR |
|-----:|:--------:|:---:|:-----------:|:--------:|:--------:|:-------:|:-----:|:----:|
| 71   | F        |  1  | A_MINUS_B   | INPUT_B  | INPUT_A  | COUNT   |   1   | XX   |
| 72   | NONE     |  0  | 1           | INPUT_B  | INPUT_A  | !GO_BAR |   1   | 72   |
| 73   | F        |  0  | 0           | INPUT_B  | INPUT_A  | BRANCH  |   1   | 0D   |

### MULTIPLY (opcode 1100)

This will multiply A TIMES B. Keep the numbers small to fit into 8-bits.

The microcode is,

| ADDR | ALU_DEST | CIN | ALU_FUNC    | B_SOURCE | A_SOURCE |  BOP    | COUNT | ADDR |
|-----:|:--------:|:---:|:-----------:|:--------:|:--------:|:-------:|:-----:|:----:|
| C1   | TB       |  0  | 0           | TEMP_B   | TEMP_A   | COUNT   |   1   | XX   |
| C2   | TA       |  0  | B           | INPUT_B  | TEMP_A   | Z       |   1   | C5   |
| C3   | TB       |  0  | A_PLUS_B    | TEMP_B   | INPUT_A  | COUNT   |   1   | XX   |
| C4   | TA       |  0  | A_MINUS_1   | TEMP_B   | TEMP_A   | !Z      |   1   | C3   |
| C5   | F        |  0  | B           | TEMP_B   | TEMP_A   | !GO_BAR |   0   | C5   |
| C6   | F        |  0  | 0           | INPUT_B  | INPUT_A  | BRANCH  |   1   | 0D   |

### DEFAULT

If system runs into trouble, it will default to this and send back to RESET.

| ADDR | ALU_DEST | CIN | ALU_FUNC    | B_SOURCE | A_SOURCE |  BOP    | COUNT | ADDR |
|-----:|:--------:|:---:|:-----------:|:--------:|:--------:|:-------:|:-----:|:----:|
| deflt| F        |  0  | 1           | INPUT_B  | INPUT_A  | BRANCH  |   1   | O0   |

## MORE DETAIL (UNDER THE HOOD)

Here is a little more detail of the control and processor sections.

### CONTROL SECTION

The control section has five main parts,

* **CONTROL_SECTION**
  ([control.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/control/control.v))
  * **COUNTER_8**
    ([counter8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/counter8.v))
    * COUNTER1
      ([ta161-bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta161-bar.v))
      * [jeff_74x161](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/sequential-logic/counters/jeff-74x161/jeff-74x161.v)
        _replaced ta161_
        * [jk_flip_flop](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/sequential-logic/jk-flip-flop/jk-flip-flop.v)
    * COUNTER2
      ([ta161-bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta161-bar.v))
      * [jeff_74x161](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/sequential-logic/counters/jeff-74x161/jeff-74x161.v)
        _replaced ta161_
        * [jk_flip_flop](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/sequential-logic/jk-flip-flop/jk-flip-flop.v)
  * **MUX8**
    ([ta157-8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157-8.v))
    * [jeff_74x157](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x157/jeff-74x157.v)
      _replaced ta157_bar & ta157_
  * **OPCODEDECO**
    ([opcodedec.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/opcode/opcodedec.v))
    * U1
      ([ta157-4.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157-4.v))
      * [jeff_74x157](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x157/jeff-74x157.v)
        _replaced ta157_bar_
    * U2
      ([nand4.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/nand4/nand4.v))
      _replaced nand4_
  * **COND_SELECT**
    ([ta151-bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta151-bar.v))
    * [jeff_74x151](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151/jeff-74x151.v)
      _replaced ta151_
  * **XOR_2**
    ([xor2.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/xor2/xor2.v))
    _replaced xor2_

![Figure-L.2-Control-Block-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.2-Control-Block-of-the-8-bit-Microprocessor.jpg)

### PROCESSOR SECTION

The processor is a collection of registers, muxes and an alu,

* **PROCESSOR_SECTION**
  ([processor.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/processor/processor.v))
  * **REGISTERA**
    ([register-ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register-ab8.v))
    * OR1
      ([or2.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/or2/or2.v))
      _replaced or2_
    * DFFS
      ([ta377-bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta377-bar.v))
      * [jeff_74x377](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/sequential-logic/registers/jeff-74x377/jeff-74x377.v)
        _replaced ta377_
        * [d_flip_flop](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/sequential-logic/d-flip-flop/d-flip-flop.v)
  * **REGISTERB**
    ([register-ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register-ab8.v))
    _See above_
  * **TEMP_REGISTER_A**
    ([register-ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register-ab8.v))
    _See above_
  * **TEMP_REGISTER_B**
    ([register-ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register-ab8.v))
    _See above_
  * **MUX_A**
    ([ta157-8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157-8.v))
    * [jeff_74x157](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x157/jeff-74x157.v)
      _replaced ta157_bar_
  * **MUX_B**
    ([ta157-8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta157-8.v))
    * [jeff_74x157](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x157/jeff-74x157.v)
      _replaced ta157_bar_
  * **ALU1**
    ([alu.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/alu/alu.v))
    * U1
      ([ta181-bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta181-bar.v))
      * [jeff_74x181](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/combinational-logic/alus/jeff-74x181/jeff-74x181.v)
        _replaced ta181_
      * [not1](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/not1/not1.v)
        _replaced inv_
    * U2
      ([ta181-bar.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/ta181-bar.v))
      * [jeff_74x181](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/combinational-logic/alus/jeff-74x181/jeff-74x181.v)
        _replaced ta181_
      * [not1](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/not1/not1.v)
        _replaced inv_
    * AND1
      ([and2.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/and2/and2.v))
      _replaced and2_
  * **F_REGISTER**
    ([register-ab8.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/register-ab8.v))
    _See above_
  * **ZP_BIT1**
    ([zp-bit.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/systems/microprocessors/programable-8-bit-microprocessor/core-parts/zp-bit.v))
    * U1, U2, U3, U4 ([nor2.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/nor2/nor2.v))
      _Replaced nor2_
    * U5 ([nand4.v](https://github.com/JeffDeCola/my-systemverilog-examples/blob/master/basic-code/combinational-logic/nand4/nand4.v))
      _Replaced nand4_

![Figure-L.3-Processor-Block-of-the-8-bit-Microprocessor.jpg](https://github.com/JeffDeCola/my-masters-thesis/blob/master/appendices/appendix-l/figures/Figure-L.3-Processor-Block-of-the-8-bit-Microprocessor.jpg)

## RUN (SIMULATE)

I used my testbench
[programable-8-bit-microprocessor-tb.v](programable-8-bit-microprocessor-tb.v) with
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and create a `.vcd` file.

```bash
sh run-test.sh
```

This simulation will send a few opcodes to the processor.

```verilog
    // ******************************************************
    // TEST 1 - ADD TWO NUMBERS
    OPCODE = 4'h1;
    DATA_IN_A = 8'h04;
    DATA_IN_B = 8'h03;
    GO_BAR = 1;

    #20; GO_BAR = 0;
    #100;

    // ******************************************************
    // TEST 2 - SUBTRACT TWO NUMBERS
    OPCODE = 4'h2;
    DATA_IN_A = 8'h07;
    DATA_IN_B = 8'h02;
    GO_BAR = 1;

    #20; GO_BAR = 0;
    #100;
```

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer.

I used [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
and launch it using
[launch-gtkwave.sh](launch-gtkwave.sh).
