#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o simple_memory_using_1d_array_tb.vvp simple_memory_using_1d_array_tb.v simple_memory_using_1d_array.vh'"
iverilog -o simple_memory_using_1d_array_tb.vvp simple_memory_using_1d_array_tb.v simple_memory_using_1d_array.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp simple_memory_using_1d_array_tb.vvp'"
vvp simple_memory_using_1d_array_tb.vvp
echo " "

echo "Now you can open the waveform file simple_memory_using_1d_array_tb.vcd with GTKWave."
echo "gtkwave -f simple_memory_using_1d_array_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
