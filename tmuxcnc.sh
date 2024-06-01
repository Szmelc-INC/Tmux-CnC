#!/bin/bash

# Simple script to start new tmux session with a small bar on the bottom,
# while 90% of screen is split into 4 equal parts.
# Make sure to `source .bashrc` in each pane if you want to use easy alias
# Settings optimized for fullscreen 1920x1080

# Start a new tmux session
tmux new-session -d -s mysession

tmux split-window -v -p 5

tmux send-keys -t  1 'sleep 0.2 && tmux resize-pane -D 4' C-m
tmux send-keys -t  1 'sleep 0.2 && tmux resize-pane -D 4' C-m
tmux send-keys -t  1 'sleep 0.2 && tmux resize-pane -D 2' C-m

tmux select-pane -t 0

tmux split-window -h
tmux select-pane -t 0
tmux split-window -v -p 75
tmux select-pane -t 2
tmux split-window -v -p 75
tmux select-pane -t 4

tmux send-keys -t  0 'sleep 0.2 && source .bashrc && clear' C-m
tmux send-keys -t  1 'sleep 0.2 && source .bashrc && clear' C-m
tmux send-keys -t  2 'sleep 0.2 && source .bashrc && clear' C-m
tmux send-keys -t  3 'sleep 0.2 && source .bashrc && clear' C-m
tmux send-keys -t  4 'sleep 0.2 && source .bashrc && clear' C-m

tmux send-keys -t 0 'echo "Pane 0"' C-m
tmux send-keys -t 1 'echo "Pane 1"' C-m
tmux send-keys -t 2 'echo "Pane 2"' C-m
tmux send-keys -t 3 'echo "Pane 3"' C-m
tmux send-keys -t 4 'echo "Pane 4"' C-m

# Attach to the session
tmux attach-session -t mysession
