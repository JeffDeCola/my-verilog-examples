  _built with
  [concourse](https://github.com/JeffDeCola/my-verilog-examples/blob/master/ci-README.md)_

# OVERVIEW

_Each example uses
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
to view the waveform. I also used
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
to synthesize and program these verilog examples on a
[Digilent ARTY-S7](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/fpga-development-boards/digilent-arty-s7-cheat-sheet)
FPGA development board._

I declare my ports as follows because that's what the synthesis tools want.
Who am I to argue.

```verilog
    module NAME (
        input             a,     // Input A
        input       [7:0] b,     // Input B
        output reg  [3:0] y      // Output Y
    );
```

Also, I would stay away from asynchronous design.  It can have problems
when you synthesize to an FPGA.

```verilog

    // DO THIS
    always @(posedge clk) begin
        if (~reset) begin
            ...

    // NOT THIS
    always @(posedge clk or negedge reset) begin

```

Each example has the following 4 files,

* `*.v` - The verilog code files(s)
* `*.vh` - A header file listing the included verilog files
* `*_tb.v` - The verilog testbench code
* `*_tb.tv` - Test vectors used with the testbench

The artifacts created are,

* `*_tb.vvp` - The verilog compiled code to be used by the simulator
* `*_tb.vcd` - The dump of the waveform data
* `*_tb.gtkw` - The GTKWave saved waveform

## BASIC CODE

* COMBINATIONAL LOGIC

  * [and2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/and2)

    _2-input AND gate used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [nand4](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4)

    _4-input NAND gate used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [nor2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2)

    _2-input NOR gate used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [not1](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/not1)

    _NOT gate used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [or2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/or2)

    _2-input OR gate used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [xor2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/xor2)

    _2-input XOR gate used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

* SEQUENTIAL LOGIC

  * [sr_latch](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_latch)

     _A sr (set ready) latch stores data but output changes on input._

  * [sr_flip_flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/sr_flip_flop)

     _A sr (set ready) flip-flop stores data on level of clock
     but can have an unknown output._

  * [jk_flip_flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/jk_flip_flop)

     _A jk (Jack Kilby (set clear)) flip-flop is a sr flip-flop with added
     feedback to prevent an unknown output._

  * [jk_flip_flop_sync_clear](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/jk_flip_flop_sync_clear)

     _A positive edge jk flip-flop with synchronous clear
    used in my
    [jeff_74x161](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161)._

  * [t_flip_flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/t_flip_flop)

     _A t (toggle) flip-flop is a single input jk flip flop
     which toggles output according to input._

  * [d_flip_flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/d_flip_flop)

     _A d (data) flip-flop which stores data on clock level._

  * [d_flip_flop_pos_edge](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/d_flip_flop_pos_edge)

     _A d (data) flip-flop which stores data on posedge of clock
     (Used to be called master-slave d flip-flop)._

  * [d_flip_flop_pos_edge_sync_en](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/d_flip_flop_pos_edge_sync_en)

     _A positive edge d flip-flop with synchronous enable
    used in my
    [jeff_74x377](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377)._

## COMBINATIONAL LOGIC

* ALUs

  * [jeff_74x181](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff_74x181)

    _4-bit alu (arithmetic logic unit) and function generator.
    Provides 16 binary logic operations and 16 arithmetic operations
    on two 4-bit words.
    Based on the 7400-series integrated circuits used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

* DATA OPERATORS

  * [full_adder](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full_adder)

    _A 2-bit full-adder._

  * [half_adder](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/half_adder)

    _A 2-bit half-adder._

* DECODERS & ENCODERS

  * [decoder_3_8](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8)

    _Decoder - Three inputs decodes to 1 of 8 outputs (hot)._

  * [decoder_to_encoder](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_to_encoder)

    _Combining the
    [decoder_3_8](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8)
    to the
    [encoder_8_3](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3)
    to prove the input will equal
    the output._

  * [encoder_8_3](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3)

    _Encoder - Eights inputs (1 hot) encodes to output._

* MULTIPLEXERS & DEMULTIPLEXERS

  * [demux_1x4](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4)

    _Demultiplexer - One input, four outputs (using a case statement)._

  * [jeff_74x151](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff_74x151)

    _8-line to 1-line data selector/multiplexer.
    Based on the 7400-series integrated circuits used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [jeff_74x157](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff_74x157)

    _Quad 2-line to 1-line data selector/multiplexer, non-inverting outputs.
    Based on the 7400-series integrated circuits used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my_verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [mux_4x1](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1)

    _Multiplexer - Four inputs, one output (using a case statement)._

  * [mux_to_demux](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_to_demux)

    _Combining the
    [mux_4x1](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux_4x1)
    to the
    [demux_1x4](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4)
    to prove the input will equal
    the output (for the selected output)._

## FPGA DEVELOPMENT BOARDS

* BUTTONS

  * [buttons](https://github.com/JeffDeCola/my-verilog-examples/tree/master/fpga-development-boards/buttons/buttons)

    _A few different ways to use buttons on a FPGA development board._

## SEQUENTIAL LOGIC

* ARBITERS

  * [priority_arbiter](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority_arbiter)

    _A three level Priority Arbiter with asynchronous reset
    (using if-then-else statements)._

* COUNTERS

  * [jeff_74x161](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161)

    _Synchronous presettable 4-bit binary counter, asynchronous clear.
    Based on the 7400-series integrated circuits used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

* FINITE STATE MACHINES

  * [pattern_recognition](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition)

    _Recognize the pattern 00110 in a serial stream._

* MEMORY

  * [simple_memory_using_1d_array](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple_memory_using_1d_array)

    _A simple 16 Byte memory modeled using a 1D array._

* REGISTERS

    _A bunch of flip-flops._

  * [jeff_74x377](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff_74x377)

    _8-bit register, clock enable.
    Based on the 7400-series integrated circuits used in my
    [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

  * [simple_8_bit_register](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple_8_bit_register)

    _A simple 8-bit register with synchronous load and clear._

* SHIFTERS

  * [left_shift_register](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left_shift_register)

    _A 4-bit left shift register._

## SYSTEMS

* MICROPROCESSORS

  * [programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)

    _A programable 8-bit microprocessor. Originally designed in VHDL for part of
    [my master's thesis](https://github.com/JeffDeCola/my_masters_thesis)._

* PIPELINES

  * [simple_pipeline](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline)

    _A simple pipeline._

.
.
.

Latches and flip flops are part of sequential logic,
a digital system that stores data and outputs changes on input.

LATCHES

* 1-bit storage
* **No clk** (part of an asynchronous system)
* Outputs **level-triggered** from inputs (asynchronous)

FLIP-FLOPS

* A latch that is controlled by a clock
* **Uses clk** (part of synchronous system)
* Outputs are **edge-triggered** from a clk
* Outputs can also be **level-triggered** from an input

.
.
.

SR LATCH

_A sr (set ready) latch is level-triggered and
is the basic building block of all flip-flops.

* **level-triggered**
* The input s=0 sets the output to 1
* The input r=0 resets the output to 0
* Forms the basic building blocks of all other types of flip-flops

|  s  |  r  |  q  | comment     |
|:---:|:---:|:---:|:------------|
|  0  |  0  |  X  | INVALID     |
|  0  |  1  |  1  | SET         |
|  1  |  0  |  0  | RESET       |
|  1  |  1  |  q  | NO CHANGE   |

SR FLIP-FLOP

_A sr (set ready) flip-flop is edge-triggered and
operational when clk/en is 1.
It sets q to 1 when s is 1 and
resets q to 0 when r is 1._

* A **sr flip-flop** controlled by clk is **edge-triggered**
* A **sr latch with enable** controlled by en is **level-triggered**
* Operational when clk/en is 1
* Built with a sr-latch
* The input s=1 sets the output to 1
* The input r=1 resets the output to 0

| clk/en |  s  |  r  |  q  | comment     |
|:------:|:---:|:---:|:---:|:------------|
|  0     |  X  |  X  |  q  | NO CHANGE   |
|  1     |  0  |  0  |  q  | NO CHANGE   |
|  1     |  0  |  1  |  0  | RESET       |
|  1     |  1  |  0  |  1  | SET         |
|  1     |  1  |  1  |  X  | INVALID     |

JK FLIP-FLOP

_A jk flip-flop is edge-triggered and
operational when clk/en is 1._
It operates like a sr flip-flop with an additional
toggle when both j and k are 1._

* A **jk flip-flop** controlled by clk is **edge-triggered**
* A **jk latch with enable** controlled by en is **level-triggered**
* Operational when clk/en is 1
* Built with a sr-latch
* The input j=1 sets the output to 1
* The input k=1 resets the output to 0
* An enhanced sr flip-flop that can use the 1 1 state as a toggle

| clk/en |  j  |  k  |  q  | comment     |
|:------:|:---:|:---:|:---:|:------------|
|  0     |  X  |  X  |  q  | NO CHANGE   |
|  1     |  0  |  0  |  q  | NO CHANGE   |
|  1     |  0  |  1  |  0  | RESET       |
|  1     |  1  |  0  |  1  | SET         |
|  1     |  1  |  1  | ~q  | TOGGLE (Updated sr flip-flop) |

JK FLIP-FLOP SYNC CLEAR

_A jk flip-flop is edge-triggered with synchronous clear._

* Controlled by clock
* tbd

T FLIP-FLOP

_A t (toggle) flip-flop is edge-triggered and
operational when clk/en is 1.
It toggles the output._

* Controlled by clock
* If en was used instead of clk it would be a t latch
* tbd

D FLIP-FLOP

_A d (data) flip-flop is edge-triggered and
operational when clk/en is 1.
It sets q to d.

* Controlled by clock
* If en was used instead of clk it would be a d latch
* tbd

D FLIP-FLOP POS EDGE

_A d flip-flop which is pos edge-triggered._

* Controlled by clock
* Comprised of connecting two d flip-flops together
* Used to be called a master sl*ve flip flop
* tbd

D FLIP-FLOP POS EDGE SYNC ENABLE

_A d flip-flop which is pos edge-triggered with synchronous enable._

* Controlled by clock
* Comprised of connecting two d flip-flops together
* Adding an enable to a d flip-flop with a pos edge
