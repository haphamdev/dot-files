function print_header
    if test (count $argv) -eq 0
        return
    end
 
    echo
    set_color yellow
    echo $argv[1]
    set_color normal
end
