# SIMPLE PIPELINE EXAMPLE

_A simple pipeline._

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline#schematic)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline#check-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/pipelines/simple_pipeline#tested-in-hardware---burned-to-a-fpga)

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

## SCHEMATIC

Pipeline the following into 3 stages,

```txt
    F = ((A+B) + (C-D)) * D
```

Hence,

```txt
    STAGE 1 Y1 = A + B, Y2 = C - D, D1 = D

    STAGE 2 Y3 = Y1 + Y2, D2 = D1

    STAGE 3 F = Y3 * D2
```

This may help,

![IMAGE - simple-pipeline.jpg - IMAGE](../../../docs/pics/simple-pipeline.jpg)

## VERILOG CODE

The
[simple_pipeline.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/systems/pipelines/simple_pipeline/simple_pipeline.v)
uses behavioral modeling,

```verilog
    // STAGE 1
    always @ (posedge clk) begin
        y1 <= a + b;
        y2 <= c - d;
        d1 <= d;
    end

    // STAGE 2
    always @ (posedge clk) begin
        y3 <= y1 + y2;
        d2 <=  d1;
    end

    // STAGE 3
    always @ (posedge clk) begin
        f <= y3 * d2;
    end
```

## RUN (SIMULATE)

I created,

* [simple_pipeline_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/systems/pipelines/simple_pipeline/simple_pipeline_tb.v)
  the testbench
* [simple_pipeline.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/systems/pipelines/simple_pipeline/simple_pipeline.vh)
  the header file listing the verilog code
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/systems/pipelines/simple_pipeline/run-simulation.sh)
  a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o simple_pipeline_tb.vvp simple_pipeline_tb.v simple_pipeline.vh
```

Use **vvp** to run the simulation, which creates a waveform dump file *.vcd.

```bash
vvp simple_pipeline_tb.vvp
```

## CHECK WAVEFORM

Open the waveform file simple_pipeline_tb.vcd file with GTKWave,

```bash
gtkwave -f simple_pipeline_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f simple_pipeline_tb.gtkw &
```

![simple_pipeline-waveform.jpg](../../../docs/pics/simple_pipeline-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
