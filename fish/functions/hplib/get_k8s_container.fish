function get_k8s_container -d "Get container of a K8s pod using fuzzy search"
    # Args: n/namespace, p/pod, container
    argparse 'n/namespace=' 'p/pod=' -- $argv

    if not set -q _flag_pod
        echo 'Pod is missing' >&2
        return 1
    end

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    set containers (kubectl get pods $_flag_pod $arg_namespace -o jsonpath='{.spec.containers[*].name}' | string split ' ' --no-empty)

    if test (count $argv) -gt 0
        fzf_search $argv[1] $containers
    else
        ifzf_search 'Please select a container:' $containers
    end
end
