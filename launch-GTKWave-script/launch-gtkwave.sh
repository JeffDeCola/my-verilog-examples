#!/bin/sh -e
# my-systemverilog-examples launch-gtkwave.sh

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
if [ "${machine}" = "Linux" ]
then
    if grep -q Microsoft /proc/version
    then
        machine=Windows
    fi
fi

#############################
# PART III - KICK OFF GTKWAVE
#############################

echo ""
if [ ${machine} = "Windows" ]
then
    # WINDOWS WSL
    echo "Windows 10 Bash Detected"
    echo "Launching gtkWAVE in the background"
    echo 'Using command: cmd.exe /K "C:/Program Files/gtkwave-3.3.100-bin-win32/gtkwave/bin/gtkwave.exe" -f' "${name}"'-tb.gtkw &' 
    echo ""
    cmd.exe /K "C:/Program Files/gtkwave-3.3.100-bin-win32/gtkwave/bin/gtkwave.exe" -f "${name}"-tb.gtkw &
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
