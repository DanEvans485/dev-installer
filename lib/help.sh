#!/bin/bash

function tmlhelp() {
  local commands=(
    'tmlhelp' 'Lists all available commands'
    'tmlbin' 'Bins everything you hold dear'
    'tmlship' 'Ships all of your code without warning'
  )

  clear

  local maxCmdLength=0;
  local maxDescLength=0;

  for i in ${!commands[@]}; do
    if !(($i % 2)); then
      local cmdLen=${#commands[$i]}
      local descLen=${#commands[$i + 1]}

      if (($cmdLen > maxCmdLength)); then
        maxCmdLength=$cmdLen;
      fi

      if (($descLen > maxCmdLength)); then
        maxDescLength=$descLen;
      fi
    fi
  done

  printf "%s" "┌─ Tml Help "
  for ((i=1; i<=($maxCmdLength + $maxDescLength) - 6; i++)); do
    printf "%s" "─"
  done
  printf "%s\n" "┐"

  for i in ${!commands[@]}; do
    if !(($i % 2)); then
      local cmd=${commands[$i]}
      local desc=${commands[$i + 1]}

      local extraCmdSpace=$(($maxCmdLength - ${#cmd}))
      local extraDescSpace=$(($maxDescLength - ${#desc}))

      printf "%s" "│ $cmd"
      for ((i=1; i<=$extraCmdSpace; i++)); do
        printf " "
      done
      printf "%s" " - $desc"
      for ((i=1; i<=$extraDescSpace; i++)); do
        printf "%s" " "
      done
      printf "%s\n" " │"
    fi
  done

  printf "%s" "└"
  for ((i=1; i<=($maxCmdLength + $maxDescLength) + 5; i++)); do
    printf "%s" "─"
  done
  printf "%s\n\n" "┘"
}

tmlhelp


# Corners
# ┌ ┐└ ┘

# Lines
# ─ │

# T Joins
# ├ ┤ ┬ ┴ 

# Cross Joins
# ┼

# ═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬
