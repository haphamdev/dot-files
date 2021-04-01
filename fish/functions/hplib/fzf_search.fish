function fzf_search -d "Non-interactive fuzzy search"
    # Args: keyword, values

    set keyword $argv[1]
    set -e argv[1]
    set values $argv

    printf %s\n $values | fzf --filter $keyword | head -n1
end
