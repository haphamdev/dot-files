#!/usr/local/bin/fish

if not test -e ./print_256_colors.bash
    echo "Downloading script..."
    curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ -o ./print_256_colors.bash
end

bash ./print_256_colors.bash
