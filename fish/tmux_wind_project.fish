# Select a project in $HOME/projects using fuzzy search and open a new Tmux window

set target_dirs $HOME/projects $HOME/projects/practice

# The list of project names and their short-form aliases
set projects \
    'admin-panel-service' \
    'chargebee-cli' \
    'chargebee-service' \
    'dot-files' \
    'company-data-operations-service' \
    'invoice-service' \
    'personio' \
    'subscription-data-monitoring-service' \
    'subscription-management-service' \
    'subscription-service' \
    'subscription-service-client-library' \
    'subscription-service-webhook'

set project_aliases \
    'APS' \
    'CB-CLI' \
    'CBS' \
    'dot' \
    'CDOS' \
    'INV' \
    'Monolith' \
    'Subs Monitor' \
    'SMS' \
    'FAS' \
    'FAS client lib' \
    'SS webhook'

set proj (ls $HOME/projects)
set practice_proj (ls $HOME/projects/practice)

# appending "practice/" to the names of projects in 'practice' directory
for p in $practice_proj;
    set -a proj "practice/$p"
end

echo $proj | tr " " "\n" | grep -v ":" | fzf --border --height=95% --reverse --header='Please choose a project:' | read result

if test -z $result
    tmux display-message "Aborted or project not found!"
    return 1
end

tmux neww -c "$HOME/projects/$result"

# rename the new tmux window
if set -l index (contains -i -- $result $projects)
    tmux rename-window $project_aliases[$index]
else 
    # using 'path basename' to get the last dir name
    tmux rename-window (path basename $result)
end
