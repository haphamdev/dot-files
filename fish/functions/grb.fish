function grb -d "Rebase current git branch"
    if test (count $argv) -gt 0
        git for-each-ref --format='%(refname:short)' | grep -v origin | fzf --filter $argv[1] | sed -E 's|origin/||' | read branch_name
    else
        git for-each-ref --format='%(refname:short)' | grep -v origin | fzf --height=40% --border | sed -E 's|origin/||' | read branch_name
    end

    if test -z $branch_name
        echo Aborted
        return
    end

    echo "Rebasing to branch '$branch_name'"
    git rebase -i $branch_name
end
