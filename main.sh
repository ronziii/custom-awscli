#!/bin/bash

file="$1"

if [[ -f "$file" ]]; then
	echo "file exists"
else
	echo "file doesnt exist!"
fi


