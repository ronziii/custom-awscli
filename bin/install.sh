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
  echo_stderr "File not found: ${CREDENTIALS}"
  show_usage
  exit 3
fi

#
# Export region as an environment variable
export AWS_DEFAULT_REGION=$(awk -F '=' '/AWS_REGION/ {print $2}' $CREDENTIALS)

#
# Export access key and secret as environment variables
#
for VAR in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY ; do 
  eval $(awk -F '=' -v var="$VAR" '$0 ~ var {print "export "var"="$2}' $CREDENTIALS)
done
 
echo "Application has been installed"
