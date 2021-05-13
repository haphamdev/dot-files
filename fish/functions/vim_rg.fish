function vim_rg -d 'A helper function to use RipGrep in vim with glob supported'
    set -l query $argv[1]

    set -l queries (string match -r '@(\S+)\s+(.+)' $query)
    set -l ex_queries (string match -r '!(\S+)\s+(.+)' $query)

    if test -n "$queries"
        rg --column --line-number --no-heading --color=always --smart-case --iglob $queries[2] -- $queries[3] || true
    else if test -n "$ex_queries"
        rg --column --line-number --no-heading --color=always --smart-case --iglob !$ex_queries[2] -- $ex_queries[3] || true
    else
        rg --column --line-number --no-heading --color=always --smart-case -- $query || true
    end
end
