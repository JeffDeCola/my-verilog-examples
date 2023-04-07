#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o priority-arbiter-tb.vvp priority-arbiter-tb.v priority-arbiter-headerfiles.vh'"
iverilog -o priority-arbiter-tb.vvp priority-arbiter-tb.v priority-arbiter-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./priority-arbiter-tb.vvp'"
./priority-arbiter-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "