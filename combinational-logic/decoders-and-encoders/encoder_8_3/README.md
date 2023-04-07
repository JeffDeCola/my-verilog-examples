# ENCODER 8-3 EXAMPLE

_Encoder - Eights inputs (1 hot) encodes to output._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3#schematic)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder_8_3#tested-in-hardware---burned-to-a-fpga)

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

![IMAGE - encoder-8-3.jpg - IMAGE](../../../docs/pics/encoder-8-3.jpg)

## VERILOG CODE

The
[encoder_8_3.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/encoder_8_3/encoder_8_3.v)
uses behavioral modeling,

```verilog
    reg  [2:0] out;

    always @ ( * ) begin
        case(in)
            8'b00000001 : out <= 3'b000;
            8'b00000010 : out <= 3'b001;
            8'b00000100 : out <= 3'b010;
            8'b00001000 : out <= 3'b011;
            8'b00010000 : out <= 3'b100;
            8'b00100000 : out <= 3'b101;
            8'b01000000 : out <= 3'b110;
            8'b10000000 : out <= 3'b111;
            default     : out <= 3'b000;
        endcase
    end
 ```

## RUN (SIMULATE)

I created,

* [encoder_8_3_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/encoder_8_3/encoder_8_3_tb.v)
the testbench
* [encoder_8_3.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/encoder_8_3/encoder_8_3.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/combinational-logic/decoders-and-encoders/encoder_8_3/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o encoder_8_3_tb.vvp encoder_8_3_tb.v encoder_8_3.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp encoder_8_3_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file encoder_8_3_tb.vcd file with GTKWave,

```bash
gtkwave -f encoder_8_3_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f encoder_8_3_tb.gtkw &
```

![encoder_8_3-waveform.jpg](../../../docs/pics/encoder_8_3-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
