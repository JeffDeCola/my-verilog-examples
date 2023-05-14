# SINGLE-PORT RAM SYNCHRONOUS EXAMPLE

_Single-port synchronous RAM._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/single_port_ram_synchronous#tested-in-hardware---burned-to-a-fpga)

## OVERVIEW

A single port RAM is a that RAM in which only one address can be accessed
at a particular time.
The address can be accessed for read operation or write operation.
I could of made this a bi-directional read.

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

![IMAGE - single_port_ram_synchronous.jpg - IMAGE](../../../docs/pics/sequential-logic/single_port_ram_synchronous.jpg)

## TRUTH TABLE

| we    | addr | data_in  | data_out                | comment     |
|:-----:|:----:|:--------:|:-----------------------:|:-----------:|
| 0     | 0000 | xxxxxxxx | data @addr              | READ 0000   |
| 1     | 1100 | 11110000 | data_out@last read addr | WRITE 1100  |

## VERILOG CODE

The
[single_port_ram_synchronous.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/single_port_ram_synchronous/single_port_ram_synchronous.v)
behavioral model,

```verilog
    // DATA TYPES
    reg [7:0] mem [0:15];         //RAM
    reg [3:0] address_register;

    // OUTPUT (THIS MAKES IT SYNCHRONOUS)
    assign data_out = mem[address_register];

    // RAM
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data_in;
        end else begin
            address_register <= addr;
        end
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [single_port_ram_synchronous_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/single_port_ram_synchronous/single_port_ram_synchronous_tb.v)
  the testbench
* [single_port_ram_synchronous_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/single_port_ram_synchronous/single_port_ram_synchronous_tb.tv)
  the test vectors and expected results

with,

* [single_port_ram_synchronous.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/single_port_ram_synchronous/single_port_ram_synchronous.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/single_port_ram_synchronous/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o single_port_ram_synchronous_tb.vvp single_port_ram_synchronous_tb.v single_port_ram_synchronous.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp single_port_ram_synchronous_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                 | TIME(ns) | WE | ADDR | DATA_IN | DATA_OUT |
                 ---------------------------------------------
   0        INIT |        0 | 1 | 0000 |   00000000   |   xxxxxxxx   |
   1       WRITE |       25 | 1 | 0000 |   11110000   |   xxxxxxxx   |
   2       WRITE |       45 | 1 | 0001 |   00001111   |   xxxxxxxx   |
   3       WRITE |       65 | 1 | 1110 |   10101010   |   xxxxxxxx   |
   4        READ |       85 | 0 | 0000 |   xxxxxxxx   |   xxxxxxxx   |
   4        READ |       90 | 0 | 0000 |   xxxxxxxx   |   11110000   |
   5        READ |      105 | 0 | 0001 |   xxxxxxxx   |   11110000   |
   5        READ |      110 | 0 | 0001 |   xxxxxxxx   |   00001111   |
   6        READ |      125 | 0 | 1110 |   xxxxxxxx   |   00001111   |
   6        READ |      130 | 0 | 1110 |   xxxxxxxx   |   10101010   |
   7       WRITE |      145 | 1 | 1001 |   00000111   |   10101010   |
   8       WRITE |      165 | 1 | 1111 |   11111010   |   10101010   |
   9       WRITE |      185 | 1 | 1100 |   00000011   |   10101010   |
  10       WRITE |      205 | 1 | 0010 |   00001111   |   10101010   |
  11        READ |      225 | 0 | 0001 |   xxxxxxxx   |   10101010   |
  11        READ |      230 | 0 | 0001 |   xxxxxxxx   |   00001111   |
  12        READ |      245 | 0 | 1111 |   xxxxxxxx   |   00001111   |
  12        READ |      250 | 0 | 1111 |   xxxxxxxx   |   11111010   |

 VECTORS:   12
  ERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file single_port_ram_synchronous_tb.vcd file with GTKWave,

```bash
gtkwave -f single_port_ram_synchronous_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f single_port_ram_synchronous_tb.gtkw &
```

![single_port_ram_synchronous-waveform.jpg](../../../docs/pics/sequential-logic/single_port_ram_synchronous-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
