function err -d "Print message to error output"
    echo \uf529 Error: $argv >&2
    echo Stack trace: (status stack-trace) >&2
end
