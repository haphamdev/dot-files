function grb -d "Rebase current git branch"
    git rev-parse --is-inside-work-tree 2> /dev/null 1>&2
    set -l git_error $status
    if test $git_error -ne 0
        echo 'Not in git repository'
        return
    end

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
