#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o t_flip_flop_tb.vvp t_flip_flop_tb.v t_flip_flop.vh'"
iverilog -o t_flip_flop_tb.vvp t_flip_flop_tb.v t_flip_flop.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp t_flip_flop_tb.vvp'"
vvp t_flip_flop_tb.vvp
echo " "

echo "Now you can open the waveform file t_flip_flop_tb.vcd with GTKWave."
echo "gtkwave -f t_flip_flop_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
