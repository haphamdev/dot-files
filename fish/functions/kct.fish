function kct -d "Switch k8s context"
    if test (count $argv) -gt 0
        ls ~/.kube/ | grep "yml" | fzf --height=10 --filter $argv[1] | read selection
    else
        ls ~/.kube/ | grep "yml" | fzf --height=10 | read selection
    end

    set -g KUBECONFIG "/Users/hapham/.kube/$selection"
    echo "Selected k8s context: $KUBECONFIG"
end
