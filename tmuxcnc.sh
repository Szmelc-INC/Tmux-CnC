#!/bin/bash

# Simple script to start new tmux session with a small bar on the bottom,
# while 90% of screen is split into 4 equal parts.
# Make sure to `source .bashrc` in each pane if you want to use easy alias

# Start session
tmux new-session -d -s mysession

# Split window horizontally (90% top, 10% bottom)
tmux split-window -v -p 10
tmux select-pane -t 0
tmux split-window -h
tmux select-pane -t 0
tmux split-window -v
tmux select-pane -t 2
tmux split-window -v
tmux select-pane -t 4

# Clear & echo pane ID
tmux send-keys -t 0 'clear && echo "Pane 0"' C-m
tmux send-keys -t 1 'clear && echo "Pane 1"' C-m
tmux send-keys -t 2 'clear && echo "Pane 2"' C-m
tmux send-keys -t 3 'clear && echo "Pane 3"' C-m
tmux send-keys -t 4 'clear && echo "Pane 4"' C-m

# Attach to the session
tmux attach-session -t mysession
