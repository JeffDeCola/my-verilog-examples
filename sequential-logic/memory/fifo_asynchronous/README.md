# FIFO ASYNCHRONOUS EXAMPLE

_An asynchronous fifo using dual-port asynchronous RAM._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#verilog-code)
  * [WRITE AND READ LOGIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#write-and-read-logic)
  * [WRITE AND READ PTRS](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#write-and-read-ptrs)
  * [COMPARE AND STATUS LOGIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#compare-and-status-logic)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/fifo_asynchronous#tested-in-hardware---burned-to-a-fpga)

Documentation and Reference

* Using my
  [dual_port_ram_asynchronous](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_asynchronous)

## OVERVIEW

A FIFO is a special type of buffer. The name FIFO stands for first in first out
and means that the data written into the buffer first comes out of it first.
A synchronous FIFO is a FIFO where the same clock is used for both reading and
writing.

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

This fifo uses my dual port asynchronous RAM.

The structure is,

![IMAGE - fifo_asynchronous.jpg - IMAGE](../../../docs/pics/sequential-logic/fifo_asynchronous.jpg)

The full and empy logic is,

![IMAGE - fifo_compare_and_status.jpg - IMAGE](../../../docs/pics/sequential-logic/fifo_compare_and_status.jpg)

## TRUTH TABLE

I made this more complicated then it should be,
but I wanted to show all the cases.
It's really just pushing and popping data
off the FIFO.

| rst | we | full | data_in  | re | empty | data_out | comment          |
|:---:|:--:|:----:|:--------:|:--:|:-----:|:--------:|:----------------:|
|  1  | 0  | 0    | xxxxxxxx | 0  | 0     | xxxxxxxx | RESETS PTRS      |
|  0  | 0  | 0    | xxxxxxxx | 0  | 0     | data_out | -                |
|  0  | 0  | 0    | xxxxxxxx | 0  | 1     | data_out | EMPTY            |
|  0  | 0  | 0    | xxxxxxxx | 1  | 0     | POP      | POP              |
|  0  | 0  | 0    | xxxxxxxx | 1  | 1     | data_out | NO POP - EMPTY   |
|  0  | 0  | 1    | xxxxxxxx | 0  | 0     | data_out | FULL             |
|  0  | 0  | 1    | xxxxxxxx | 0  | 1     | -        | N/A              |
|  0  | 0  | 1    | xxxxxxxx | 1  | 0     | POP      | FULL - POP       |
|  0  | 0  | 1    | xxxxxxxx | 1  | 1     | -        | N/A              |
|  0  | 1  | 0    | data     | 0  | 0     | data_out | PUSH             |
|  0  | 1  | 0    | data     | 0  | 1     | data_out | PUSH - EMPTY     |
|  0  | 1  | 0    | data     | 1  | 0     | POP      | PUSH - POP       |
|  0  | 1  | 0    | data     | 1  | 1     | data_out | N/A              |
|  0  | 1  | 1    | xxxxxxxx | 0  | 0     | data_out | NO PUSH - FULL   |
|  0  | 1  | 1    | xxxxxxxx | 0  | 1     | data_out | N/A              |
|  0  | 1  | 1    | xxxxxxxx | 1  | 0     | POP      | N/A              |
|  0  | 1  | 1    | xxxxxxxx | 1  | 1     | data_out | N/A              |

## VERILOG CODE

The
[fifo_asynchronous.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/fifo_asynchronous/fifo_asynchronous.v)
behavioral model,

### WRITE AND READ LOGIC

```verilog
    //If FIFO full write counter should not increment
    always @(*) begin
        if (we && (!full))
            w_next=1;
        else
            w_next=0;
    end
```

```verilog
    //If FIFO empty read counter should not increment
    always @(*) begin
        if (re && (!empty))
            r_next=1;
        else
            r_next=0;
    end
```

### WRITE AND READ PTRS

```verilog
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            w_ptr <= 3'b000;
        end else if (w_next) begin
            w_ptr <= w_ptr + 1;
        end else begin
            w_ptr <= w_ptr;
        end
    end
```

```verilog
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            r_ptr <= 3'b000;
        end else if (r_next) begin
            r_ptr <= r_ptr + 1;
        end else begin
            r_ptr <= r_ptr;
        end
    end
```

### COMPARE AND STATUS LOGIC

```verilog
    parameter depth = 4'b1111;  // Depth of the FIFO

    // DATA TYPES
    reg [3:0] ptr_diff;

    // FULL STATUS
    always @(*) begin
        if (ptr_diff == depth) begin
          full = 1'b1;
        end else begin
          full = 1'b0;
        end
    end

    // EMPTY STATUS
    always @(*) begin
        if (ptr_diff == 0) begin
          empty = 1'b1;
        end else begin
          empty = 1'b0;
        end
    end

    // HOW MUCH MEMORY USED
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(*) begin
        if (w_ptr > r_ptr) begin
            ptr_diff <= w_ptr - r_ptr + 1;
        end else if (w_ptr < r_ptr) begin
            ptr_diff <= (depth - r_ptr) + w_ptr + 1;
        end else if (w_ptr == r_ptr) begin
            ptr_diff <= 0;
        end
    end
```

## RUN (SIMULATE)

The testbench uses two files,

* [fifo_asynchronous_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/fifo_asynchronous/fifo_asynchronous_tb.v)
  the testbench
* [fifo_asynchronous_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/fifo_asynchronous/fifo_asynchronous_tb.tv)
  the test vectors and expected results

with,

* [fifo_asynchronous.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/fifo_asynchronous/fifo_asynchronous.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/fifo_asynchronous/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o fifo_asynchronous_tb.vvp fifo_asynchronous_tb.v fifo_asynchronous.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp fifo_asynchronous_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                     | TIME(ns) | WRST | RRST | PUSH | FULL | DATA_IN  | POP | EMPTY | DATA_OUT |
                     ----------------------------------------------------------------------------
       1        INIT |       14 |      |  0   |                        |  0  |   x   | xxxxxxxx |
   1            INIT |       15 |  0   |      |  0   |  x   | xxxxxxxx |
       2        RRST |       32 |      |  1   |                        |  0  |   1   | xxxxxxxx |
   2            WRST |       35 |  1   |      |  0   |  0   | xxxxxxxx |
       3           - |       50 |      |  0   |                        |  0  |   1   | xxxxxxxx |
   3          PUSH-1 |       55 |  0   |      |  1   |  0   | 00001111 |
       4           - |       68 |      |  0   |                        |  0  |   0   | 00001111 |
   4          PUSH-2 |       75 |  0   |      |  1   |  0   | 11110000 |
       5           - |       86 |      |  0   |                        |  0  |   0   | 00001111 |
   5          PUSH-3 |       95 |  0   |      |  1   |  0   | 10101010 |
       6        POP1 |      104 |      |  0   |                        |  1  |   0   | 00001111 |
   6          PUSH-4 |      115 |  0   |      |  1   |  0   | 11111111 |
       7       POP-2 |      122 |      |  0   |                        |  1  |   0   | 11110000 |
   7               - |      135 |  0   |      |  0   |  0   | xxxxxxxx |
       8       POP-3 |      140 |      |  0   |                        |  1  |   0   | 10101010 |
   8               - |      155 |  0   |      |  0   |  0   | xxxxxxxx |
       9       POP-4 |      158 |      |  0   |                        |  1  |   1   | 11111111 |
   9          PUSH-5 |      175 |  0   |      |  1   |  0   | 01010101 |
      10       POP-5 |      176 |      |  0   |                        |  1  |   1   | 01010101 |
      11           - |      194 |      |  0   |                        |  0  |   1   | xxxxxxxx |
  10               - |      195 |  0   |      |  0   |  0   | xxxxxxxx |
      12           - |      212 |      |  0   |                        |  0  |   1   | xxxxxxxx |
  11               - |      215 |  0   |      |  0   |  0   | xxxxxxxx |
      13           - |      230 |      |  0   |                        |  0  |   1   | xxxxxxxx |
  12               - |      235 |  0   |      |  0   |  0   | xxxxxxxx |
      14           - |      248 |      |  0   |                        |  0  |   1   | xxxxxxxx |
  13               - |      255 |  0   |      |  0   |  0   | xxxxxxxx |
      15           - |      266 |      |  0   |                        |  0  |   1   | xxxxxxxx |
  14          PUSH-6 |      275 |  0   |      |  1   |  0   | 10001111 |
      16           - |      284 |      |  0   |                        |  0  |   0   | 10001111 |
  15          PUSH-7 |      295 |  0   |      |  1   |  0   | 00001110 |
      17       POP-6 |      302 |      |  0   |                        |  1  |   0   | 10001111 |
  16          PUSH-8 |      315 |  0   |      |  1   |  0   | 00110011 |
      18           - |      320 |      |  0   |                        |  0  |   0   | 00001110 |
  17          PUSH-9 |      335 |  0   |      |  1   |  0   | 01111100 |
      19           - |      338 |      |  0   |                        |  0  |   0   | 00001110 |
  18         PUSH-10 |      355 |  0   |      |  1   |  0   | 01010101 |
      20           - |      356 |      |  0   |                        |  0  |   0   | 00001110 |
      21           - |      374 |      |  0   |                        |  0  |   0   | 00001110 |
  19         PUSH-11 |      375 |  0   |      |  1   |  0   | 01010101 |
      22           - |      392 |      |  0   |                        |  0  |   0   | 00001110 |
  20         PUSH-12 |      395 |  0   |      |  1   |  0   | 01010101 |
      23           - |      410 |      |  0   |                        |  0  |   0   | 00001110 |
  21         PUSH-13 |      415 |  0   |      |  1   |  0   | 01010101 |
      24           - |      428 |      |  0   |                        |  0  |   0   | 00001110 |
  22         PUSH-14 |      435 |  0   |      |  1   |  0   | 01010101 |
      25           - |      446 |      |  0   |                        |  0  |   0   | 00001110 |
  23         PUSH-15 |      455 |  0   |      |  1   |  0   | 01010101 |
      26           - |      464 |      |  0   |                        |  0  |   0   | 00001110 |
  24         PUSH-16 |      475 |  0   |      |  1   |  0   | 01010101 |
      27           - |      482 |      |  0   |                        |  0  |   0   | 00001110 |
  25         PUSH-17 |      495 |  0   |      |  1   |  0   | 01010101 |
      28           - |      500 |      |  0   |                        |  0  |   0   | 00001110 |
  26         PUSH-18 |      515 |  0   |      |  1   |  0   | 01010101 |
      29           - |      518 |      |  0   |                        |  0  |   0   | 00001110 |
  27         PUSH-19 |      535 |  0   |      |  1   |  0   | 01010101 |
      30           - |      536 |      |  0   |                        |  0  |   0   | 00001110 |
      31           - |      554 |      |  0   |                        |  0  |   0   | 00001110 |
  28         PUSH-20 |      555 |  0   |      |  1   |  0   | 01010101 |
      32       POP-7 |      572 |      |  0   |                        |  1  |   0   | 00001110 |
  29         PUSH-21 |      575 |  0   |      |  1   |  0   | 01010101 |
      33       POP-8 |      590 |      |  0   |                        |  1  |   0   | 00110011 |
  30         PUSH-22 |      595 |  0   |      |  1   |  0   | 01010101 |
      34       POP-9 |      608 |      |  0   |                        |  1  |   0   | 01111100 |
  31         PUSH-23 |      615 |  0   |      |  1   |  0   | 01010101 |
      35      POP-10 |      626 |      |  0   |                        |  1  |   0   | 01010101 |
  32               - |      635 |  0   |      |  0   |  0   | xxxxxxxx |
      36           - |      644 |      |  0   |                        |  0  |   0   | 01010101 |
  33               - |      655 |  0   |      |  0   |  0   | xxxxxxxx |
      37           - |      662 |      |  0   |                        |  0  |   0   | 01010101 |
  34               - |      675 |  0   |      |  0   |  0   | xxxxxxxx |
  35               - |      695 |  0   |      |  0   |  0   | xxxxxxxx |
  36               - |      715 |  0   |      |  0   |  0   | xxxxxxxx |
  37               - |      735 |  0   |      |  0   |  0   | xxxxxxxx |

 PUSHVECTORS:   37
  PUSHERRORS:    0
  POPVECTORS:   37
   POPERRORS:    0

TEST END ----------------------------------
```

## VIEW WAVEFORM

Open the waveform file fifo_asynchronous_tb.vcd file with GTKWave,

```bash
gtkwave -f fifo_asynchronous_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f fifo_asynchronous_tb.gtkw &
```

![fifo_asynchronous-waveform.jpg](../../../docs/pics/sequential-logic/fifo_asynchronous-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
