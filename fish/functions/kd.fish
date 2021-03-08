function kd -d "Describe k8s pod"
    echo Please select K8s pod to describe:
    kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' |\
    fzf --height=15| read -l pod;
    echo ✅ $pod is selected

    kubectl describe pods/$pod
end
