#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o mealy_state_machine_tb.vvp mealy_state_machine_tb.v mealy_state_machine.vh'"
iverilog -o mealy_state_machine_tb.vvp mealy_state_machine_tb.v mealy_state_machine.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp mealy_state_machine_tb.vvp'"
vvp mealy_state_machine_tb.vvp
echo " "

echo "Now you can open the waveform file mealy_state_machine_tb.vcd with GTKWave."
echo "gtkwave -f mealy_state_machine_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
