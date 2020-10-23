function grs -d "Reset --hard current local branch to the remote branch"
    git branch --show-current | read current_branch
    echo "Your current branch is '$current_branch'"
    read -P "Are you sure to reset it to 'origin/$current_branch' (Y/n)? " confirm

    if test $confirm != 'Y'
        echo "Aborting..."
        return
    end

    git reset --hard origin/$current_branch
end
