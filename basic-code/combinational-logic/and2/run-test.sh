#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o and2-tb.vvp and2-tb.v and2-headerfile.vh'"
iverilog -o and2-tb.vvp and2-tb.v and2-headerfile.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./and2-tb.vvp'"
./and2-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "