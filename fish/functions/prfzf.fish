# A function to jump to or open directory in $HOME/projects with vs code or nvim with fuzzy search
function prfzf -d "Go to project in $HOME/projects using fzf search"
    if test (count $argv) -gt 1
        ls -d $HOME/projects/*/ | sed -E 's|\/$||' | sed -E 's|.*\/||' | fzf --filter $argv[2] | read result   
    else
        ls -d $HOME/projects/*/ | sed -E 's|\/$||' | sed -E 's|.*\/||' | fzf --border --height=50% | read result
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
