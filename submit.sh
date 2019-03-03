#!/bin/bash 

#use staclass partition
#SBATCH --partition=staclass

# Use two cores to get some pipeline parallelism
#SBATCH --cpus-per-task=2

# Name the job 
#SBATCH --job-name=hw5.r

Rscript hw5.r
