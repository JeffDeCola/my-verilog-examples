# LIFO SYNCHRONOUS EXAMPLE

_A synchronous lifo using dual-port synchronous RAM._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#verilog-code)
  * [WRITE AND READ LOGIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#write-and-read-logic)
  * [WRITE AND READ PTRS](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#write-and-read-ptrs)
  * [COMPARE AND STATUS LOGIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#compare-and-status-logic)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/lifo_synchronous#tested-in-hardware---burned-to-a-fpga)

Documentation and Reference

* Using my
  [dual_port_ram_synchronous](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/memory/dual_port_ram_synchronous)

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

This fifo uses my dual port synchronous RAM.

The structure is,

![IMAGE - lifo_synchronous.jpg - IMAGE](../../../docs/pics/sequential-logic/lifo_synchronous.jpg)

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
[lifo_synchronous.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/lifo_synchronous/lifo_synchronous.v)
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

* [lifo_synchronous_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/lifo_synchronous/lifo_synchronous_tb.v)
  the testbench
* [lifo_synchronous_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/lifo_synchronous/lifo_synchronous_tb.tv)
  the test vectors and expected results

with,

* [lifo_synchronous.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/lifo_synchronous/lifo_synchronous.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/memory/lifo_synchronous/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o lifo_synchronous_tb.vvp lifo_synchronous_tb.v lifo_synchronous.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp lifo_synchronous_tb.vvp
```

The output of the test,

```text
??????
```

## VIEW WAVEFORM

Open the waveform file lifo_synchronous_tb.vcd file with GTKWave,

```bash
gtkwave -f lifo_synchronous_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f lifo_synchronous_tb.gtkw &
```

![lifo_synchronous-waveform.jpg](../../../docs/pics/sequential-logic/lifo_synchronous-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
