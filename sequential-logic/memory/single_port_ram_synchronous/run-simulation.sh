#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o single_port_ram_synchronous_tb.vvp single_port_ram_synchronous_tb.v single_port_ram_synchronous.vh'"
iverilog -o single_port_ram_synchronous_tb.vvp single_port_ram_synchronous_tb.v single_port_ram_synchronous.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp single_port_ram_synchronous_tb.vvp'"
vvp single_port_ram_synchronous_tb.vvp
echo " "

echo "Now you can open the waveform file single_port_ram_synchronous_tb.vcd with GTKWave."
echo "gtkwave -f single_port_ram_synchronous_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
