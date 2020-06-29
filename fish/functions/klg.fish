function klg
    kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
    fzf | read -l pod;
    kubectl logs -f $pod    
end
