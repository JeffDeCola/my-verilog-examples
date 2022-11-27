#!/bin/sh -e
# my-verilog-examples run-test.sh

echo "**********************************************************************"
echo "* run-test.sh (START) ************************************************"
echo "**********************************************************************"
echo " "

echo "First we synthesis to our output *.vvp."
echo " "

echo "'iverilog -o mux-to-demux-tb.vvp mux-to-demux-tb.v mux-to-demux-headerfiles.vh'"
iverilog -o mux-to-demux-tb.vvp mux-to-demux-tb.v mux-to-demux-headerfiles.vh
echo " "

echo "Now we run simulation to create the waveform file *.vcd."
echo " "

echo "'./mux-to-demux-tb.vvp'"
./mux-to-demux-tb.vvp
echo " "

echo "Now you can open the waveform file *.vcd with GTKWave."
echo " "

echo "**********************************************************************"
echo "* run-test.sh (END) **************************************************"
echo "**********************************************************************"
echo " "