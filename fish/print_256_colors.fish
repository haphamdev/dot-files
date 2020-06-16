#!/usr/local/bin/fish
set current_dir (dirname (status --current-filename))
set print_color_script $current_dir/print_256_colors.bash

if not test -e $print_color_script
    echo "Downloading script..."
    curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ -o $print_color_script
end

bash $print_color_script
