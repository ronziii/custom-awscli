#!/bin/bash


## Source the lib functions
if [ -d "${HOME}"/.ictlife-amazin ]; then
   echo "############"
   echo "source lib functions"
  for f in ~/.ictlife-amazin/lib/*-func; do 
  	source "$f"; done
fi

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
    display_usage
    exit 1
    ;;
esac
done


#
# Parse and display
#

if [[ ! -f "${CREDENTIALS}" ]]; then
  echo_stderr "File not found: '${CREDENTIALS}'"
  exit 3
fi

#
# Export credentials, set as environment variables
#

access_key_id=$(grep -w "AWS_ACCESS_KEY_ID" "${CREDENTIALS}" | sed "s/.*=//g")
access_secret_key=$(grep -w "AWS_SECRET_ACCESS_KEY" "${CREDENTIALS}" | sed "s/.*=//g")
default_region=$(grep -w "AWS_REGION" "${CREDENTIALS}" | sed "s/.*=//g")

echo "Fetched access_key_id: ${access_key_id}"
echo "Fetched secret_key: ${access_secret_key}"
echo "Fetched default_region: ${default_region}"


if  [[ -z  "${access_key_id}" && -z "${access_secret_key}" && -z "${default_region}" ]]; then
	echo_stderr "Failed to get credentials,please check your credentials"
	exit 3
fi

export AWS_ACCESS_KEY_ID="${access_key_id}"
export AWS_SECRET_ACCESS_KEY="${access_secret_key}"
export AWS_DEFAULT_REGION="${default_region}"


#
# Echo the export commands to a new script, credentials.sh and source it to export the env variables 
#
#touch credentials.sh
#echo "#!/bin/bash" >> credentials.sh
#chmod +x credentials.sh
#echo "export AWS_ACCESS_KEY_ID=${access_key_id}" >> credentials.sh
#echo "export AWS_SECRET_ACCESS_KEY=${access_secret_key}" >> credentials.sh
#echo "export AWS_DEFAULT_REGION=${default_region}" >> credentials.sh
#source credentials.sh
