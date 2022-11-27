#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o encoder-8-3-tb.vvp encoder-8-3-tb.v encoder-8-3-headerfiles.vh'"
iverilog -o encoder-8-3-tb.vvp encoder-8-3-tb.v encoder-8-3-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./encoder-8-3-tb.vvp'"
./encoder-8-3-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "