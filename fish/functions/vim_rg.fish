function vim_rg -d 'A helper function to use RipGrep in vim with glob supported'
    set -l queries (string split -m 1 '>' "$argv") # split the glob and keyword, separator is >

    if test (count $queries) -eq 1 # no glob
        rg --column --line-number --no-heading --color=always --smart-case -- $queries[1] || true
    else if test -z "$queries[1]" # glob is empty
        rg --column --line-number --no-heading --color=always --smart-case -- $queries[2] || true
    else
        set globs (string replace -a -r '\s+' ' ' $queries[1]\
            | string trim \
            | string split ' ')

        for g in $globs
            set -a glob_arguments "--iglob '$g'"
        end

        set command (printf 'rg --column --line-number --no-heading --color=always --smart-case %s -- %s || true' "$glob_arguments" $queries[2])
        eval $command
    end
end
