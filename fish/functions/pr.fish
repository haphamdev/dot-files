# A funtion to jump to or open a directory in $HOME/projects using vs code or nvim with auto completion.
function pr -d "Go to project in ,HOME/projects"
    switch $argv[1]
        case o e v vim nvim
            nvim $HOME/projects/$argv[2]
        case c code vscode 
            code $HOME/projects/$argv[2]
        case '*'
            cd $HOME/projects/$argv[2]
        end
end

set -l project_paths (ls -d $HOME/projects/*/ | sed -E 's|\/$||' | sed -E 's|.*\/||')
complete -f -c pr -a "$project_paths"

