function gco
    git for-each-ref --format='%(refname:short)' | fzf | read -l branch_name
    git checkout $branch_name
end
