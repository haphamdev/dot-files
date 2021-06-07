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

    set result "$HOME/projects/$result"

    switch "$argv[1]"
        case code c
            code $result
        case e o v vim nvim
            nvim $result
        case '*'
            cd $result
        end
end
