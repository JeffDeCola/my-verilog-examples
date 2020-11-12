#!/bin/sh -e
# my-systemverilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o simple-pipeline-tb.vvp simple-pipeline-tb.v simple-pipeline-headerfile.vh'"
iverilog -o simple-pipeline-tb.vvp simple-pipeline-tb.v simple-pipeline-headerfile.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./simple-pipeline-tb.vvp'"
./simple-pipeline-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "