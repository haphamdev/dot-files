function get_k8s_namespace -d "Pick a K8s namespace using fuzzy search"
    set namespaces (kubectl get namespaces --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

    if test (count $argv) -eq 0
        ifzf_search 'Please select a namespace:' $namespaces
    else
        fzf_search $argv[1] $namespaces
    end
end
