function kdp -d "Describe a pod"
    kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
    fzf | read -l pod;
    kubectl describe pods/$pod    
end
