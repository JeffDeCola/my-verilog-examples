# MEALY STATE MACHINE EXAMPLE

_Recognize the pattern 00110 in a serial stream.
Output depends on current state and current inputs._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/mealy_state_machine#overview)
* [STATE DIAGRAM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/mealy_state_machine#state-diagram)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/mealy_state_machine#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/mealy_state_machine#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/mealy_state_machine#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/mealy_state_machine#tested-in-hardware---burned-to-a-fpga)

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

![IMAGE - mealy_state_machine.jpg - IMAGE](../../../docs/pics/sequential-logic/mealy_state_machine.jpg)

## VERILOG CODE

The
[mealy_state_machine.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/mealy_state_machine/mealy_state_machine.v)
behavioral model,

```verilog
    // DATA TYPES
    reg [2:0] state;

    // STATES - BINARY ENCODED STYLE - USE ANY STYLE YOU WANT
    parameter [2:0] START     = 3'b000;
    parameter [2:0] ZERO      = 3'b001;
    parameter [2:0] WAIT      = 3'b010;
    parameter [2:0] S1        = 3'b011;
    parameter [2:0] S2        = 3'b100;
    parameter [2:0] S3        = 3'b101;

    // MEALY STATE MACHINE
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            state <= START;
            found <= 1'b0;
        end else begin
            case (state)
                START: begin
                    if (in==0)  begin state <= ZERO;  found <= 1'b0; end
                    else        begin state <= START; found <= 1'b0; end
                end
                ZERO: begin
                    if (in==0)  begin state <= WAIT;  found <= 1'b0; end
                    else        begin state <= START; found <= 1'b0; end
                end
                WAIT: begin
                    if (in==1)  begin state <= S1;    found <= 1'b0; end
                    else        begin state <= WAIT;  found <= 1'b0; end
                end
                S1: begin
                    if (in==1)  begin state <= S2;    found <= 1'b0; end
                    else        begin state <= ZERO;  found <= 1'b0; end
                end
                S2:begin
                    if (in==0)  begin state <= S3;    found <= 1'b0; end
                    else        begin state <= START; found <= 1'b0; end
                end
                S3:begin
                    if (in==1)  begin state <= START; found <= 1'b1; end // Found pattern
                    else        begin state <= WAIT;  found <= 1'b0; end
                end
            endcase
        end
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [mealy_state_machine_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/mealy_state_machine/mealy_state_machine_tb.v)
  the testbench
* [mealy_state_machine_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/mealy_state_machine/mealy_state_machine_tb.tv)
  the test vectors and expected results

with,

* [mealy_state_machine.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/mealy_state_machine/mealy_state_machine.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/finite-state-machines/mealy_state_machine/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o mealy_state_machine_tb.vvp mealy_state_machine_tb.v mealy_state_machine.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp mealy_state_machine_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                 | TIME(ns) | RST | IN | FOUND |
                 -------------------------------
   1        INIT |       15 |  0  | x  |   x   |
   2       RESET |       35 |  1  | 0  |   0   |
   3       START |       55 |  0  | 1  |   0   |
   4       START |       75 |  0  | 1  |   0   |
   5        ZERO |       95 |  0  | 0  |   0   |
   6        WAIT |      115 |  0  | 0  |   0   |
   7        WAIT |      135 |  0  | 0  |   0   |
   8        WAIT |      155 |  0  | 0  |   0   |
   9        WAIT |      175 |  0  | 0  |   0   |
  10          S1 |      195 |  0  | 1  |   0   |
  11          S2 |      215 |  0  | 1  |   0   |
  12          S3 |      235 |  0  | 0  |   0   |
  13       START |      255 |  0  | 1  |   1   |
  14       START |      275 |  0  | 1  |   0   |
  15        ZERO |      295 |  0  | 0  |   0   |
  16        WAIT |      315 |  0  | 0  |   0   |
  17        WAIT |      335 |  0  | 0  |   0   |
  18        WAIT |      355 |  0  | 0  |   0   |
  19        WAIT |      375 |  0  | 0  |   0   |
  20          S1 |      395 |  0  | 1  |   0   |
  21        ZERO |      415 |  0  | 0  |   0   |
  22        WAIT |      435 |  0  | 0  |   0   |
  23          S1 |      455 |  0  | 1  |   0   |
  24          S2 |      475 |  0  | 1  |   0   |
  25          S3 |      495 |  0  | 0  |   0   |
  26        WAIT |      515 |  0  | 0  |   0   |
  27        WAIT |      535 |  0  | 0  |   0   |
  28          S1 |      555 |  0  | 1  |   0   |
  29          S2 |      575 |  0  | 1  |   0   |
  30          S3 |      595 |  0  | 0  |   0   |
  31       START |      615 |  0  | 1  |   1   |
  32       START |      635 |  0  | 1  |   0   |
  33       START |      655 |  0  | 1  |   0   |

 VECTORS:   33
  ERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file mealy_state_machine_tb.vcd file with GTKWave,

```bash
gtkwave -f mealy_state_machine_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f mealy_state_machine_tb.gtkw &
```

![mealy_state_machine-waveform.jpg](../../../docs/pics/sequential-logic/mealy_state_machine-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
