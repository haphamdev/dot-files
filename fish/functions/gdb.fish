function gdb --description "Delete a git branch with fzf"
    git rev-parse --is-inside-work-tree 2> /dev/null 1>&2
    set -l git_error $status
    if test $git_error -ne 0
        echo 'Not in git repository'
        return
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

    echo "Deleting branch '$branch_name'"
    git branch -D $branch_name
end

