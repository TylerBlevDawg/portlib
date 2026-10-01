#!/bin/bash

clear

running=1

while [[ $running -eq 1 ]];
do

# read can be done like read -r -p firstVar secondVar

tte --no-color print --print-head-return-speed 7 --print-speed 7 << 'EOF'

========================================
    Porter's Terminal Effect Library
========================================

> To start enter a desired effect!
> To quit, most programs use q, if not, Ctrl+C
> Some effects have options, to see the options
  type the effect then -o after! EX: fire -o
========================================
matrix - Runs a matrix effect
fire - Runs a fire effect
bs - Allows you to select from some cool fake effects
hack - Runs a fake hacking program (Ctrl+C then exit to quit)
inspire - inspiring
flcl - Loops through flcl!
dbz - Plays old dragon ball episodes!
anime - Loops through random anime episodes!
music - Plays music videos!
amb - Plays ambient videos!
command - Run a custom command
exit - exits program
EOF

read -r -p "Enter desired effect: " effect

if [[ "$effect" = "matrix" ]]; then
    cmatrix
elif [[ "$effect" = "fire" ]]; then
    aafire -driver slang -eight
elif [[ "$effect" = "bs" ]]; then
    tte --no-color print --print-head-return-speed 7 --print-speed 7 << 'EOF'

========================================
          Cool fake bullshit
========================================

Select an effect from the list below
mem - Runs a memory dump effect
down - Runs a downloading effect
curate - Runs multiple effects
exit - exits to menu
EOF
    read -r -p "Enter effect: " genEffect
    if [[ "$genEffect" = "mem" ]]; then
        genact -m memdump
    elif [[ "$genEffect" = "down" ]]; then
        genact -m cargo composer
    elif [[ "$genEffect" = "curate" ]]; then
        genact -m cargo composer memdump kernel_compile
    else 
        echo "Exiting program" | tte --no-color print
fi
elif [[ "$effect" = "hack" ]]; then
    hollywood
elif [[ "$effect" = "command" ]]; then
    read -r -p "Enter command: " command
    $command
elif [[ "$effect" = "exit" ]]; then
    echo "Have an absolutely fucking splendid day :)
" | tte print
    running=0
elif [[ "$effect" = "inspire" ]]; then
    echo ""
    fortune | cowsay | tte --no-color print --print-head-return-speed 7 --print-speed 7
elif [[ "$effect" = "dragonball" ]]; then
    read -r -p "Play for a specific time (y/n): " mpvoption
    if [[ "$mpvoption" = "y" ]]; then 
        read -r -p "Enter desired time in seconds: " mpvPlayTime
        mpv dbz.mp4 --fs=yes --vo=wlshm --end="$mpvPlayTime"
        clear
    elif [[ "$mpvoption" = "n" ]]; then 
        mpv dbz.mp4 --fs=yes --vo=wlshm
        clear
    else
        echo "Input not accepted" | tte --no-color print
    fi
elif [[ "$effect" = "music" ]]; then
    read -r -p "Enter desired time in minutes: " mpvPlayTime
    timeout "$mpvPlayTime"m mpv ./musicvideos --fs=yes --vo=wlshm --loop-playlist --shuffle
    clear
else 
    echo "command not accepted"
fi

done

#Effects
#gping, pipes, fortune + cowsay, asciiquarium
