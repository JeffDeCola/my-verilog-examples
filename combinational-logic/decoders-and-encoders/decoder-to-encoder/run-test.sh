#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o decoder-to-encoder-tb.vvp decoder-to-encoder-tb.v'"
iverilog -o decoder-to-encoder-tb.vvp decoder-to-encoder-tb.v 
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./decoder-to-encoder-tb.vvp'"
./decoder-to-encoder-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "