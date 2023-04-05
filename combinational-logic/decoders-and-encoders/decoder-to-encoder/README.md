# DECODER TO ENCODER EXAMPLE

_Combining the
[decoder-3-8](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-3-8)
to the
[encoder-8-3](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/encoder-8-3)
to prove the input will equal
the output._

Table of Contents

* [SCHEMATIC](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-to-encoder#schematic)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-to-encoder#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-to-encoder#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/combinational-logic/decoders-and-encoders/decoder-to-encoder#check-waveform)

## SCHEMATIC

This may help,

![IMAGE - decoder-to-encoder.jpg - IMAGE](../../../docs/pics/decoder-to-encoder.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
wire  [7:0] connect;

decoder_3_8 DECODER_3_8 (
    .in(in),
    .out(connect)
);

encoder_8_3 ENCODER_8_3 (
    .in(connect),
    .out(out)
);
```

The entire code is
[decoder-to-encoder.v](decoder-to-encoder.v).

## RUN (SIMULATE)

I used my testbench
[decoder-to-encoder-tb.v](decoder-to-encoder-tb.v) with
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

![decoder-to-encoder-waveform.jpg](../../../docs/pics/decoder-to-encoder-waveform.jpg)
