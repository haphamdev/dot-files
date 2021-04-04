function get_k8s_container -d "Get container of a K8s pod using fuzzy search"
    # Args: n/namespace, p/pod, container
    argparse 'n/namespace=' 'p/pod=' -- $argv

    if not set -q _flag_pod
        return (k8s_errors POD_MISSING)
    end

    if set -q _flag_namespace
        set arg_namespace '--namespace' $_flag_namespace
    end

    set containers (kubectl get pods $_flag_pod $arg_namespace -o jsonpath='{.spec.containers[*].name}' | string split ' ' --no-empty)

    if test $status -ne 0
        return (k8s_errors CONTAINER_NOT_FOUND) 
    end

    if test (count $containers) -eq 1
        echo $containers
        return
    elif 
        return (k8s_errors CONTAINER_NOT_FOUND)
    end

    if test (count $argv) -gt 0
        set container (fzf_search $argv[1] $containers)
    else
        set container (ifzf_search 'Please select a container:' $containers)
    end
    
    if test -z $container
        return (k8s_errors CONTAINER_NOT_FOUND)
    else
        echo $container
    end
end
