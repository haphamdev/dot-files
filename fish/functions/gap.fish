function gap -d "apply patch to current git repository"
    if test (count $argv) -gt 0
        ls $HOME/git-patches/ | tr " " "\n" | fzf --filter $argv[1] | read result
    else
        ls $HOME/git-patches/ | tr " " "\n" | fzf --border --height=50% | read result   
    end

    if test -z $result
        echo "Aborted or not found"
        return 1
    end

    set -l path "$HOME/git-patches/$result"
    echo "Applying patch '$path'"
    git apply $path
end
