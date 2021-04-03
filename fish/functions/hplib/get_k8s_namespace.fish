function get_k8s_namespace -d "Pick a K8s namespace using fuzzy search"
    set namespaces (kubectl get namespaces --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

    if test $status -ne 0
        err "Namespace not found"
        k8s_errors NAMESPACE_NOT_FOUND
    end

    if test (count $argv) -eq 0
        set namespace (ifzf_search 'Please select a namespace:' $namespaces)
    else
        set namespace (fzf_search $argv[1] $namespaces)
    end

    if test -z $namespace
        err "Namespace not found"
        return (k8s_errors NAMESPACE_NOT_FOUND)
    else
        echo $namespace
    end
end
