#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o jeff-74x157-tb.vvp jeff-74x157-tb.v jeff-74x157-headerfiles.vh'"
iverilog -o jeff-74x157-tb.vvp jeff-74x157-tb.v jeff-74x157-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./jeff-74x157-tb.vvp'"
./jeff-74x157-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "