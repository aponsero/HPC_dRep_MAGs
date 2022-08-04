#!/bin/bash -l

# load job configuration
source config_scripts/config.sh

#
#makes sure sample file is in the right place
#
if [[ ! -d "$IN_DIR" ]]; then
    echo "$IN_DIR does not exist. Please provide the path for a folder to process. Job terminated."
    exit 1
fi

if [[ ! -d "errout" ]]; then
	mkdir errout
fi


# submit job
echo "launching 1_dRep.sh as a job."

JOB_ID=`sbatch --job-name dRep  config_scripts/1_dRep.sh`

