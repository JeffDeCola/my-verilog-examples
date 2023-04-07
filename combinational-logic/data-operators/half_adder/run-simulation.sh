#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o half_adder_tb.vvp half_adder_tb.v half_adder.vh'"
iverilog -o half_adder_tb.vvp half_adder_tb.v half_adder.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp half_adder_tb.vvp'"
vvp half_adder_tb.vvp
echo " "

echo "Now you can open the waveform file half_adder_tb.vcd with GTKWave."
echo "gtkwave -f half_adder_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
