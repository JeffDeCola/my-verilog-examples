# FULL ADDER EXAMPLE

_A 2-bit full adder._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full_adder#overview)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full_adder#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full_adder#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full_adder#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/data-operators/full_adder#tested-in-hardware---burned-to-a-fpga)

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

## VERILOG CODE

The
[full_adder.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/data-operators/full_adder/full_adder.v)
uses behavioral modeling,

```verilog
    reg sum, cout;

    always @ ( a or b or cin) begin
        {cout, sum} <= a + b + cin;
    end
```

## RUN (SIMULATE)

I created,

* [full_adder_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/data-operators/full_adder/full_adder_tb.v)
the testbench
* [full_adder.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/data-operators/full_adder/full_adder.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/data-operators/full_adder/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o full_adder_tb.vvp full_adder_tb.v full_adder.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp full_adder_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file full_adder_tb.vcd file with GTKWave,

```bash
gtkwave -f full_adder_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f full_adder_tb.gtkw &
```

![full_adder-waveform.jpg](../../../docs/pics/full_adder-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
