function gup -d "Set upstream for a git branch"
    git rev-parse --is-inside-work-tree 2> /dev/null 1>&2
    set -l git_error $status
    if test $git_error -ne 0
        echo 'Not in git repository'
        return
    end

    git branch --show-current | read current_branch
    echo "Your current branch is '$current_branch'"

    git branch -u origin/$current_branch
end
