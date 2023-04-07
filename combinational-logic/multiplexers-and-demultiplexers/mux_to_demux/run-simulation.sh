#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o mux_to_demux_tb.vvp mux_to_demux_tb.v mux_to_demux.vh'"
iverilog -o mux_to_demux_tb.vvp mux_to_demux_tb.v mux_to_demux.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp mux_to_demux_tb.vvp'"
vvp mux_to_demux_tb.vvp
echo " "

echo "Now you can open the waveform file mux_to_demux_tb.vcd with GTKWave."
echo "gtkwave -f mux_to_demux_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
