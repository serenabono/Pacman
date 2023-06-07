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
semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=2
n_training_steps=0
n_testing_steps=10
epochs=10

max_record=$epochs
min_record=0
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=$epochs

agent="KeyboardAgent"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name="MoveMostlyWestGhost" 
testingenv_ghost_args='{"index":1,"prob":0.1}'

input="./experiment.csv"
userID=$$
echo "userID: $userID"

while IFS= read -r line
do
  testingenv_mean=$(echo "$line" | cut -d "," -f 2)
  testingenv_std=$(echo "$line" | cut -d "," -f 3)
  testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
  testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'
  testingenv_ghostarg='[{"name":"'$testingenv_ghost_name'","args":'$testingenv_ghost_args'}]'
  layout=$(echo "$line" | cut -d "," -f 1)
  
  folder="human_experiments_${layout}_${agent}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}}"
  outputname=''''$folder'/saved_agent_'$layout'_'$agent'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$DATE'-test'''

  agentprop='{"test":{"pacman":{},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
  echo $testingenv_ghostarg
  python statistics.py -m l -p $agent -a $agentprop -l $layout -s '''{"epochs":'$epochs',"trained_agents":'$training_agents',"n_training_steps":'$n_training_steps',"n_testing_steps":'$n_testing_steps',"record_range":'$record_range',"run_untill":'$run_untill',"timeout":30}''' -o  $outputname

done < "$input"