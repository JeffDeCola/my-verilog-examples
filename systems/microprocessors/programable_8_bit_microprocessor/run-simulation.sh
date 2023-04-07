#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o programable_8_bit_microprocessor_tb.vvp programable_8_bit_microprocessor_tb.v programable_8_bit_microprocessor.vh'"
iverilog -o programable_8_bit_microprocessor_tb.vvp programable_8_bit_microprocessor_tb.v programable_8_bit_microprocessor.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp programable_8_bit_microprocessor_tb.vvp'"
vvp programable_8_bit_microprocessor_tb.vvp
echo " "

echo "Now you can open the waveform file programable_8_bit_microprocessor_tb.vcd with GTKWave."
echo "gtkwave -f programable_8_bit_microprocessor_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
