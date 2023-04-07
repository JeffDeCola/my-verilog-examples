#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o demux-1x4-tb.vvp demux-1x4-tb.v demux-1x4-headerfiles.vh'"
iverilog -o demux-1x4-tb.vvp demux-1x4-tb.v demux-1x4-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./demux-1x4-tb.vvp'"
./demux-1x4-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "