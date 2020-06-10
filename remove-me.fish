#!/usr/local/bin/fish
function test_arg_parse -d "Testing argument parsing"
    argparse 'h/help=' 'a/action=?' 'l/level=' 'n/name=' 't/type=' -- $argv
    
    echo "h: $_flag_h"
    echo "help: $_flag_help"
    echo "a: $_flag_a"
    echo "action: $_flag_action"
    echo "l: $_flag_l"
    echo "level: $_flag_level"
    echo "n: $_flag_n"
    echo "name: $_flag_name"
    echo "t: $_flag_t"
    echo "type: $_flag_type"

    if set -q _flag_a
        echo _flag_a is set
    end

    if set -q _flag_action
        echo _flag_action is set
    end
    echo $argv
end

test_arg_parse -n this_is_the_name -a --help the-help --type mytype some thing else
