#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o encoder_8_3_tb.vvp encoder_8_3_tb.v encoder_8_3.vh'"
iverilog -o encoder_8_3_tb.vvp encoder_8_3_tb.v encoder_8_3.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp encoder_8_3_tb.vvp'"
vvp encoder_8_3_tb.vvp
echo " "

echo "Now you can open the waveform file encoder_8_3_tb.vcd with GTKWave."
echo "gtkwave -f encoder_8_3_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
