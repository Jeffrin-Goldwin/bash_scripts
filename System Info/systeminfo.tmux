#!/usr/bin/env bash
SESSION="systeminfo"
FILE="systeminfo.sh"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux new-session -d -s "$SESSION" -c "$(pwd)"

  # left pane: open systeminfo.sh in vim
  tmux send-keys -t "$SESSION" "printf '\033]2;EDITOR\033\\'; vim $FILE" C-m

  # right pane: sandbox for testing commands
  tmux split-window -h -t "$SESSION" -c "$(pwd)"
  tmux send-keys -t "$SESSION" "printf '\033]2;CMD SANDBOX\033\\'; clear" C-m

  # show pane titles
  tmux set-option -t "$SESSION" pane-border-status top
  tmux set-option -t "$SESSION" pane-border-format "#{pane_title}"

  # focus back on vim pane
  tmux select-pane -t "$SESSION.0"
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "$SESSION"
else
  tmux attach-session -t "$SESSION"
fi
