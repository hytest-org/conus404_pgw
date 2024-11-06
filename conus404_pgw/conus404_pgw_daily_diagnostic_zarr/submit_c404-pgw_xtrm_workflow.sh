#!/bin/bash -e

MAX_JOBS=10
STEP=10
FIRST_STEP=2
LAST_STEP=640
#LAST_STEP=2617

sbatch --array=${FIRST_STEP}-${LAST_STEP}:${STEP}%${MAX_JOBS} to_zarr.sbatch
