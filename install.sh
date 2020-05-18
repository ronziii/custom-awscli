#!/bin/bash

export PATH="$PATH:$HOME/.bash-my-aws/bin"


## Source functions
if [ -d ${HOME}/.ictlife-mvc ]; then
  for f in ~/.ictlife-mvc/lib/*-func; do source $f; done
fi

