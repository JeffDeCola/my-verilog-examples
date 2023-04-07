#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o simple_pipeline_tb.vvp simple_pipeline_tb.v simple_pipeline.vh'"
iverilog -o simple_pipeline_tb.vvp simple_pipeline_tb.v simple_pipeline.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp simple_pipeline_tb.vvp'"
vvp simple_pipeline_tb.vvp
echo " "

echo "Now you can open the waveform file simple_pipeline_tb.vcd with GTKWave."
echo "gtkwave -f simple_pipeline_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
