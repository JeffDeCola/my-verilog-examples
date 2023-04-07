#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o jeff_74x377_tb.vvp jeff_74x377_tb.v jeff_74x377.vh'"
iverilog -o jeff_74x377_tb.vvp jeff_74x377_tb.v jeff_74x377.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp jeff_74x377_tb.vvp'"
vvp jeff_74x377_tb.vvp
echo " "

echo "Now you can open the waveform file jeff_74x377_tb.vcd with GTKWave."
echo "gtkwave -f jeff_74x377_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
