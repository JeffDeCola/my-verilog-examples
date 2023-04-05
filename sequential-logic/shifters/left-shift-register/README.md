# LEFT SHIFT REGISTER EXAMPLE

_A 4-bit left shift register._

Table of Contents

* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left-shift-register#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left-shift-register#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/shifters/left-shift-register#check-waveform)

## VERILOG CODE

The main part of the code is,

```verilog
reg [3:0] out;

always @ (posedge clk) begin
    if (rst) begin
        out <= 4'b0000;
    end else begin
        out <= {out[2:0], d};
    end
end
```

The entire code is
[left-shift-register.v](left-shift-register.v).

## RUN (SIMULATE)

I used my testbench
[left-shift-register-tb.v](left-shift-register-tb.v) with
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

![left-shift-register-waveform.jpg](../../../docs/pics/left-shift-register-waveform.jpg)
