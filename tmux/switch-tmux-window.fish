#!/opt/homebrew/bin/fish
set SELECTED_WINDOW (tmux list-window -F "#{window_index} - #{window_name}" \
    | fzf --reverse --header="Select Tmux Window:" | awk -F- '{print $1}'|  awk '{$1=$1};1')

if test -z "$SELECTED_WINDOW"
    exit 0 #No window was selected, do nothing and exit
end

tmux select-window -t $SELECTED_WINDOW

