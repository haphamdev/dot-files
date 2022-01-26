function kct -d "Switch k8s context"
    set -l k8s_configs (ls ~/.kube/ | grep yml)
    set -a k8s_configs local

    if test (count $argv) -gt 0
        printf %s\n $k8s_configs | fzf --height=10 --filter $argv[1] | read selection
    else
        printf %s\n $k8s_configs | fzf --height=10 | read selection
    end

    if test -z $selection
        echo "Aborted or not found"
        return
    end

    if test "$selection" = 'local'
        set -eg KUBECONFIG
        echo 'Using LOCAL k8s context'
        return
    end

    set -xg KUBECONFIG "/Users/hapham/.kube/$selection"
    echo "Using k8s context: $KUBECONFIG"
end
