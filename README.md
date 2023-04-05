# MY VERILOG EXAMPLES

[![Tag Latest](https://img.shields.io/github/v/tag/jeffdecola/my-verilog-examples)](https://github.com/JeffDeCola/my-verilog-examples/tags)
[![codeclimate Issue Count](https://codeclimate.com/github/JeffDeCola/my-verilog-examples/badges/issue_count.svg)](https://codeclimate.com/github/JeffDeCola/my-verilog-examples/issues)
[![MIT License](http://img.shields.io/:license-mit-blue.svg)](http://jeffdecola.mit-license.org)
[![jeffdecola.com](https://img.shields.io/badge/website-jeffdecola.com-blue)](https://jeffdecola.com)

_A place to keep my synthesizable verilog examples._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples#overview)
* [BASIC CODE](https://github.com/JeffDeCola/my-verilog-examples#basic-code)
  * COMBINATIONAL LOGIC
  * SEQUENTIAL LOGIC
* [COMBINATIONAL LOGIC](https://github.com/JeffDeCola/my-verilog-examples#combinational-logic)
  * ALUs
  * DATA OPERATORS
  * DECODERS & ENCODERS
  * MULTIPLEXERS & DEMULTIPLEXERS
* [FPGA DEVELOPMENT BOARDS](https://github.com/JeffDeCola/my-verilog-examples#fpga-development-boards)
  * BUTTONS
* [SEQUENTIAL LOGIC](https://github.com/JeffDeCola/my-verilog-examples#sequential-logic)
  * ARBITERS
  * COUNTERS
  * FINITE SATE MACHINES
  * MEMORY
  * REGISTERS
  * SHIFTERS
* [SYSTEMS](https://github.com/JeffDeCola/my-verilog-examples#systems)
  * MICROPROCESSORS
  * PIPELINES

Documentation and Reference

* [verilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/languages/verilog-cheat-sheet)
  cheat sheet
* [iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
  is a free tool for simulation and synthesis
* [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
  is a free HDL waveform viewer
* [xilinx vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
  is a complete IDE for synthesis and analysis of HDL designs
* [digilent ARTY-S7](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/fpga-development-boards/digilent-arty-s7-cheat-sheet)
  is a FPGA development board
* My
  [Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis)
  has an explanation of HDLs and how they fit into frameworks
* My
  [Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis)
  also has my design of a
  [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)
* This repos
  [github webpage](https://jeffdecola.github.io/my-verilog-examples/)
  _built with
  [concourse](https://github.com/JeffDeCola/my-verilog-examples/blob/master/ci-README.md)_

## OVERVIEW

_Each example uses
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
to view the output. I also used
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
    always @ (posedge clk) begin
        if (~reset) begin
            ...

    // NOT THIS
    always @ (posedge clk or negedge reset) begin

```

To make things easier,
[launch-gtkwave.sh](launch-GTKWave-script/launch-gtkwave.sh)
will launch the
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
waveform viewer
from a `*.gtkw` file
on wsl2, macOS or linux.

## BASIC CODE

* COMBINATIONAL LOGIC

  * [and-gate](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/and-gate)

    _A few different ways to model an AND gate._

  * [and2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/and2)

    _2-input AND gate used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [nand4](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nand4)

    _4-input NAND gate used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [nor2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/nor2)

    _2-input NOR gate used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [not1](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/not1)

    _NOT gate used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [or2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/or2)

    _2-input OR gate used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [xor2](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/combinational-logic/xor2)

    _2-input XOR gate used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

* SEQUENTIAL LOGIC

  * [d-flip-flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/d-flip-flop)

     _A positive edge d flip-flop with synchronous enable
    used in my
    [jeff-74x377](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377)._

  * [jk-flip-flop](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/jk-flip-flop)

     _A positive edge jk flip-flop with synchronous clear
    used in my
    [jeff-74x161](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff-74x161)._

## COMBINATIONAL LOGIC

* ALUs

  * [jeff-74x181](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/alus/jeff-74x181)

    _4-bit alu (arithmetic logic unit) and function generator.
    Provides 16 binary logic operations and 16 arithmetic operations
    on two 4-bit words.
    Based on the 7400-series integrated circuits used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

* DATA OPERATORS

  * [full-adder](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full-adder)

    _A 2-bit full-adder._

  * [half-adder](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/half-adder)

    _A 2-bit half-adder._

* DECODERS & ENCODERS

  * [decoder-3-8](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-3-8)

    _Decoder - Three inputs decodes to 1 of 8 outputs (hot)._

  * [decoder-to-encoder](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-to-encoder)

    _Combining the
    [decoder-3-8](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-3-8)
    to the
    [encoder-8-3](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder-8-3)
    to prove the input will equal
    the output._

  * [encoder-8-3](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder-8-3)

    _Encoder - Eights inputs (1 hot) encodes to output._

* MULTIPLEXERS & DEMULTIPLEXERS

  * [demux-1x4](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux-1x4)

    _Demultiplexer - One input, four outputs (using a case statement)._

  * [jeff-74x151](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151)

    _8-line to 1-line data selector/multiplexer.
    Based on the 7400-series integrated circuits used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [jeff-74x157](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x157)

    _Quad 2-line to 1-line data selector/multiplexer, non-inverting outputs.
    Based on the 7400-series integrated circuits used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [mux-4x1](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux-4x1)

    _Multiplexer - Four inputs, one output (using a case statement)._

  * [mux-to-demux](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux-to-demux)

    _Combining the
    [mux-4x1](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/mux-4x1)
    to the
    [demux-1x4](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux-1x4)
    to prove the input will equal
    the output (for the selected output)._

## FPGA DEVELOPMENT BOARDS

* BUTTONS

  * [buttons](https://github.com/JeffDeCola/my-verilog-examples/tree/master/fpga-development-boards/buttons/buttons)

    _A few different ways to use buttons on a FPGA development board._

## SEQUENTIAL LOGIC

* ARBITERS

  * [priority-arbiter](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter)

    _A three level Priority Arbiter with asynchronous reset
    (using if-then-else statements)._

* COUNTERS

  * [jeff-74x161](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff-74x161)

    _Synchronous presettable 4-bit binary counter, asynchronous clear.
    Based on the 7400-series integrated circuits used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

* FINITE STATE MACHINES

  * [pattern-recognition](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern-recognition)

    _Recognize the pattern 00110 in a serial stream._

* MEMORY

  * [simple-memory-using-1d-array](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/simple-memory-using-1d-array)

    _A simple 16 Byte memory modeled using a 1D array._

* REGISTERS

    _A bunch of flip-flops._

  * [jeff-74x377](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/jeff-74x377)

    _8-bit register, clock enable.
    Based on the 7400-series integrated circuits used in my
    [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

  * [simple-8-bit-register](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register)

    _A simple 8-bit register with synchronous load and clear._

* SHIFTERS

  * [left-shift-register](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left-shift-register)

    _A 4-bit left shift register._

## SYSTEMS

* MICROPROCESSORS

  * [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)

    _A programable 8-bit microprocessor. Originally designed in VHDL for part of
    [my Master's Thesis](https://github.com/JeffDeCola/my-masters-thesis)._

* PIPELINES

  * [simple-pipeline](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple-pipeline)

    _A simple pipeline._
