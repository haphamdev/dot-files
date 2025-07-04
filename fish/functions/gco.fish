function gco
    git rev-parse --is-inside-work-tree 2>/dev/null 1>&2
    set -l git_error $status
    if test $git_error -ne 0
        echo 'Not in git repository'
        return
    end

    set -l has_change (git status --porcelain)
    if test -n "$has_change"
        read -P "Stash current change (y/n)? " stash_change

        if test $status -ne 0
            echo Cancelled
            return 1
        end

        if test $stash_change = y
            git stash
        end
    end

    if test (count $argv) -gt 0
        git for-each-ref --format='%(refname:short)' | fzf --filter $argv[1] | sed -E 's|origin/||' | read branch_name
    else
        git for-each-ref --format='%(refname:short)' | fzf --height=40% --border | sed -E 's|origin/||' | read branch_name
    end

    if test $status -ne 0
        echo "Cancelled or no branch was selected"
        return 1
    end

    echo "Checking out branch '$branch_name'"
    git checkout $branch_name
end
