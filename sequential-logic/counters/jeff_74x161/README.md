# JEFF 74x161 EXAMPLE

_Synchronous presettable 4-bit binary counter, asynchronous clear.
Based on the 7400-series integrated circuits used in my
[programable_8_bit_microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable_8_bit_microprocessor)._

Documentation and Reference

* I'm using my
  [jk_flip_flop_pos_edge_sync_clear](https://github.com/JeffDeCola/my-verilog-examples/tree/master/basic-code/sequential-logic/jk_flip_flop_pos_edge_sync_clear)

Table of Contents

* [OVERVIEW](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#overview)
* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#schematic)
* [TRUTH TABLE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#truth-table)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#run-simulate)
* [VIEW WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#view-waveform)
* [TESTED IN HARDWARE - BURNED TO A FPGA](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/counters/jeff_74x161#tested-in-hardware---burned-to-a-fpga)

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

I designed this processor form the 1976 Texas Instruments spec sheet.
The `clr_bar` is connected directly to the JK flip-flops.

![IMAGE - ti-74x161-schematic.jpg - IMAGE](../../../docs/pics/sequential-logic/ti-74x161-schematic.jpg)

## TRUTH TABLE

| clr_bar | ld_bar | ent | enp | d | c | b | a | qd | qc  | qb  | qa  | rco | COMMENT |
|:-------:|:------:|:---:|:---:|:-:|:-:|:-:|:-:|:--:|:---:|:---:|:---:|:---:|:-------:|
|    1    |    1   |  0  |  0  | x | x | x | x | qd | qc  | qb  | qa  | rco | WAIT   :|
|    0    |    1   |  0  |  0  | x | x | x | x | 0  | 0   | 0   | 0   |  0  | CLEAR  :|
|    1    |    0   |  0  |  0  | d | c | b | a | d  | c   | b   | a   |  0  | LOAD   :|
|    1    |    1   |  1  |  1  | x | x | x | x | +  | +   | +   | +   |  0  | COUNT  :|

## VERILOG CODE

The
[jeff_74x161.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/counters/jeff_74x161/jeff_74x161.v)
dataflow and structural model.

```verilog
    wire ld;
    wire ent_and_enp;

    assign rco = ent & qd & qc & qb & qa;

    assign ld = ~ld_bar;
    assign ent_and_enp = ent & enp;

    assign feedback_qd = ent_and_enp & qc & qb & qa;

    output_section OUTPUT_QD (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qd),
        .clk(clk),
        .data(d),
        .q(qd)
    );

    assign feedback_qc =  ent_and_enp & qb & qa;

    output_section OUTPUT_QC (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qc),
        .clk(clk),
        .data(c),
        .q(qc)
    );

    assign feedback_qb = ent_and_enp & qa;

    output_section OUTPUT_QB (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qb),
        .clk(clk),
        .data(b),
        .q(qb)
    );

    assign feedback_qa = ent_and_enp;

    output_section OUTPUT_QA (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qa),
        .clk(clk),
        .data(a),
        .q(qa)
    );
```

## RUN (SIMULATE)

The testbench uses two files,

* [jeff_74x161_tb.v](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/counters/jeff_74x161/jeff_74x161_tb.v)
  the testbench
* [jeff_74x161_tb.tv](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/counters/jeff_74x161/jeff_74x161_tb.tv)
  the test vectors and expected results

with,

* [jeff_74x161.vh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/counters/jeff_74x161/jeff_74x161.vh)
  is the header file listing the verilog models
* [run-simulation.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/sequential-logic/counters/jeff_74x161/run-simulation.sh)
  is a script containing the commands below

Use **iverilog** to compile the verilog to a vvp format
which is used by the vvp runtime simulation engine,

```bash
iverilog -o jeff_74x161_tb.vvp jeff_74x161_tb.v jeff_74x161.vh
```

Use **vvp** to run the simulation, which checks the UUT
and creates a waveform dump file *.vcd.

```bash
vvp jeff_74x161_tb.vvp
```

The output of the test,

```text
TEST START --------------------------------

                 | TIME(ns) | CLR_BAR | LD_BAR | ENT | ENP | D | C | B | A | QD | QC | QB | QA | RCO |
                 -------------------------------------------------------------------------------------
   0             |        0 |    1    |   1    |  0  | 0  | x  | x | x | x | x  | x  | x  | x  | 0   |
   1       CLEAR |       25 |    0    |   1    |  0  | 0  | x  | x | x | x | x  | x  | x  | x  | 0   |
   1       CLEAR |       30 |    0    |   1    |  0  | 0  | x  | x | x | x | 0  | 0  | 0  | 0  | 0   |
   2      LOAD-9 |       45 |    1    |   0    |  0  | 0  | 1  | 0 | 0 | 1 | 0  | 0  | 0  | 0  | 0   |
   2      LOAD-9 |       50 |    1    |   0    |  0  | 0  | 1  | 0 | 0 | 1 | 1  | 0  | 0  | 1  | 0   |
   3      WAIT-1 |       65 |    1    |   1    |  0  | 0  | x  | x | x | x | 1  | 0  | 0  | 1  | 0   |
   4      WAIT-2 |       85 |    1    |   1    |  0  | 0  | x  | x | x | x | 1  | 0  | 0  | 1  | 0   |
   5      WAIT-3 |      105 |    1    |   1    |  0  | 0  | x  | x | x | x | 1  | 0  | 0  | 1  | 0   |
   6     COUNT-9 |      125 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 0  | 1  | 0   |
   6     COUNT-9 |      130 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 0  | 0   |
   7    COUNT-10 |      145 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 0  | 0   |
   7    COUNT-10 |      150 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 1  | 0   |
   8    COUNT-11 |      165 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 1  | 0   |
   8    COUNT-11 |      170 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 1  | 0  | 0  | 0   |
   9      WAIT-4 |      185 |    1    |   1    |  0  | 0  | x  | x | x | x | 1  | 1  | 0  | 0  | 0   |
  10      WAIT-5 |      205 |    1    |   1    |  0  | 0  | x  | x | x | x | 1  | 1  | 0  | 0  | 0   |
  11    COUNT-12 |      225 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 1  | 0  | 0  | 0   |
  11    COUNT-12 |      230 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 1  | 0  | 1  | 0   |
  12    COUNT-13 |      245 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 1  | 0  | 1  | 0   |
  12    COUNT-13 |      250 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 1  | 1  | 0  | 0   |
  13      LOAD-9 |      265 |    1    |   0    |  0  | 0  | 1  | 0 | 0 | 1 | 1  | 1  | 1  | 0  | 0   |
  13      LOAD-9 |      270 |    1    |   0    |  0  | 0  | 1  | 0 | 0 | 1 | 1  | 0  | 0  | 1  | 0   |
  14     COUNT-9 |      285 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 0  | 1  | 0   |
  14     COUNT-9 |      290 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 0  | 0   |
  15    COUNT-10 |      305 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 0  | 0   |
  15    COUNT-10 |      310 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 1  | 0   |
  16    COUNT-11 |      325 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 0  | 1  | 1  | 0   |
  16    COUNT-11 |      330 |    1    |   1    |  1  | 1  | x  | x | x | x | 1  | 1  | 0  | 0  | 0   |
  17       CLEAR |      345 |    0    |   1    |  0  | 0  | x  | x | x | x | 1  | 1  | 0  | 0  | 0   |
  17       CLEAR |      350 |    0    |   1    |  0  | 0  | x  | x | x | x | 0  | 0  | 0  | 0  | 0   |
```

## VIEW WAVEFORM

Open the waveform file jeff_74x161_tb.vcd file with GTKWave,

```bash
gtkwave -f jeff_74x161_tb.vcd &
```

Save your waveform to a .gtkw file.

Now you can use the script
[launch-gtkwave.sh](https://github.com/JeffDeCola/my-verilog-examples/blob/master/launch-GTKWave-script/launch-gtkwave.sh)
anytime you want,

```bash
gtkwave -f jeff_74x161_tb.gtkw &
```

![jeff_74x161-waveform.jpg](../../../docs/pics/sequential-logic/jeff_74x161-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

The above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
