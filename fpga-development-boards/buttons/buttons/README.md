# buttons example

_A few different ways to use buttons on a FPGA development board.._

Documentation and reference,

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main part of the code is,

```verilog
   ???;
```

The entire code is
[buttons.v](buttons.v).

## RUN (SIMULATE)

I used my testbench
[buttons-tb.v](buttons-tb.v) with
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

![buttons-waveform.jpg](../../../docs/pics/buttons-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

To test my design in real hardware, the above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
