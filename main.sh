#!/bin/bash


iam-users() {

	if [[ "$#" -lt 2 ]]; then
		show_usage
		exit 1
	fi

	if [[ $1 == "-c" ]]; then
		validate_file "$2"
	else 
		show_usage
		exit 1
	fi

	aws iam list-users    \
    	--output text       \
    	--query '
      	Users[].[
        	UserName,
        	UserId,
        	CreateDate
    	]'
 }


show_usage() {
	echo "#################"
	echo "Show Usage:"
}

validate_file() {
	echo "#####################"
	echo "Checking if file exists!"
	echo "#####################"

	if [[ -f "$CREDENTIAL_FILE" ]]; then
		echo "File exists! Initialize credential variables"
		#export_variable "$CREDENTIAL_FILE"
	else 
		echo "File path provided does not exist!"
		exit 1
	fi

	return
}

 iam-users