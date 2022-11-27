#!/bin/bash

#SBATCH -c 1
#SBATCH --time=4:00:00
#SBATCH --gres=gpu:1
#SBATCH --job-name=e_greedy

#SBATCH -p gpu
#SBATCH --mem=20G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu
#SBATCH -w compute-g-16-176

DATE=$(date '+%d:%m:%Y-%H:%M:%S');
layout="v3"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
mean=0
std=1
epochs=1000
agent="BoltzmannAgent"

noise_args='{"mean":'$mean',"std":'$std'}'
folder="generalization_${layout}_${noise_args}_EgreedyAgent"

python statistics.py -q -m s -n $noise_args -p $agent -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"timeout":30}''' -o ''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
