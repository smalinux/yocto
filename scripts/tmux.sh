#!/bin/bash

# SMA How to use me:
#  $ ./tmux.sh

# SMA Why?
# Because it's just borint to lose your workspace everytime,
# And It is super important to restore it as quick as you can if you lost it.
# Automate. reduse your brain cycles...

# SMA Thanks to ChatGPT,
# Prompt:
   # tmux bash script for open new session called Yocto and open inside it many
   # windows and every window has two pane

# I wish read $ man tmux. but when I have time...

# How to add new window & pane?
# dublicate # (TEMPLATE) parts


###############################################################################
# Configurations
################
# Session name

SESSION="Yocto"

PANE1_1="/home/smalinux/repos/yocto/"
PANE1_2="/home/smalinux/repos/yocto/"

PANE2_1="/home/smalinux/repos/yocto/"
PANE2_2="/home/smalinux/repos/yocto/"

PANE3_1="/home/smalinux/repos/yocto/"
PANE3_2="/home/smalinux/repos/yocto/"

PANE4_1="/home/smalinux/repos/yocto/"
PANE4_2="/home/smalinux/repos/yocto/"

# (TEMPLATE)
#PANE4_1="/home/smalinux/repos/yocto/"
#PANE4_2="/home/smalinux/repos/yocto/"

###############################################################################
# tmux
################
# Check if the session already exists
tmux has-session -t $SESSION 2>/dev/null
if [ $? -eq 0 ]; then
  echo "Session '$SESSION' already exists. Attaching..."
  tmux attach -t $SESSION
  exit 0
fi

# Window #1: Code
# Create a new session, detached
tmux new-session -d -s $SESSION -n "Code"
tmux send-keys -t $SESSION:1.1 "cd $PANE1_1" C-m
tmux split-window -h -t $SESSION:1
tmux send-keys -t $SESSION:1.2 "cd $PANE1_2" C-m

# Create Window #2: build
tmux new-window -t $SESSION -n "build"
tmux send-keys -t $SESSION:2.1 "cd $PANE2_1" C-m
tmux split-window -h -t $SESSION:$i
tmux send-keys -t $SESSION:2.2 "cd $PANE2_2" C-m

# Create Window #3: target
tmux new-window -t $SESSION -n "Target"
tmux send-keys -t $SESSION:3.1 "cd $PANE3_1" C-m
tmux split-window -h -t $SESSION:$i
tmux send-keys -t $SESSION:3.2 "cd $PANE3_2" C-m

# Create Window #4: tig
tmux new-window -t $SESSION -n "tig"
tmux send-keys -t $SESSION:4.1 "cd $PANE4_1" C-m
tmux split-window -h -t $SESSION:$i
tmux send-keys -t $SESSION:4.2 "cd $PANE4_2" C-m

# (TEMPLATE)
## Create Window #4: tig
#tmux new-window -t $SESSION -n "tig"
#tmux send-keys -t $SESSION:4.1 "cd $PANE4_1" C-m
#tmux split-window -h -t $SESSION:$i
#tmux send-keys -t $SESSION:4.2 "cd $PANE4_2" C-m
###############################################################################

# Attach to the session
tmux attach -t $SESSION
