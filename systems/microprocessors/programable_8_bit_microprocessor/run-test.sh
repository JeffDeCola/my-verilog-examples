#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o programable-8-bit-microprocessor-tb.vvp programable-8-bit-microprocessor-tb.v programable-8-bit-microprocessor-headerfile.vh'"
iverilog -o programable-8-bit-microprocessor-tb.vvp programable-8-bit-microprocessor-tb.v programable-8-bit-microprocessor-headerfile.vh 
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./programable-8-bit-microprocessor-tb.vvp'"
./programable-8-bit-microprocessor-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "