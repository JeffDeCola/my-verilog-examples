#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o mux_4x1_tb.vvp mux_4x1_tb.v mux_4x1.vh'"
iverilog -o mux_4x1_tb.vvp mux_4x1_tb.v mux_4x1.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp mux_4x1_tb.vvp'"
vvp mux_4x1_tb.vvp
echo " "

echo "Now you can open the waveform file mux_4x1_tb.vcd with GTKWave."
echo "gtkwave -f mux_4x1_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
