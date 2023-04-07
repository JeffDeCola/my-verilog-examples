# JEFF 74x151 EXAMPLE

_8-line to 1-line data selector/multiplexer.
Based on the 7400-series integrated circuits used in my
[programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)._

Table of Contents

* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151#check-waveform)
* [TESTED IN HARDWARE - BURNED TO AN FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/multiplexers-and-demultiplexers/jeff-74x151#tested-in-hardware---burned-to-an-fpga)

## VERILOG CODE

The main part of the code is,

```verilog
assign w = ~y;

always @ ( * ) begin
    if (!en) begin
        case({c,b,a})
            3'b000 : y <= d0;
            3'b001 : y <= d1;
            3'b010 : y <= d2;
            3'b011 : y <= d3;
            3'b100 : y <= d4;
            3'b101 : y <= d5;
            3'b110 : y <= d6;
            3'b111 : y <= d7;
        endcase
    end else begin
        y <= 1'b1;
    end
end
```

The entire code is
[jeff-74x151.v](jeff-74x151.v).

## RUN (SIMULATE)

I used my testbench
[jeff-74x151-tb.v](jeff-74x151-tb.v) with
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

![jeff-74x151-waveform.jpg](../../../docs/pics/jeff-74x151-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO AN FPGA

To test my design in real hardware, the above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
