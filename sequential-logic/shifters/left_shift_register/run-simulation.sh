#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o left_shift_register_tb.vvp left_shift_register_tb.v left_shift_register.vh'"
iverilog -o left_shift_register_tb.vvp left_shift_register_tb.v left_shift_register.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp left_shift_register_tb.vvp'"
vvp left_shift_register_tb.vvp
echo " "

echo "Now you can open the waveform file left_shift_register_tb.vcd with GTKWave."
echo "gtkwave -f left_shift_register_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
