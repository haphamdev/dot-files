#!/usr/local/bin/fish
function back_up_k8s_var -d "Back up all k8s variable"
    set -g MY_K8S_BCK_NAMESPACE $MY_K8S_NAMESPACE 
    set -g MY_K8S_BCK_POD $MY_K8S_POD 
    set -g MY_K8S_BCK_CONTAINER $MY_K8S_CONTAINER 
end

function ifzf_search -d "Interactive fuzzy search"
    # Args: header, values

    set header $argv[1]
    set -e argv[1]
    set values $argv

    string split ' ' $values | fzf --border --header="$header" --height=15 --reverse
end

function fzf_search -d "Non-interactive fuzzy search"
    # Args: keyword, values

    set keyword $argv[1]
    set -e argv[1]
    set values $argv

    string split ' ' $values | fzf --filter $keyword | head -n1
end

function get_pod_list -d "Get the list of K8s pods"
    # Args: namespace
    argparse 'n/namespace=' -- $argv

    if set -q _flag_namespace
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' --namespace $_flag_namespace
    else
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
    end
end

function get_k8s_namespace -d "Pick a K8s namespace using fuzzy search"
    set namespaces (kubectl get namespaces --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

    if test (count $argv) -eq 0
        ifzf_search 'Please select a namespace:' $namespaces
    else
        fzf_search $argv[1] $namespaces
    end
end

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

    set containers (kubectl get pods $_flag_pod $arg_namespace -o jsonpath='{.spec.containers[*].name}')

    if test (count $argv) -gt 0
        fzf_search $argv[1] $containers
    else
        ifzf_search 'Please select a container:' $containers
    end
end

function get_container_logs -d "Get log of a container inside a K8s pod"
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

set -l pod (get_k8s_pod)
echo Pod is $pod
set -l container (get_k8s_container -n default -p $pod ssh)
echo Container is $container
get_container_logs -p $pod -c $container
# get_k8s_namespace de

