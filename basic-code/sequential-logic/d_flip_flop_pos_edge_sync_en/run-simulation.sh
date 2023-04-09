#!/bin/sh -e
# my-verilog-examples run-simulation.sh

echo "**********************************************************************"
echo "* run-simulation.sh (START) ******************************************"
echo "**********************************************************************"
echo " "

echo "STEP 1 - COMPILE THE VERILOG CODE TO VVP FORMAT"
echo "Use icarus iverilog to compile your verilog to *.vvp format."
echo " "

echo "'iverilog -o d_flip_flop_pos_edge_sync_en_tb.vvp d_flip_flop_pos_edge_sync_en_tb.v d_flip_flop_pos_edge_sync_en.vh'"
iverilog -o d_flip_flop_pos_edge_sync_en_tb.vvp d_flip_flop_pos_edge_sync_en_tb.v d_flip_flop_pos_edge_sync_en.vh
echo " "

echo "STEP 2 - RUN THE SIMULATION USING VVP"
echo "Use vpp, the icarus runtime simulation engine, to create the waveform dump file *.vcd."
echo " "

echo "'vpp d_flip_flop_pos_edge_sync_en_tb.vvp'"
vvp d_flip_flop_pos_edge_sync_en_tb.vvp
echo " "

echo "Now you can open the waveform file d_flip_flop_pos_edge_sync_en_tb.vcd with GTKWave."
echo "gtkwave -f d_flip_flop_pos_edge_sync_en_tb.vcd &"
echo " "

echo "**********************************************************************"
echo "* run-simulation.sh (END) ********************************************"
echo "**********************************************************************"
echo " "
