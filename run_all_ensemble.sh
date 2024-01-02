#!/bin/bash
DATE=$(date '+%d:%m:%Y-%H:%M:%S')


semanticDistribution="DistributedNoise"
noiseType="GaussianNoise"
training_agents=500
n_training_steps=10
n_testing_steps=10
max_record=1000
min_record=1000
record_range='{"max":'$max_record',"min":'$min_record'}'
run_untill=1000
epochs=1000
###-------- SEMANTIC ---------------
# SarsaAgent Boltzmann RandomGhostTeleportingNearWalls ---
agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
layout="v2"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Egreedy RandomGhostTeleportingNearWalls ---
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# BoltzmannAgent Egreedy RandomGhostTeleportingNearWalls ---
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhostTeleportingNearWalls" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-------- NON SEMANTIC -------------
# SarsaAgent Boltzmann RandomGhost ---
agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname


testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# BoltzmannAgent Egreedy RandomGhost ---
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Egreedy RandomGhost ---
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Boltzmann RandomGhost ---
agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# BoltzmannAgent Egreedy RandomGhost ---
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Egreedy RandomGhost ---
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("RandomGhost" "RandomGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Boltzmann DirectionalGhost "prob":0.6 ---
agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# BoltzmannAgent Egreedy DirectionalGhost "prob":0.6 ---
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Egreedy DirectionalGhost "prob":0.6 ---
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":0.6}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Boltzmann DirectionalGhost "prob":0.3 ---
agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# SarsaAgent Egreedy DirectionalGhost "prob":0.3 ---
agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

# BoltzmannAgent Egreedy DirectionalGhost "prob":0.3 ---
agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"
layout="v2"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v3"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

layout="v4"
testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

ensebleenv_mean=0
ensebleenv_std=0
ensebleenv_ghost_name=("DirectionalGhost" "DirectionalGhost") 
ensebleenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":0.3}')
ensebleenv_ghostarg='[{"name":"'${ensebleenv_ghost_name[0]}'","args":'${ensebleenv_ghost_args[0]}'}]'
ensebleenv_noise_args='{"mean":'$ensebleenv_mean',"std":'$ensebleenv_std'}'
ensebleenv_perturb='{"noise":'$ensebleenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$ensebleenv_ghostarg',"perturb":'$ensebleenv_perturb'}}'

folder="ensemble_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${ensebleenv_ghost_name}_${ensebleenv_ghost_args}_${ensebleenv_noise_args}"

sbatch runStatistics-ensemble.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
