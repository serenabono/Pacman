#!/bin/bash

#SBATCH -c 1
#SBATCH --time=5:00:00
#SBATCH --job-name=Boltz-genr

#SBATCH -p short
#SBATCH --mem=10G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="v3"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10

mean=0
std=0.9

epochs=2000
agent="BoltzmannAgent"
noise_args='{"mean":'$mean',"std":'$std'}'
swaps=0
swaps_args='{"swaps":'$swaps'}'

min_range=0
max_range=0
record_range='{"min_range":'$min_range',"max_range":'$max_range'}'

run_untill=2000

folder="newTrainingMethod_${layout}_${noise_args}_${agent}"
noiseoutputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''

folder='newTrainingMethod_'$layout'_{"swaps":'$swaps'}_'$agent''
swapsoutputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$training_agents'-'$swaps_args'-test-'$RANDOM'-'$DATE''''

python statistics.py -q -m m -p $agent -n $noise_args -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o $noiseoutputname