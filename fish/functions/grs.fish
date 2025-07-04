function grs -d "Reset --hard current local branch to the remote branch"
    git rev-parse --is-inside-work-tree 2>/dev/null 1>&2
    set -l git_error $status
    if test $git_error -ne 0
        echo 'Not in git repository'
        return
    end

    git branch --show-current | read current_branch
    echo "Your current branch is '$current_branch'"
    read -P "Are you sure to reset it to 'origin/$current_branch' (Y/n)? " confirm

    if test $status -ne 0
        echo Cancelled
        return 1
    end

    if test $confirm != y
        echo Aborted
        return
    end

    git reset --hard origin/$current_branch
end
