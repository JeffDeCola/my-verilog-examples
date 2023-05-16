#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o dual_port_ram_asynchronous_tb.vvp dual_port_ram_asynchronous_tb.v dual_port_ram_asynchronous.vh'"
iverilog -o dual_port_ram_asynchronous_tb.vvp dual_port_ram_asynchronous_tb.v dual_port_ram_asynchronous.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp dual_port_ram_asynchronous_tb.vvp'"
vvp dual_port_ram_asynchronous_tb.vvp
echo " "

echo "Now you can open the waveform file dual_port_ram_asynchronous_tb.vcd with GTKWave."
echo "gtkwave -f dual_port_ram_asynchronous_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
