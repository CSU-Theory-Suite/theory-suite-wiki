#!/bin/bash
#SBATCH -J censo_workflow-xtb
#SBATCH -p normal
#SBATCH -t 12:00:00
#SBATCH -N 1
#SBATCH --export=NONE
#SBATCH --ntasks-per-node 8

XTBHOME=/opt/apps/xtb
export PATH=$XTBHOME:$PATH
export XTBPATH=${XTBHOME}/share/xtb:${XTBHOME}:${HOME}
export PATH=${PATH}:${XTBHOME}/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${XTBHOME}/lib
export PYTHONPATH=${PYTHONPATH}:${XTBHOME}/python

ulimit -s unlimited
export OMP_STACKSIZE=1G
export OMP_NUM_THREADS=8,1
export OMP_MAX_ACTIVE_LEVELS=1
export MKL_NUM_THREADS=8

xtb BuNA.xyz --opt -c 1 -P 8 > xtb.out
