# A function to jump to or open directory in $HOME/projects with vs code or nvim with fuzzy search
function prfzf -d "Go to project in $HOME/projects using fzf search"
    if test (count $argv) -gt 1
        ls $HOME/projects | tr " " "\n" | fzf --filter $argv[2] | read result   
    else
        ls $HOME/projects | tr " " "\n" | fzf --border --height=50% | read result
    end

    if test -z $result
        echo "Aborted or project not found!"
        return 1
    end

    set path "$HOME/projects/$result"

    switch "$argv[1]"
        case code c
            code $path
        case e o v vim nvim
            nvim $path
        case '*'
            cd $path
            tmux rename-window $result
        end
end
