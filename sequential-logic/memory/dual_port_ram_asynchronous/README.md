# DUAL-PORT RAM SYNCHRONOUS EXAMPLE

_Dual-port asynchronous RAM using two different clocks._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous#tested-in-hardware---burned-to-a-fpga)

## OVERVIEW

Dual-port RAM is a type of computer memory that allows
two separate devices to read and write data simultaneously.
This is achieved by having two separate access ports, one for each device.

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

![IMAGE - dual_port_ram_asynchronous.jpg - IMAGE](../../../docs/pics/sequential-logic/dual_port_ram_asynchronous.jpg)

## TRUTH TABLE

Each clk has it's own write enable (we) address (addr) and data,

| we    | addr | data_in  | data_out | comment     |
|:-----:|:----:|:--------:|:--------:|:-----------:|
| 0     | 0000 | xxxxxxxx | 00111100 | READ 0000   |
| 1     | 1100 | 11110000 | 11110000 | WRITE 1100  |

## VERILOG CODE

The
[dual_port_ram_asynchronous.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/dual_port_ram_asynchronous/dual_port_ram_asynchronous.v)
behavioral model,

```verilog
    // DATA TYPES
    reg [7:0] mem [0:15];
    reg [3:0] address_register_A, address_register_B;

    // OUTPUT (THIS MAKES IT SYNCHRONOUS)
    assign data_out_A = mem[address_register_A];
    assign data_out_B = mem[address_register_B];

    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk_A) begin
        if (we_A) begin
            mem[addr_A] <= data_in_A;
        end else begin
            address_register_A <= addr_A;
        end
    end

    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk_B) begin
        if (we_B) begin
            mem[addr_B] <= data_in_B;
        end else begin
            address_register_B <= addr_B;
        end
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [dual_port_ram_asynchronous_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/dual_port_ram_asynchronous/dual_port_ram_asynchronous_tb.v)
  the testbench
* [dual_port_ram_asynchronous_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/dual_port_ram_asynchronous/dual_port_ram_asynchronous_tb.tv)
  the test vectors and expected results

with,

* [dual_port_ram_asynchronous.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/dual_port_ram_asynchronous/dual_port_ram_asynchronous.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/dual_port_ram_asynchronous/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o dual_port_ram_asynchronous_tb.vvp dual_port_ram_asynchronous_tb.v dual_port_ram_asynchronous.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp dual_port_ram_asynchronous_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                     | TIME(ns) | WE_A | ADDR_A | DATA_IN_A | DATA_OUT_A | WE_B | ADDR_B | DATA_IN_B | DATA_OUT_B |
                     ----------------------------------------------------------------------------------------------
       0        INIT |       12 |                                        |  1   |  0000  | 00000000  |  xxxxxxxx  |
   0            INIT |       15 |  1   |  0000  | 00000000  |  xxxxxxxx  |
       1        WR_B |       26 |                                        |  1   |  0001  | 11110011  |  xxxxxxxx  |
   1            WR_A |       35 |  1   |  0000  | 11110000  |  xxxxxxxx  |
       2        WR_B |       40 |                                        |  1   |  0011  | 11001111  |  xxxxxxxx  |
       3        WR_B |       54 |                                        |  1   |  1111  | 11101010  |  xxxxxxxx  |
   2            WR_A |       55 |  1   |  0001  | 00001111  |  xxxxxxxx  |
       4        RD_B |       68 |                                        |  0   |  0001  | xxxxxxxx  |  00001111  |
   3            WR_A |       75 |  1   |  1110  | 10101010  |  xxxxxxxx  |
       5        RD_B |       82 |                                        |  0   |  0011  | xxxxxxxx  |  11001111  |
   4            RD_A |       95 |  0   |  0000  | xxxxxxxx  |  11110000  |
       6        RD_B |       96 |                                        |  0   |  1111  | xxxxxxxx  |  11101010  |
       7        RD_B |      110 |                                        |  0   |  1110  | xxxxxxxx  |  10101010  |
   5            RD_A |      115 |  0   |  0001  | xxxxxxxx  |  00001111  |
       8        RD_B |      124 |                                        |  0   |  1001  | xxxxxxxx  |  xxxxxxxx  |
   6            RD_A |      135 |  0   |  1110  | xxxxxxxx  |  10101010  |
       9        RD_B |      138 |                                        |  0   |  1111  | xxxxxxxx  |  11101010  |
      10        WR_B |      152 |                                        |  1   |  1111  | 00000000  |  00000000  |
   7            WR_A |      155 |  1   |  1001  | 00000111  |  10101010  |
      11        WR_B |      166 |                                        |  1   |  0001  | 00011000  |  00000000  |
   8            WR_A |      175 |  1   |  1111  | 11111010  |  10101010  |
      12        RD_B |      180 |                                        |  0   |  1111  | xxxxxxxx  |  11111010  |
      13        RD_B |      194 |                                        |  0   |  0001  | xxxxxxxx  |  00011000  |
   9            WR_A |      195 |  1   |  1100  | 00000011  |  10101010  |
  10            WR_A |      215 |  1   |  0010  | 00001111  |  10101010  |
  11            RD_A |      235 |  0   |  0001  | xxxxxxxx  |  00011000  |
  12            RD_A |      255 |  0   |  1111  | xxxxxxxx  |  11111010  |
  13            RD_A |      275 |  0   |  0001  | xxxxxxxx  |  00011000  |

 VECTORS_A:   14
  ERRORS_A:    0
 VECTORS_B:   14
  ERRORS_B:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file dual_port_ram_asynchronous_tb.vcd file with GTKWave,

```bash
gtkwave -f dual_port_ram_asynchronous_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f dual_port_ram_asynchronous_tb.gtkw &
```

![dual_port_ram_asynchronous-waveform.jpg](../../../docs/pics/sequential-logic/dual_port_ram_asynchronous-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
