#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o moore_state_machine_tb.vvp moore_state_machine_tb.v moore_state_machine.vh'"
iverilog -o moore_state_machine_tb.vvp moore_state_machine_tb.v moore_state_machine.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp moore_state_machine_tb.vvp'"
vvp moore_state_machine_tb.vvp
echo " "

echo "Now you can open the waveform file moore_state_machine_tb.vcd with GTKWave."
echo "gtkwave -f moore_state_machine_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
