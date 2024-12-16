#!/bin/bash

semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=1
n_training_steps=10
n_testing_steps=10
max_record=2000
min_record=2000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=2000
epochs=2000

agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"

layout="v2"

trainingenv_mean=0
trainingenv_std=0
trainingenv_ghost_name="RandomGhostTeleportingNearWalls"
trainingenv_ghost_args='{"index":1,"prob":0.2}'
trainingenv_ghostarg='[{"name":"'${trainingenv_ghost_name}'","args":'${trainingenv_ghost_args}'}]'
trainingenv_noise_args='{"mean":'$trainingenv_mean',"std":'$trainingenv_std'}'
trainingenv_perturb='{"noise":'$trainingenv_noise_args',"perm":{}}'
agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$trainingenv_ghostarg',"perturb":'$trainingenv_perturb'}}'
folder="_trial_learnability_${agent}_${exploration_name}_${layout}_${trainingenv_ghost_name}_${trainingenv_ghost_args}_${trainingenv_noise_args}"
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$trainingenv_ghost_name'_'$trainingenv_ghost_args'_'$trainingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''

bash runStatistics-learnability-trial.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
