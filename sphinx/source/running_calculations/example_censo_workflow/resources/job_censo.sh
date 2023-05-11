#!/bin/bash
#SBATCH -J censo_workflow-censo
#SBATCH -p normal
#SBATCH -t 12:00:00
#SBATCH -N 1
#SBATCH --export=NONE
#SBATCH --ntasks-per-node 16

ulimit -s unlimited
export OMP_STACKSIZE=1G
export OMP_NUM_THREADS=16,1
export OMP_MAX_ACTIVE_LEVELS=1
export MKL_NUM_THREADS=16

export PARA_ARCH=SMP
source $TURBODIR/Config_turbo_env
export PARNODES=16  ## omp
export TM_PAR_FORK=1

PATH=$HOME/scripts:$PATH
PATH=$HOME/CENSO-main:$PATH
export PATH

#Gettimings
start=$(date +%s)
echo "Calculation from $(date)" >> RUNTIME
export PYTHONUNBUFFERED=1

nohup censo -inp crest_conformers.xyz.sorted -chrg 1 -P 4 -O 4 -part2 off > censo.out

end=$(date +%s)
secs=$(expr $end - $start)
printf '%dh:%dm:%02ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60)) >> RUNTIME

