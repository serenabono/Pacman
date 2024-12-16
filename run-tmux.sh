#!/bin/bash

for i in {15..20}
do
  tmux new-session -d -s "learnabilityv3_$i" "source ~/miniconda3/etc/profile.d/conda.sh && conda activate pacman_env && bash runStatistics-learnability.sh"
  echo "Started process $i in tmux session session_$i with pacman_env activated"
done