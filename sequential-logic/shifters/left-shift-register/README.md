# left-shift-register example

_A 4-bit left shift register._

[GitHub Webpage](https://jeffdecola.github.io/my-verilog-examples/)

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
