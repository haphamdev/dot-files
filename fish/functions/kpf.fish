function kpf -d "Port-forward for a k8s pod with fzf search"
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

    if test (count $argv) -lt 2
        err "Pod and port are required"
        return (k8s_errors NOT_ENOUGH_ARGUMENT)
    end

    set pod (get_k8s_pod $arg_namespace $argv[1])
    set arg_pod '-p' $pod

    set arg_port '-P' $argv[2]


    if test $status -ne 0
        err "Pod not found"
        return (k8s_errors POD_NOT_FOUND)
    end

    port_forward_k8s_pod $arg_namespace $arg_pod $arg_port

end
