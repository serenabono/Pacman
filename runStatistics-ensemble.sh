#!/bin/bash

#SBATCH -c 1
#SBATCH --time=4:00:00
#SBATCH --job-name=ensemble

#SBATCH -p short
#SBATCH --mem=10G
#SBATCH -o slurm_outputs_scripts/hostname_%j.out
#SBATCH -e slurm_outputs_scripts/hostname_%j.err
#SBATCH --mail-user=serena.bono@childrens.harvard.edu

DATE=$(date '+%d:%m:%Y-%H:%M:%S')
layout="v2"
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10

epochs=1000
agent="BoltzmannAgent"
max_record=1000
min_record=990
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name="RandomGhost" 
testingenv_ghost_args='{"index":1,"prob":{}}'
testingenv_ghostarg='[{"name":"'$testingenv_ghost_name'","args":'$testingenv_ghost_args'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_ghostarg

ensebleenv_mean=0
ensebleenv_std=0.2
ensebleenv_ghost_name="RandomGhost" 
ensebleenv_ghost_args='{"index":1,"prob":{}}'
ensebleenv_ghostarg='[{"name":"'$ensebleenv_ghost_name'","args":'$ensebleenv_ghost_args'}]'
ensebleingenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_noise_args='{"noise":'$ensebleingenv_noise_args',"perm":{}}'
echo $ensembleingenv_ghostarg

agentprop='{"test":{"pacman":{},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"pacman":{},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_noise_args'}}'

run_untill=1000

folder="ensemble_${layout}_${agent}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$semanticDistribution'_'$noiseType'-'$training_agents'-'$ensebleingenv_noise_args'-test-'$RANDOM'-'$DATE''''

python statistics.py -q -m e -p $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
