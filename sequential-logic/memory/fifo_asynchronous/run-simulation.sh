#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o fifo_asynchronous_tb.vvp fifo_asynchronous_tb.v fifo_asynchronous.vh'"
iverilog -o fifo_asynchronous_tb.vvp fifo_asynchronous_tb.v fifo_asynchronous.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp fifo_asynchronous_tb.vvp'"
vvp fifo_asynchronous_tb.vvp
echo " "

echo "Now you can open the waveform file fifo_asynchronous_tb.vcd with GTKWave."
echo "gtkwave -f fifo_asynchronous_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
