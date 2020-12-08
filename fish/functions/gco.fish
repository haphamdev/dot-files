function gco
    set -l has_change (git status --porcelain)
    if test -n "$has_change"
        read -P "Stash current change (y/n)? " stash_change

        if test $stash_change = 'y'
            git stash
        end
    end

    if test (count $argv) -gt 0
        git for-each-ref --format='%(refname:short)' | fzf --filter $argv[1] | sed -E 's|origin/||' | read branch_name
    else
        git for-each-ref --format='%(refname:short)' | fzf --height=40% --border | sed -E 's|origin/||' | read branch_name
    end

    if test -z "$branch_name"
        echo "Aborted"
        return
    end

    echo "Checking out branch '$branch_name'"
    git checkout $branch_name
end
