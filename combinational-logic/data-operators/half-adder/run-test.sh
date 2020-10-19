#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o half-adder-tb.vvp half-adder-tb.v'"
iverilog -o half-adder-tb.vvp half-adder-tb.v 
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./half-adder-tb.vvp'"
./half-adder-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "