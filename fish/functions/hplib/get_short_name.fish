function get_short_name
    set -l long_name $argv[1]

    # Map of repo-name:short-name
    set -l mappings \
        'repeat-shopping-cart:shopping-cart' \
        'repeat-payment:payment' \
        'repeat-tournament-entry-scores:te-scores' \
        'repeat-rewards:rewards' \
        'repeat-web:web' \
        'repeat-mobile-app:mobile-app' \
        'repeat-twitch-api:twitch-api' \
        'repeat-orders:orders' \
        'repeat-game-statistics-api:stats-api' \
        'repeat-notifications:notifications' \
        'repeat-system-tests:system-tests'

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
