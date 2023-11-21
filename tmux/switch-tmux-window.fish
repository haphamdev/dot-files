#!/opt/homebrew/bin/fish

tmux select-window -t (tmux list-window -F "#{window_index} - #{window_name}" \
    | fzf --reverse --header="Select Tmux Window:" | awk -F- '{print $1}'|  awk '{$1=$1};1')

