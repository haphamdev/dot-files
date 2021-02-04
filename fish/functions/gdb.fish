function gdb --description "Delete a git branch with fzf"
    if test (count $argv) -gt 0
        git for-each-ref --format='%(refname:short)' | fzf --filter $argv[1] | sed -E 's|origin/||' | read branch_name
    else
        git for-each-ref --format='%(refname:short)' | fzf --height=40% --border | sed -E 's|origin/||' | read branch_name
    end

    if test -z "$branch_name"
        echo "Aborted"
        return
    end

    echo "Deleting branch '$branch_name'"
    git branch -D $branch_name
end

