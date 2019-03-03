#!/bin/sh

#use staclass partition
#SBATCH --partition=staclass

#use two cores to get some pipeline parallelism
#SBATCH --cpus-per-task=2

# Name the job 
#SBATCH --job-name=hw5.py

python hw5.py
