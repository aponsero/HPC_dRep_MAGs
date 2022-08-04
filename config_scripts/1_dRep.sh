#!/bin/bash -l
#SBATCH --job-name=dRep
#SBATCH --account=
#SBATCH --output=errout/outputr%j.txt
#SBATCH --error=errout/errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=16:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=4000


# load job configuration
cd $SLURM_SUBMIT_DIR
source config_scripts/config.sh

# load environment
source $CONDA/etc/profile.d/conda.sh
conda activate drep 

# echo for log
echo "job started"; hostname; date

# Get folder with all fasta to compare
cd $IN_DIR

if [ ! -d $OUT_DIR ]; then
  mkdir -p $OUT_DIR;
fi

# run drep
dRep compare $OUT_DIR -g *.fa --S_algorithm fastANI --multiround_primary_clustering -sa $SA -nc $NC

# echo for log
echo "job done"; date

