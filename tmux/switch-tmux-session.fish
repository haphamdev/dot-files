#!/opt/homebrew/bin/fish

tmux switch-client -t (tmux list-session | awk -F: '{print $1}' | grep -v (tmux display-message -p '#S') | fzf --reverse --header="Select Tmux Session:"; or exit 0)

