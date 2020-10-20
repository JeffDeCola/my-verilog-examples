#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o encoder-to-decoder-tb.vvp encoder-to-decoder-tb.v'"
iverilog -o encoder-to-decoder-tb.vvp encoder-to-decoder-tb.v 
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./encoder-to-decoder-tb.vvp'"
./encoder-to-decoder-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "