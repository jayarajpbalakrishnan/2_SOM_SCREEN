#!/bin/bash
#PBS -q gpuq
#PBS -o logfile.log
#PBS -e errorfile.err
#PBS -l nodes=6:ppn=1:gpus=1
#PBS -N Gromacs-test
cd $PBS_O_WORKDIR
sh run_on_nodes.sh

