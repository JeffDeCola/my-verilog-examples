#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesize to our output *.vvp."
echo " "

echo "'iverilog -o and2.vvp and2-tb.v and2.vh'"
iverilog -o and2.vvp and2-tb.v and2.vh
echo " "

echo "Now we run simulation to create the waveform dump file *.vcd."
echo " "

echo "'./and2.vvp'"
./and2.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "