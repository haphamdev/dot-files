# Select a project in $HOME/projects using fuzzy search and open a new Tmux window

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
    'subscription-service-client-library'

set project_aliases \
    'APS' \
    'CB-CLI' \
    'CBS' \
    '.' \
    'CDOS' \
    'INV' \
    'Monolith' \
    'Subs Monitor' \
    'SMS' \
    'FAS' \
    'FAS client lib'

ls $HOME/projects | tr " " "\n" | fzf --border --height=95% --reverse --header='Please choose a project:' | read result

if test -z $result
    tmux display-message "Aborted or project not found!"
    return 1
end

tmux neww -c "$HOME/projects/$result"

# rename the new tmux window
if set -l index (contains -i -- $result $projects)
    tmux rename-window $project_aliases[$index]
else 
    tmux rename-window $result
end
