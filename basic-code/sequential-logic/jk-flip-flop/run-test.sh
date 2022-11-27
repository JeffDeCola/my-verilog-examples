#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o jk-flip-flop-tb.vvp jk-flip-flop-tb.v jk-flip-flop-headerfiles.vh'"
iverilog -o jk-flip-flop-tb.vvp jk-flip-flop-tb.v jk-flip-flop-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./jk-flip-flop-tb.vvp'"
./jk-flip-flop-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "