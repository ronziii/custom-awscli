#!/bin/bash


## Source the lib functions
for f in ../lib/*-func; do
  source "$f"
done


## Loop through the arguments passed
for i in "$@"
do
case $i in
    --credentials=*)
    CREDENTIALS="${i#*=}"
    shift # past argument=value
    ;;
    
    --help)
    show_usage
    exit 0
    ;;
    *)
    # unknown option
    echo "Unknown option $1"
    show_usage
    exit 1
    ;;
esac
done


#
# Parse the file passed
#

if [[ ! -f "${CREDENTIALS}" ]]; then
  echo_stderr "File not found: '${CREDENTIALS}'"
  show_usage
  exit 3
fi

#
# Export credentials from the file provided
#
access_key_id=$(grep -w "AWS_ACCESS_KEY_ID" "${CREDENTIALS}" | sed "s/.*=//g")
access_secret_key=$(grep -w "AWS_SECRET_ACCESS_KEY" "${CREDENTIALS}" | sed "s/.*=//g")
default_region=$(grep -w "AWS_REGION" "${CREDENTIALS}" | sed "s/.*=//g")


#
# If the credentials are empty then exit
#
if  [[ -z  "${access_key_id}" && -z "${access_secret_key}" && -z "${default_region}" ]]; then
	echo_stderr "Failed to get credentials!"
	exit 3
fi


#
# Export credentials as environment variables
#
export AWS_ACCESS_KEY_ID="${access_key_id}"
export AWS_SECRET_ACCESS_KEY="${access_secret_key}"
export AWS_DEFAULT_REGION="${default_region}"

#
echo "Application has been installed"
