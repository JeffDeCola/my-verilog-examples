#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o encoder_to_decoder_tb.vvp encoder_to_decoder_tb.v encoder_to_decoder.vh'"
iverilog -o encoder_to_decoder_tb.vvp encoder_to_decoder_tb.v encoder_to_decoder.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp encoder_to_decoder_tb.vvp'"
vvp encoder_to_decoder_tb.vvp
echo " "

echo "Now you can open the waveform file encoder_to_decoder_tb.vcd with GTKWave."
echo "gtkwave -f encoder_to_decoder_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
