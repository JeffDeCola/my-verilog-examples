#!/bin/sh -e
# my-verilog-examples launch-gtkwave.sh

#######################
# PART I - GET FILENAME
#######################

name=$1

##########################
# PART II - DETECT MACHINE
##########################

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=macOS;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Refine if Linux is Windows WSL
#if [ "${machine}" = "Linux" ]; then
#    checkforWSL="WSL2"
#    unameOut="$(uname -a)"
#    if echo "$unameOut" | grep "$checkforWSL"; then
#        machine=Windows
#    fi
#fi

#############################
# PART III - KICK OFF GTKWAVE
#############################

echo ""
if [ ${machine} = "Windows" ]
then
    # WINDOWS WSL
    echo "Windows WSL2 Detected - USE WINDOWS GTKWAVE"
    echo "Launching gtkWAVE in the background"
    echo 'Using command: cmd.exe /K "C:/Program Files/gtkwave64/bin/gtkwave.exe" -f' "${name}"'-tb.gtkw &' 
    echo ""
    al -f "${name}"-tb.gtkw &
elif  [ ${machine} = "macOS" ]
then
    # macOS
    echo "macOS Detected"
    echo "Launching gtkWAVE in the background"
    echo "Using command: /Applications/gtkwave.app/Contents/Resources/bin/gtkwave -f ${name}-tb.gtkw &"
    echo ""
    /Applications/gtkwave.app/Contents/Resources/bin/gtkwave -f "${name}"-tb.gtkw &
elif [ ${machine} = "Linux" ]
then
    # LINUX
    echo "Linux Detected"
    echo "Launching gtkWAVE in the background"
    echo "Using command: gtkwave -f ${name}-tb.gtkw &"
    echo ""
    gtkwave -f "${name}"-tb.gtkw & 
else
    # OTHER
    echo "This is a" ${machine} "machine which I don't have GTKWave on"
fi
echo ""

echo "If you are having trouble launching GTKWave"
echo "export DISPLAY=:0"
echo "Run an Xserver with WSL2 - Google it - This is a little bit of work"
echo " "