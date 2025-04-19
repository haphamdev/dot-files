function get_short_name
    set -l long_name $argv[1]

    # Map of repo-name:short-name
    set -l mappings \
        'repeat-shopping-cart:rpt-shopping-cart' \
        'repeat-payment:rpt-payment' \
        'repeat-tournament-entry-scores:rpt-tes-scores' \
        'repeat-rewards:rpt-rewards' \
        'xygaming_symfony:rpt-symfony' \
        'repeat-mobile-aapp:rpt-mobile-app' \
        'repeat-twitch-api:rpt-twitch-api' \
        'repeat-orders:rpt-orders'

    for pair in $mappings
        set -l key (string split ':' $pair)[1]
        set -l val (string split ':' $pair)[2]

        if test "$long_name" = "$key"
            echo $val
            return
        end
    end

    # No match: return original
    echo $long_name
end
