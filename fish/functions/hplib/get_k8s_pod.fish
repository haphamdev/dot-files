function get_k8s_pod -d "Pick a K8s pod using fuzzy search"
    # Args: n/namespace, p/pod
    argparse 'n/namespace=' -- $argv

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    if test $status -ne 0
        return (k8s_errors NAMESPACE_NOT_FOUND)
    end

    set pods (get_pod_list $arg_namespace)

    if test $status -ne 0 -o (count $pods) -eq 0  
        return (k8s_errors POD_NOT_FOUND)
    end

    if test (count $argv) -gt 0
        set pod (fzf_search $argv[1] $pods)
    else
        set pod (ifzf_search 'Please select a pod:' $pods)
    end

    if test -z $pod
        return (k8s_errors POD_NOT_FOUND)
    else
        echo $pod
    end
end
