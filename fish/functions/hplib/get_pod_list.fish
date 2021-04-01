function get_pod_list -d "Get the list of K8s pods"
    # Args: namespace
    argparse 'n/namespace=' -- $argv

    if set -q _flag_namespace
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' --namespace $_flag_namespace
    else
        kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
    end
end
