# LEFT SHIFT REGISTER EXAMPLE

_A 4-bit left shift register._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left_shift_register#overview)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left_shift_register#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left_shift_register#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left_shift_register#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left_shift_register#tested-in-hardware---burned-to-a-fpga)

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
[left_shift_register.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/shifters/left_shift_register/left_shift_register.v)
uses behavioral modeling,

```verilog
reg [3:0] out;

always @ (posedge clk) begin
    if (rst) begin
        out <= 4'b0000;
    end else begin
        out <= {out[2:0], d};
    end
end
```

## RUN (SIMULATE)

I created,

* [left_shift_register_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/shifters/left_shift_register/left_shift_register_tb.v)
the testbench
* [left_shift_register.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/shifters/left_shift_register/left_shift_register.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/shifters/left_shift_register/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o left_shift_register_tb.vvp left_shift_register_tb.v left_shift_register.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp left_shift_register_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file left_shift_register_tb.vcd file with GTKWave,

```bash
gtkwave -f left_shift_register_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f left_shift_register_tb.gtkw &
```

![left_shift_register-waveform.jpg](../../../docs/pics/left_shift_register-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
