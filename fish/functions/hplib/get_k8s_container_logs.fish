function get_k8s_container_logs -d "Get log of a container inside a K8s pod"
    # Args: n/namespace, p/pod, c/container

    argparse 'n/namespace=' 'p/pod=' 'c/container=' -- $argv

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    if not set -q _flag_pod
        echo "Missing pod. Aborted" >&2
        return 1
    end

    if set -q _flag_container
        set arg_container '--container' $_flag_container
    end

    echo "kubectl logs pods/$_flag_pod $arg_container $arg_namespace"
    kubectl logs pods/$_flag_pod $arg_container $arg_namespace
end
