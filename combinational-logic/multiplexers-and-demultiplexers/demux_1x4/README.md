# DEMUX 1x4 EXAMPLE

_Demultiplexer - One input, four outputs (using a case statement)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4#schematic)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4#tested-in-hardware---burned-to-a-fpga)

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

This may help,

![IMAGE - demux-1x4.jpg - IMAGE](../../../docs/pics/demux-1x4.jpg)

## VERILOG CODE

The
[demux_1x4.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4/demux_1x4.v)
uses behavioral modeling,

```verilog
    reg  a, b, c, d;

    always @ ( * ) begin
        case(sel)
            2'b00 : begin
                a <= y; b <= 0; c <= 0; d <= 0;
            end
            2'b01 : begin
                a <= 0; b <= y; c <= 0; d <= 0;
            end
            2'b10 : begin
                a <= 0; b <= 0; c <= y; d <= 0;
            end
            2'b11 : begin
                a <= 0; b <= 0; c <= 0; d <= y;
            end
        endcase
    end
```

## RUN (SIMULATE)

I created,

* [demux_1x4_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4/demux_1x4_tb.v)
  the testbench
* [demux_1x4.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4/demux_1x4.vh)
  the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/multiplexers-and-demultiplexers/demux_1x4/run-simulation.sh)
  a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o demux_1x4_tb.vvp demux_1x4_tb.v demux_1x4.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp demux_1x4_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file demux_1x4_tb.vcd file with GTKWave,

```bash
gtkwave -f demux_1x4_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f demux_1x4_tb.gtkw &
```

![demux_1x4-waveform.jpg](../../../docs/pics/demux_1x4-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
