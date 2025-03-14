#!/bin/bash

#SBATCH -c 1
#SBATCH --time=10:00:00
#SBATCH --job-name=generalization

#SBATCH -p short
#SBATCH --mem=10G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="v4"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=300
n_training_steps=100
n_testing_steps=100
max_record=10000
min_record=10000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=10000
epochs=10000
agent="PacmanDQN"
exploration="E_GREEDY"
exploration_name="Egreedy"

trainingenv_mean=0
trainingenv_std=0
trainingenv_ghost_name="RandomGhost" 
trainingenv_ghost_args='{"index":1,"prob":{}}'
trainingenv_ghostarg='[{"name":"'$trainingenv_ghost_name'","args":'$trainingenv_ghost_args'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
echo $trainingenv_ghostarg


echo '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_training_steps":'$n_training_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}'''

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'

folder="generalization_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$trainingenv_ghost_name'_'$trainingenv_ghost_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''

python statistics.py -q -m g -p $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
