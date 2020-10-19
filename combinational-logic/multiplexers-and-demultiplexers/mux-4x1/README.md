# mux-4x1 example

_Multiplexer - Four inputs, one output._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main part of the code is,

```verilog
reg  y;

always @ ( * ) begin
    case(sel)
        2'b00 : y <= a;
        2'b01 : y <= b;
        2'b10 : y <= c;
        2'b11 : y <= d;
    endcase
 end
```

The entire code is
[mux-4x1.v](mux-4x1.v).

## RUN (SIMULATE)

I used my testbench
[mux-4x1-tb.v](mux-4x1-tb.v) with
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
