#!/bin/bash

#SBATCH -c 1
#SBATCH --time=0:10:00
#SBATCH --job-name=learnability

#SBATCH -p short
#SBATCH --mem=10G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="v3"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=1
n_training_steps=10
n_testing_steps=10
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000
epochs=1000
agent="BoltzmannAgent"

trainingenv_mean=0
trainingenv_std=0.1
trainingenv_ghost_name=("RandomGhost" "RandomGhost") 
trainingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name[0]}'","args":'${trainingenv_ghost_args[0]}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
echo $trainingenv_ghostarg

agentprop='{"test":{"pacman":{},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
echo $agentprop

folder="_trial_learnability_${agent}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''

python statistics.py -m l -p $agent -q -l $layout -a $agentprop -s '{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"timeout":30}' -o $outputname
