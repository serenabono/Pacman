#!/bin/bash

#SBATCH -c 1
#SBATCH --time=5:00:00
#SBATCH --job-name=generalization

#SBATCH -p short
#SBATCH --mem=5G
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

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name="MoveMostlyWestGhost" 
testingenv_ghost_args='{"index":1,"prob":0.1}'
testingenv_ghostarg='[{"name":"'$testingenv_ghost_name'","args":'$testingenv_ghost_args'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_ghostarg


agentprop='{"test":{"pacman":{},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'

folder="learnability_${layout}_${agent}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}}"
outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$DATE'-test'''

python statistics.py -q -m l -r -p $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
