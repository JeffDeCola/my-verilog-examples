#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o and_gates_tb.vvp and_gates_tb.v and_gates.vh'"
iverilog -o and_gates_tb.vvp and_gates_tb.v and_gates.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp and_gates_tb.vvp'"
vvp and_gates_tb.vvp
echo " "

echo "Now you can open the waveform file and_gates_tb.vcd with GTKWave."
echo "gtkwave -f and_gates_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
