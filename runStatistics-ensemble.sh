#!/bin/bash

#SBATCH -c 1
#SBATCH --time=5:00:00
#SBATCH --job-name=ensemble

#SBATCH -p short
#SBATCH --mem=15G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=150
n_training_steps=10
n_testing_steps=10
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000
epochs=1000
agent="BoltzmannAgent"

layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_ghostarg

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'
echo $ensebleenv_perturb


agentprop='{"test":{"pacman":{},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'
echo $agentprop

folder="ensemble_${agent}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''

python statistics.py -m e -p $agent -l $layout -q -a $agentprop -s '{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"timeout":30}' -o $outputname
