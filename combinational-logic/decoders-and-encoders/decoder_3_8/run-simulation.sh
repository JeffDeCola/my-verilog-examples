#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o decoder_3_8_tb.vvp decoder_3_8_tb.v decoder_3_8.vh'"
iverilog -o decoder_3_8_tb.vvp decoder_3_8_tb.v decoder_3_8.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp decoder_3_8_tb.vvp'"
vvp decoder_3_8_tb.vvp
echo " "

echo "Now you can open the waveform file decoder_3_8_tb.vcd with GTKWave."
echo "gtkwave -f decoder_3_8_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
