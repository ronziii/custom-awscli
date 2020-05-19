#!/bin/bash

auth_file="$1"

#validate_file() {
	echo "#####################"
	echo "Checking if file exists!"
	echo "#####################"
	if [[ ! "$#" -eq "1" ]]; then
		echo "Not enough arguments!"
		show_usage
		return 1
		
	fi


	if [[ -f "$auth_file" ]]; then
		echo "File exists! Initialize credentials"
		return 0
	#	auth=$(export_auth "$CREDENTIAL_FILE")
	#	if [[ $auth == "0" ]]; then
	#		echo "auth exported successfully!"
	#		return 0
	#	else
	#		echo "An error occured while fetching auth!"
	#		return 1
	#	fi

	else 
		echo "File path provided does not exist!"
		return 1
	fi

	return
#}

