# d-flip-flop example

_A basic, synchronous and asynchronous d-flip-flop._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/d-flip-flop)
repo._

<p align="center">
    <img src="svgs/d-flip-flop.svg"
    align="middle"
</p>

## VERILOG CODE

A basic, synchronous and asynchronous d-flip-flop,

```verilog
// D FLIP-FLOP
always @ (posedge clk) begin
    q_1 <= d;
    q_bar_1 <= !d;
end

// D FLIP-FLOP WITH SYNCHRONOUS RESET
always @ (posedge clk) begin
    if (rst) begin
        q_2 <= 1'b0;
        q_bar_2 <= 1'b1;
    end else begin
        q_2 <= d;
        q_bar_2 <= !d;
    end
end

// D FLIP-FLOP WITH ASYNCHRONOUS RESET
always @ (posedge clk or posedge rst) begin
    if (rst) begin
        q_3 <= 1'b0;
        q_bar_3 <= 1'b1;
    end else begin
        q_3 <= d;
        q_bar_3 <= !d;
    end
end
```

The entire code is
[d-flip-flop.v](d-flip-flop.v).

## RUN (SIMULATE)

I used my testbench
[d-flip-flop-tb.v](d-flip-flop-tb.v) with
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
