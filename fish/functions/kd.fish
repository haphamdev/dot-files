function kd -d "Describe k8s pod"
    argparse 'n/namespace=' -- $argv

    if test $status -ne 0
        return 255
    end

    if set -q _flag_namespace
        set -l namespace (get_k8s_namespace $_flag_namespace)
        set arg_namespace '-n' $namespace
    end

    if test $status -ne 0
        err "Namespace not found." 
        return (k8s_errors NAMESPACE_NOT_FOUND)
    end

    set pod (get_k8s_pod $arg_namespace $argv[1])
    set arg_pod '-p' $pod

    if test $status -ne 0
        err "Pod not found"
        return (k8s_errors POD_NOT_FOUND)
    end

    kubectl describe pods/$pod $arg_namespace
end
