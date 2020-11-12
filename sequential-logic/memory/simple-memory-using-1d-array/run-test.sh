#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o simple-memory-using-1d-array-tb.vvp simple-memory-using-1d-array-tb.v simple-memory-using-1d-array-headerfiles.vh'"
iverilog -o simple-memory-using-1d-array-tb.vvp simple-memory-using-1d-array-tb.v simple-memory-using-1d-array-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./simple-memory-using-1d-array-tb.vvp'"
./simple-memory-using-1d-array-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "