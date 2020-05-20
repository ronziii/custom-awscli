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
access_key_id=$(awk -F '=' '/AWS_ACCESS_KEY_ID/ {print $2}' ${CREDENTIALS})
access_secret_key=$(awk -F '=' '/AWS_SECRET_ACCESS_KEY/ {print $2}' ${CREDENTIALS})
default_region=$(awk -F '=' '/AWS_REGION/ {print $2}' ${CREDENTIALS})


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
set AWS_ACCESS_KEY_ID="${access_key_id}"
set AWS_SECRET_ACCESS_KEY="${access_secret_key}"
set AWS_DEFAULT_REGION="${default_region}"

#
echo "Application has been installed"