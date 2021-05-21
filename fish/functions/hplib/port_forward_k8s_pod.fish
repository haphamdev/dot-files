function port_forward_k8s_pod -d "Port-forward a k8s pod"
    argparse 'n/namespace=' 'p/pod=' 'P/port=' -- $argv

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    if not set -q _flag_pod
        return (k8s_errors POD_MISSING)
    end

    if not set -q _flag_port
        return (k8s_errors PORT_MISSING)
    end

    echo "🚀 Forwarding port $_flag_port for pod '$_flag_pod'"
    kubectl port-forward $arg_namespace $_flag_pod $_flag_port
end
