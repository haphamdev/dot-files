#!/usr/bin/env fish

function fp
    # Use fd to list all dirs one level under each group
    set -l candidates (fd -td -d1 . ~/projects/*)

    # Filter only those that are Git repos (contain a .git dir)
    set -l repos
    for dir in $candidates
        if test -d "$dir/.git"
            set repos $repos $dir
        end
    end

    # Build menu: show group/repo relative to ~/projects
    set -l menu
    set -l paths

    for repo in $repos
        set relative_path (string replace --regex '^.*/projects/' '' $repo)
        set menu $menu $relative_path
        set paths $paths $repo
    end

    if test (count $argv) -gt 0
        printf "%s\n" $menu | fzf --filter="$argv[1]" | read selected
    else
        printf "%s\n" $menu | fzf --prompt="Select a repository: " --height=10 --layout=reverse | read selected
    end

    if test -n "$selected"
        for i in (seq (count $menu))
            if test "$menu[$i]" = "$selected"
                cd "$paths[$i]"
                wezterm cli set-tab-title (get_short_name (basename $selected))
                return
            end
        end
    end
end
