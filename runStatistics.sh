#!/bin/bash

#SBATCH -c 1
#SBATCH --time=12:00:00
#SBATCH --gres=gpu:1
#SBATCH --job-name=DQN-gen

#SBATCH -p gpu
#SBATCH --mem=40G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu
#SBATCH -w compute-g-16-175

DATE=$(date '+%d:%m:%Y-%H:%M:%S');
layout="v3"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=250
n_training_steps=40
n_testing_steps=10
mean=0
std=0
epochs=4000
agent="PacmanDQN"

noise_args='{"mean":'$mean',"std":'$std'}'
folder="generalization_${layout}_${noise_args}_${agent}"

python statistics.py -q -m t -p $agent -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"timeout":30}''' -o ''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
