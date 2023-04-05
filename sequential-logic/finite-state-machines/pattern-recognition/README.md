# PATTERN RECOGNITION EXAMPLE

_Recognize the pattern 00110 in a serial stream._

Table of Contents

* [STATE DIAGRAM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern-recognition#state-diagram)
* [VERILOG CODE](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern-recognition#verilog-code)
* [RUN (SIMULATE)](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern-recognition#run-simulate)
* [CHECK WAVEFORM](https://github.com/JeffDeCola/my-verilog-examples/tree/master/sequential-logic/finite-state-machines/pattern-recognition#check-waveform)

## STATE DIAGRAM

This may help,

![IMAGE - pattern-recognition.jpg - IMAGE](../../../docs/pics/pattern-recognition.jpg)

## VERILOG CODE

The main part of the code is,

```verilog
    // FINITE STATE MACHINE
    always @ (current_state or in) begin
        case (current_state)
            S0: begin
                if (in) next_state <= S10;
                else    next_state <= S0;
            end
            S10: begin
                if (in) next_state <= S110;
                else    next_state <= S0;
            end
            S110: begin
                if (!in) next_state <= S0110;
                else    next_state <= S0;
            end
            S0110: begin
                if (!in) next_state <= S00110;
                else    next_state <= S0;
            end
            S00110:begin
                if (in) next_state <= S10;
                else    next_state <= S0;
            end
        endcase
    end
```

The entire code is
[pattern-recognition.v](pattern-recognition.v).

## RUN (SIMULATE)

I used my testbench
[pattern-recognition-tb.v](pattern-recognition-tb.v) with
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

![pattern-recognition-waveform.jpg](../../../docs/pics/pattern-recognition-waveform.jpg)
