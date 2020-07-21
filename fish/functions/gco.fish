function gco
    git for-each-ref --format='%(refname:short)' | fzf --height=40% --border | sed -E 's|origin/||' | read -l branch_name
    git checkout $branch_name
end
