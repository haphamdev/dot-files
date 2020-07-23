function gco
    if test (count $argv) -gt 0
        git for-each-ref --format='%(refname:short)' | fzf --filter $argv[1] | sed -E 's|origin/||' | read branch_name
    else
        git for-each-ref --format='%(refname:short)' | fzf --height=40% --border | sed -E 's|origin/||' | read branch_name
    end

    if test -z "$branch_name"
        echo "Branch not found"
        return
    end

    echo "Checking out branch '$branch_name'"
    git checkout $branch_name
end
