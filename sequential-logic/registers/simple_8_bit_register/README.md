# SIMPLE 8-BIT REGISTER EXAMPLE

_A simple 8-bit register with synchronous load and clear._

Table of Contents

* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/registers/simple-8-bit-register#tested-in-hardware---burned-to-a-fpga)

## SCHEMATIC

This may help,

![IMAGE - simple-8-bit-register.jpg - IMAGE](../../../docs/pics/simple-8-bit-register.jpg)

## TRUTH TABLE

| clk       | clr_bar | ld_bar | IN    | OUT    |
|:---------:|:-------:|:------:|:-----:|:-------|
| pos tick  | 0       | X      | X     | 0      |
| pos tick  | 1       | 0      | 0     | 0      |
| pos tick  | 1       | 0      | 1     | 1      |
| pos tick  | 1       | 1      | X     | OUT    |

## VERILOG CODE

The main part of the code is,

```verilog
    always @ (posedge clk) begin
        if (~clr_bar) begin
            data_out <= 0;
        end else if (~ld_bar) begin
            data_out <= data_in;
        end
    end
```

The entire code is
[simple-8-bit-register.v](simple-8-bit-register.v).

## RUN (SIMULATE)

I used my testbench
[simple-8-bit-register-tb.v](simple-8-bit-register-tb.v) with
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and create a `.vcd` file.

```bash
sh run-test.sh
```

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer.

I used [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
and launch it using
[launch-gtkwave.sh](launch-gtkwave.sh).

![simple-8-bit-register-waveform.jpg](../../../docs/pics/simple-8-bit-register-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

To test my design in real hardware, the above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
