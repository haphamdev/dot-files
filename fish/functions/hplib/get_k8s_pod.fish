function get_k8s_pod -d "Pick a K8s pod using fuzzy search"
    # Args: n/namespace, p/pod
    argparse 'n/namespace=' -- $argv

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    set pods (get_pod_list $arg_namespace)

    if test (count $argv) -gt 0
        fzf_search $argv[1] $pods
    else
        ifzf_search 'Please select a pod:' $pods
    end
end
