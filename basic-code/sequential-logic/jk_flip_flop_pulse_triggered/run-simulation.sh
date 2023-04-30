#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o jk_flip_flop_pulse_triggered_tb.vvp jk_flip_flop_pulse_triggered_tb.v jk_flip_flop_pulse_triggered.vh'"
iverilog -o jk_flip_flop_pulse_triggered_tb.vvp jk_flip_flop_pulse_triggered_tb.v jk_flip_flop_pulse_triggered.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp jk_flip_flop_pulse_triggered_tb.vvp'"
vvp jk_flip_flop_pulse_triggered_tb.vvp
echo " "

echo "Now you can open the waveform file jk_flip_flop_pulse_triggered_tb.vcd with GTKWave."
echo "gtkwave -f jk_flip_flop_pulse_triggered_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
