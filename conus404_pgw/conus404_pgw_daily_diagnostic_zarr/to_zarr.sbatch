#!/bin/bash
#SBATCH -J c404-pgw_xtrm_zarr
##SBATCH -t 06:00:00
#SBATCH -t 00:50:00
#SBATCH -o %j-c404-pgw_zarr.out
#SBATCH -p cpu
#SBATCH -A mappnat
#SBATCH --nodes=1
#SBATCH --ntasks=1
# #SBATCH --hint=nomultithread
#SBATCH --cpus-per-task=1
#  #SBATCH --array=10-100:10

# STEP should match the stride in the --array argument
export STEP=1
export PATH="$PATH:$HOME/miniforge3/bin"

source activate pangeo_310

echo $SLURM_ARRAY_TASK_ID
python <some_path>/hytest/conus404-pgw_xtrm_processing/xtrm_to_zarr.py --config-file conus404-pgw_xtrm.yml --chunk-index ${SLURM_ARRAY_TASK_ID}
