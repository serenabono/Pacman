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

agent="BoltzmannAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

#-------------
layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#
#

layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#
#

layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

agent="SarsaAgent"
exploration="E_GREEDY"
exploration_name="Egreedy"

#-------------
layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#
#

layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#
#

layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

agent="SarsaAgent"
exploration="BOLTZMANN"
exploration_name="Boltzmann"

#-------------
layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.6}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#
#

layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#
#

layout="v4"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":0.3}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#------------

layout="v3"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

#-----------
layout="v2"

testingenv_mean=0
testingenv_std=0
testingenv_ghost_name=("RandomGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.1
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname

testingenv_mean=0
testingenv_std=0.5
testingenv_ghost_name=("DirectionalGhost" "RandomGhost") 
testingenv_ghost_args=('{"index":1,"prob":{}}' '{"index":2,"prob":{}}')
testingenv_ghostarg='[{"name":"'${testingenv_ghost_name[0]}'","args":'${testingenv_ghost_args[0]}'}]'
testingenv_noise_args='{"mean":'$testingenv_mean',"std":'$testingenv_std'}'
testingenv_perturb='{"noise":'$testingenv_noise_args',"perm":{}}'

agentprop='{"test":{"pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'},"ensemble":{"layout":"'$layout'","pacman":{"exploration_strategy":"'$exploration'"},"ghosts":'$testingenv_ghostarg',"perturb":'$testingenv_perturb'}}'
folder="learnability2agents_${agent}_${exploration_name}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}_${layout}_${testingenv_ghost_name}_${testingenv_ghost_args}_${testingenv_noise_args}"

outputname=''''$folder'/saved_agent_'$agent'_'$layout'_'$testingenv_ghost_name'_'$testingenv_ghost_args'_'$testingenv_noise_args'_'$training_agents'-'$RANDOM'-'$DATE'-train'''
sbatch runStatistics-learnability2agents.sh $agent $layout $agentprop $epochs $training_agents $n_training_steps $n_testing_steps $outputname
