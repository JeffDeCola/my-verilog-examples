# jk-flip-flop example

_A positive edge jk flip-flop with asynchronous clear._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

The main code,

```verilog
always @ (posedge clk or negedge clr) begin
    if (~clr) begin
        q <= 1'b0;
    end else begin
        case({j,k})
            2'b0_0 : q <= q;
            2'b0_1 : q <= 1'b0;
            2'b1_0 : q <= 1'b1;
            2'b1_1 : q <= ~q;
        endcase
    end
end
```

The entire code is
[jk-flip-flop.v](jk-flip-flop.v).

## RUN (SIMULATE)

I used my testbench
[jk-flip-flop-tb.v](jk-flip-flop-tb.v) with
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

![jk-flip-flop-waveform.jpg](../../../docs/pics/jk-flip-flop-waveform.jpg)
