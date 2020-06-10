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

# A function to jump to or open directory in $HOME/projects with vs code or nvim with fuzzy search
function prfzf -d "Go to project in $HOME/projects using fzf search"
    cd "$HOME/projects"
    ls -d $HOME/projects/*/ | sed -E 's|\/$||' | sed -E 's|.*\/||' | fzf | read -l result

    switch "$argv"
        case code c
            code $result
        case e o v vim nvim
            nvim $result
        case '*'
            cd $result
        end
end

abbr -a pre 'pr e'
abbr -a prc 'pr c'
abbr -a pr 'pr cd'
abbr -a fpe 'prfzf e'
abbr -a fpc 'prfzf c'
abbr -a fp 'prfzf cd'
