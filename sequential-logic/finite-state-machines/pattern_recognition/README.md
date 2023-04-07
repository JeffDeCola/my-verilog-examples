# PATTERN RECOGNITION EXAMPLE

_Recognize the pattern 00110 in a serial stream._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition#overview)
* [STATE DIAGRAM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition#state-diagram)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern_recognition#tested-in-hardware---burned-to-a-fpga)

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

## STATE DIAGRAM

This may help,

![IMAGE - pattern-recognition.jpg - IMAGE](../../../docs/pics/pattern-recognition.jpg)

## VERILOG CODE

The
[pattern_recognition.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/pattern_recognition/pattern_recognition.v)
uses behavioral modeling,

```verilog
    // FINITE STATE MACHINE
    always @ (current_state or in) begin
        case (current_state)
            S0: begin
                if (in) next_state <= S10;
                else    next_state <= S0;
            end
            S10: begin
                if (in) next_state <= S110;
                else    next_state <= S0;
            end
            S110: begin
                if (!in) next_state <= S0110;
                else    next_state <= S0;
            end
            S0110: begin
                if (!in) next_state <= S00110;
                else    next_state <= S0;
            end
            S00110:begin
                if (in) next_state <= S10;
                else    next_state <= S0;
            end
        endcase
    end
```

## RUN (SIMULATE)

I created,

* [pattern_recognition_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/pattern_recognition/pattern_recognition_tb.v)
the testbench
* [pattern_recognition.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/pattern_recognition/pattern_recognition.vh)
the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/pattern_recognition/run-simulation.sh)
a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o pattern_recognition_tb.vvp pattern_recognition_tb.v pattern_recognition.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp pattern_recognition_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file pattern_recognition_tb.vcd file with GTKWave,

```bash
gtkwave -f pattern_recognition_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f pattern_recognition_tb.gtkw &
```

![pattern_recognition-waveform.jpg](../../../docs/pics/pattern_recognition-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
