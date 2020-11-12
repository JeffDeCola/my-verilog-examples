#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o nor2-tb.vvp nor2-tb.v nor2-headerfiles.vh'"
iverilog -o nor2-tb.vvp nor2-tb.v nor2-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./nor2-tb.vvp'"
./nor2-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "