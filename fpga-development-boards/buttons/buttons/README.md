# buttons example

_A few different ways to use buttons on a FPGA development board._

Documentation and reference,

* [Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
  on some designs to synthesize and program an FPGA on a development board.
* These buttons used in a FPGA with my
  [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## VERILOG CODE

I designed a few buttons. The entire code is
[buttons.v](buttons.v).

### PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED

```verilog
    reg lock = 0;

    always @ (posedge clk) begin
        if (pressed & ~lock) begin              // BUTTON PRESSED
            lock <= 1'b1;                       // - Lock
            out <= 1'b1;                        // - Pulse
        end else if (~pressed & lock) begin     // BUTTON RELEASED
            lock <= 1'b0;                       // - Release Lock
        end else begin
            out <= 1'b0;
        end
    end
```

### TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW

```verilog
    reg lock = 0;
    reg toggle = 0;

    assign out = toggle;

    always @ (posedge clk) begin
        if (pressed & ~lock) begin              // BUTTON PRESSED
            lock <= 1'b1;                       // - Lock
            toggle <= ~toggle;                   // - toggle
        end else if (~pressed & lock) begin     // BUTTON RELEASED
            lock <= 1'b0;                       // - Release Lock
        end
    end
```

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
