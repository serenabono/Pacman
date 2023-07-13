#!/bin/bash

#SBATCH -c 1
#SBATCH --time=8:00:00
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
training_agents=400
n_training_steps=10
n_testing_steps=10

epochs=1000
agent="BoltzmannAgent"
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name="DirectionalGhost" 
testingenv_ghost_args='{"index":1,"prob":0.6}'
testingenv_ghostarg='[{"name":"'$testingenv_ghost_name'","args":'$testingenv_ghost_args'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
echo $testingenv_ghostarg

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name="DirectionalGhost" 
ensebleenv_ghost_args='{"index":1,"prob":0.6}'
ensebleenv_ghostarg='[{"name":"'$ensebleenv_ghost_name'","args":'$ensebleenv_ghost_args'}]'
ensebleingenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_noise_args='{"noise":'$ensebleingenv_noise_args',"perm":{}}'
echo $ensembleingenv_ghostarg

agentprop='{"test":{"pacman":{},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"pacman":{},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_noise_args'}}'

run_untill=1000

folder="allmodes_${layout}_${agent}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleingenv_noise_args}"
filename="${layout}_${agent}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}-test-${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleingenv_noise_args}"
outputname=''''$folder'/'$filename'_end-'$RANDOM'-'$DATE''''

python statistics.py -q -m a -p $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname
