#!/bin/bash

#SBATCH -c 1
#SBATCH --time=12:00:00
#SBATCH --gres=gpu:1
#SBATCH --job-name=Boltz-learn

#SBATCH -p gpu
#SBATCH --mem=30G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu
#SBATCH -w compute-g-16-176

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="v3"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10

mean=0
std=0

epochs=1000
agent="BoltzmannAgent"
noise_args='{"mean":'$mean',"std":'$std'}'
swaps=0.9

min_range=0
max_range=0
record_range='{"min_range":'$min_range',"max_range":'$max_range'}'

run_untill=1000

folder='learnability_'$layout'_{"swaps":'$swaps'}_'$agent''

python statistics.py -q -m l -c $swaps -p $agent -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o ''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''
