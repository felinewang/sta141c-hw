#!/usr/bin/env python3

#use staclass partition
#SBATCH --partition=staclass

#use two cores to get some pipeline parallelism
#SBATCH --cpus-per-task=2

# Name the job 
#SBATCH --job-name=hw5.r

python hw5.py
