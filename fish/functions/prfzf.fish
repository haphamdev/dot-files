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
