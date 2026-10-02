#!/bin/bash

clear

running=1
playTime=0

option(){
    read -r -p "Enter intended runtime (in minutes): " playTime
}

runCommand(){
    local cmd="$1"
    local option="$2"
    if [[ $option -eq 1 ]]; then
        option
    fi
    $cmd
    clear
}

playMedia(){
    local target="$1"; shift
    local extra=("$@")
    local choice minutes

    read -r -p "Play for a specific time (y/n): " choice
    if [[ "$choice" = "y" ]]; then
        option
        timeout "${playTime}m" mpv "$target" --fs=yes --vo=wlshm "${extra[@]}"
    else
        mpv "$target" --fs=yes --vo=wlshm "${extra[@]}"
    fi
    clear
}

while [[ $running -eq 1 ]];
do

tte --no-color print --print-head-return-speed 15 --print-speed 15 << 'EOF'

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
inspire - inspiring
yogurt - Unlock your inner potential
amb - Plays ambient videos!
flcl - Loops through flcl!
dbz - Plays old dragon ball episodes!
anime - Loops through random anime episodes!
music - Plays music videos!
command - Run a custom command
exit - exits program
EOF

read -r -p "Enter desired effect: " effect option

if [[ "$effect" = "matrix" ]]; then
    runCommand cmatrix
elif [[ "$effect" = "fire" ]]; then
    runCommand "aafire -driver slang -eight"
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

elif [[ "$effect" = "command" ]]; then
    read -r -p "Enter command: " command
    $command
elif [[ "$effect" = "exit" ]]; then
    echo "Have an absolutely fucking splendid day :)
" | tte print
    running=0
elif [[ "$effect" = "inspire" ]]; then
    echo ""
    runCommand "fortune | cowsay | tte --no-color print --print-head-return-speed 7 --print-speed 7"
elif [[ "$effect" = "amb" ]]; then
    playMedia ./amb --loop-playlist --shuffle
elif [[ "$effect" = "flcl" ]]; then
    playMedia ./flcl --loop-playlist
elif [[ "$effect" = "dbz" ]]; then
    playMedia. ./dbz --loop-playlist --shuffle
elif [[ "$effect" = "anime" ]]; then
    playMedia ./anime --loop-playlist --shuffle
elif [[ "$effect" = "music" ]]; then
    playMedia ./musicvideos --loop-playlist --shuffle
elif [[ "$effect" = "yogurt" ]]; then
    playMedia ./yogurt --loop-playlist
else 
    echo ""
    echo "command not accepted" | tte --no-color print
    sleep 1
fi

clear

done
