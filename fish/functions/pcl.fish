#!/usr/bin/env fish

function pcl
    function choose_target_directory
        set base_dir ~/projects

        # Get subdirectory names only
        set -l options (ls -d $base_dir/*/ 2>/dev/null | xargs -n 1 basename)

        if test (count $options) -eq 0
            echo "No subdirectories found in $base_dir. Please create one first."
            return 1
        end

        # Use fzf to pick a directory name
        set -l selected (printf "%s\n" $options | fzf --height=10 --layout=reverse --prompt="Select target directory: ")

        if test -z "$selected"
            echo "No selection made. Aborting."
            return 1
        end

        echo "$base_dir/$selected"
    end

    if test (count $argv) -ne 1
        echo "Usage: pcl <git-repo-url>"
        return 1
    end

    set repo_url $argv[1]
    set repo_name (basename -s .git $repo_url)
    set target_parent_dir (choose_target_directory)

    if test $status -ne 0
        return 1
    end

    set target_dir "$target_parent_dir/$repo_name"

    if test -d "$target_dir"
        echo "Directory '$target_dir' already exists. Aborting."
        return 1
    end

    echo "Cloning $repo_url to $target_dir"

    git clone "$repo_url" "$target_dir"
    if test $status -ne 0
        echo "Git clone failed."
        return 1
    end

    cd "$target_dir"
    echo "Changed directory to $target_dir"
end
