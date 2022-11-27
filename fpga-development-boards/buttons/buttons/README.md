# buttons example

_A few different ways to use buttons on a FPGA development board._

Documentation and reference,

* [Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
  used to synthesize and program an FPGA on a development board.
* These buttons used in a FPGA with my
  [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-verilog-examples/tree/master/systems/microprocessors/programable-8-bit-microprocessor)
* [Digilent ARTY-S7](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/fpga-development-boards/digilent-arty-s7-cheat-sheet)
  FPGA development board
  
[GitHub Webpage](https://jeffdecola.github.io/my-verilog-examples/)

## PRESS AND RELEASE OF THE BUTTON SYNCHRONOUSLY (SYNCHRONOUS PRESS AND RELEASE)

```verilog
    always @ (posedge clk) begin
            if (pressed) begin          // BUTTON PRESSED
                out <= 1'b1;                      
            end else begin              //  BUTTON NOT PRESSED
                out <= 1'b0;
            end
    end
```

I designed a few buttons. The entire code is
[buttons.v](buttons.v).

## PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED (SYNCHRONOUS PRESS)

```verilog
    reg lock = 0;

    always @ (posedge clk) begin
            if (pressed & ~lock) begin              // BUTTON PRESSED
                lock <= 1'b1;                       // - Lock
                out <= 1'b1;                        // - Pulse
            end else if (~pressed & lock) begin     // RELEASE LOCK  
                lock <= 1'b0;            
                out <= 1'b0;
            end else begin
                out <= 1'b0;
            end
    end
```

I designed a few buttons. The entire code is
[buttons.v](buttons.v).

## TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW (SYNCHRONOUS PRESSES)

```verilog
    reg lock = 0;
    reg toggle = 0;

    assign out = toggle;

    always @ (posedge clk) begin
        if (pressed & ~lock) begin              // BUTTON PRESSED
            lock <= 1'b1;                       // - Lock
            toggle <= ~toggle;                  // - Toggle
        end else if (~pressed & lock) begin     // WAIT TILL BUTTON RELEASED
            lock <= 1'b0;                       // - Release Lock
        end
    end
```

I designed a few buttons. The entire code is
[buttons.v](buttons.v).

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
