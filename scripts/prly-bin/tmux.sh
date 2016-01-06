#!/bin/bash

c1=$1; shift
c2=$1; shift
if [[ -z "$c1" ]]; then
    echo "Usage <c1> <c2>"
    exit 0
fi


dir=$(dirname $0)

tmux new-session -d -s presently
tmux set-option mouse-select-pane on
tmux set-option prefix C-a
tmux set-option prefix2 F10
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "$c1" C-m

tmux select-pane -t 1
tmux send-keys "$c2" C-m

tmux attach-session -t presently
