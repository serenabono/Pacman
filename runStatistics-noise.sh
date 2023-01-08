#!/bin/bash

#SBATCH -c 1
#SBATCH --time=5:00:00
#SBATCH --job-name=Boltz-genr

#SBATCH -p short
#SBATCH --mem=5G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="v2bar"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10

mean=0
std=0

ghosttype="MoveMostlyWestGhost"
epochs=1000
agent="BoltzmannAgent"
noise_args='{"mean":'$mean',"std":'$std'}'

min_range=0
max_range=0
record_range='{"min_range":'$min_range',"max_range":'$max_range'}'

run_untill=1000
prob=0.25
ghostarg='{}'
agentprop='{"pacman":{},"ghost":'$ghostarg'}'

folder="learnability_${layout}_${noise_args}_${agent}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$noise_args'-test-'$RANDOM'-'$DATE''''

python statistics.py -q -m l -p $agent -g $ghosttype -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname