#!/bin/bash -l
#SBATCH --job-name=install
#SBATCH --account=
#SBATCH --output=outputr%j.txt
#SBATCH --error=errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1000


# load job configuration
cd $SLURM_SUBMIT_DIR
source ../config.sh

# create environment
source $CONDA/etc/profile.d/conda.sh

# create drep environment
conda create --name drep
conda install -c bioconda drep




