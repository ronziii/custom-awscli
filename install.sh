#!/bin/bash

export PATH="$PATH:$HOME/.ictlife-amazin/bin"


## Source functions
if [ -d "${HOME}"/.ictlife-amazin ]; then
   echo "############"
   echo "source lib functions"
  for f in ~/.ictlife-amazin/lib/*-func; do 
  	sed -i 's/\r//g' "$f" && source "$f"; done
fi



