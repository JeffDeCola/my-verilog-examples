# DECODER 3-8 EXAMPLE

_Decoder - Three inputs decodes to 1 of 8 outputs (hot)._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8#schematic)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder_3_8#tested-in-hardware---burned-to-a-fpga)

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

![IMAGE - decoder-3-8.jpg - IMAGE](../../../docs/pics/decoder-3-8.jpg)

## VERILOG CODE

The
[decoder_3_8.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/decoder_3_8/decoder_3_8.v)
uses behavioral modeling,

```verilog
    reg  [7:0] out;

    always @ ( * ) begin
        case (in)
            3'b000 : out <= 8'b00000001;
            3'b001 : out <= 8'b00000010;
            3'b010 : out <= 8'b00000100;
            3'b011 : out <= 8'b00001000;
            3'b100 : out <= 8'b00010000;
            3'b101 : out <= 8'b00100000;
            3'b110 : out <= 8'b01000000;
            3'b111 : out <= 8'b10000000;
        endcase
    end
```

## RUN (SIMULATE)

I created,

* [decoder_3_8_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/decoder_3_8/decoder_3_8_tb.v)
the testbench
* [decoder_3_8.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/decoder_3_8/decoder_3_8.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/decoder_3_8/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o decoder_3_8_tb.vvp decoder_3_8_tb.v decoder_3_8.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp decoder_3_8_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file decoder_3_8_tb.vcd file with GTKWave,

```bash
gtkwave -f decoder_3_8_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f decoder_3_8_tb.gtkw &
```

![decoder_3_8-waveform.jpg](../../../docs/pics/decoder_3_8-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
