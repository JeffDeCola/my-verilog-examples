#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o decoder-3-8-tb.vvp decoder-3-8-tb.v decoder-3-8-headerfiles.vh'"
iverilog -o decoder-3-8-tb.vvp decoder-3-8-tb.v decoder-3-8-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./decoder-3-8-tb.vvp'"
./decoder-3-8-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "