#!/bin/bash

for i in {7..14}
do
  tmux new-session -d -s "generalization_$i" "source ~/miniconda3/etc/profile.d/conda.sh && conda activate pacman_env && bash runStatistics-generalization.sh"
  echo "Started process $i in tmux session session_$i with pacman_env activated"
done